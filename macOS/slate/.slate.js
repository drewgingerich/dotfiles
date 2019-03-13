// Persistant data

var horizontalSizeFractions = [1/3, 1/2, 2/3, 1];
var verticalSizeFractions = [1/2, 1];

class WindowAlignment {
	constructor () {
		this.horizontalPositionIndex = 0;
		this.verticalPositionIndex = 0;
		this.horizontalSizeIndex = 0;
		this.verticalSizeIndex = 0;
	}
}

var windowAlignments = {};

// The magic

var getWindowAlignment = function(window) {
	if (windowAlignments[window] === undefined) {
		windowAlignments[window] = new WindowAlignment();
	}
	return windowAlignments[window];
}

var cycleHorizontalSize = function () {
	var window = S.window();
	var windowRect = window.rect();
	var screen = window.screen();
	var screenRect = screen.visibleRect();

	var alignment = getWindowAlignment(window);

	var targetIndex = alignment.horizontalSizeIndex;
	targetIndex += 1;
	targetIndex %= horizontalSizeFractions.length;
	alignment.horizontalSizeIndex = targetIndex;

	var targetFraction = horizontalSizeFractions[targetIndex];
	var targetWidth = screenRect.width * targetFraction;

	// Make room for larger window, otherwise resize will fail
	if (screenRect.width - windowRect.x < targetWidth) {
		window.move({ "x": screenRect.width - targetWidth, "y": windowRect.y });
	}

	window.resize({ "width": targetWidth, "height": windowRect.height });
}

var cycleVerticalSize = function () {
	var window = S.window();
	var windowRect = window.rect();
	var screen = window.screen();
	var screenRect = screen.visibleRect();

	var alignment = getWindowAlignment(window);

	var targetIndex = alignment.verticalSizeIndex;
	targetIndex += 1;
	targetIndex %= verticalSizeFractions.length;
	alignment.verticalSizeIndex = targetIndex;

	var targetFraction = verticalSizeFractions[targetIndex];
	var targetHeight = screenRect.height * targetFraction;

	// Make room for larger window, otherwise resize will fail
	if (screenRect.height- windowRect.y < targetHeight) {
		window.move({ "x": windowRect.x, "y": screenRect.height - targetHeight});
	}
	window.resize({ "width": windowRect.width, "height": targetHeight});
}

var cycleHorizontalPosition = function () {
	var window = S.window();
	var windowRect = window.rect();
	var screen = window.screen();
	var screenRect = screen.rect();
	var screenVisibleRect = screen.visibleRect();
	var visibleOffset = screenRect.width - screenVisibleRect.width;

	var numberOfPositions = Math.floor(screenVisibleRect.width / windowRect.width);
	var positionSize = screenVisibleRect.width / numberOfPositions;
	var currentPositionIndex = Math.floor(windowRect.x / positionSize);
	var targetPositionIndex = (currentPositionIndex + 1) % numberOfPositions;
	var targetPosition = targetPositionIndex * positionSize + visibleOffset;
	window.move({"x": targetPosition, "y": windowRect.y});
	if (numberOfPositions > 1)
		window.resize({ "width": positionSize, "height": windowRect.height });
}

var cycleVerticalPosition = function () {
	var window = S.window();
	var windowRect = window.rect();
	var screen = window.screen();
	var screenRect = screen.rect();
	var screenVisibleRect = screen.visibleRect();
	var visibleOffset = screenRect.height - screenVisibleRect.height;

	var numberOfPositions = Math.floor(screenVisibleRect.height / windowRect.height);
	var positionSize = screenVisibleRect.height / numberOfPositions;
	var currentPositionIndex = Math.floor(windowRect.y / positionSize);
	var targetPositionIndex = (currentPositionIndex + 1) % numberOfPositions;
	var targetPosition = targetPositionIndex * positionSize + visibleOffset;
	window.move({ "x": windowRect.x, "y": targetPosition});
	if (numberOfPositions > 1)
		window.resize({ "width": windowRect.width, "height": positionSize });
}

// Wire it all up to Slate, and some configuration

S.cfga({
	"modalEscapeKey": "esc"
});

S.bnda({
	"j:ctrl,alt,shift,cmd,s:toggle": cycleHorizontalSize,
	"k:ctrl,alt,shift,cmd,s:toggle": cycleHorizontalPosition,
	"l:ctrl,alt,shift,cmd,s:toggle": cycleVerticalSize,
	";:ctrl,alt,shift,cmd,s:toggle": cycleVerticalPosition,

	"s:ctrl,alt,shift,cmd,s": S.op("switch"),
	"h:ctrl,alt,shift,cmd,s": S.op("hint"),
	"r:ctrl,alt,shift,cmd,s": S.op("relaunch")
});
