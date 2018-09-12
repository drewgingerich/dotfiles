S.cfga({
	"modalEscapeKey" : "esc"
});

var horizontalFractions = [ 1/3, 1/2, 2/3, 1];
var verticalFractions = [1/2, 1];

var descendingNumericSort = function (numericArray) {
	return numericArray.sort(function (a, b) { return a - b });
}

var getNextFraction = function (currentSize, targetFractions, referenceSize) {
	targetFractions = descendingNumericSort(targetFractions);
	targetFractions = targetFractions.map(function (element) {
		return element * referenceSize;
	});

	var targetFractionIndex = 0;
	for (var i = targetFractions.length - 1; i >= 0; i--) {
		if (currentSize >= targetFractions[i]) {
			targetFractionIndex = (i + 1) % targetFractions.length;
			break;
		}
	}
	return targetFractions[targetFractionIndex];
}

var cycleHorizontalSize = function () {
	var window = S.window();
	var windowRect = window.rect();

	var screen = window.screen();
	var screenRect = screen.visibleRect();

	var targetWidth = getNextFraction(windowRect.width, horizontalFractions, screenRect.width);
	if (screenRect.width - windowRect.x < targetWidth) {
		window.move({"x": screenRect.width - targetWidth, "y": windowRect.y});
	}
	window.resize({"width": targetWidth, "height": windowRect.height});
}

var cycleVerticalSize = function () {
	var window = S.window();
	var windowRect = window.rect();

	var screen = window.screen();
	var screenRect = screen.visibleRect();

	var targetHeight = getNextFraction(windowRect.height, verticalFractions, screenRect.height);
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

S.bnda({
	"j:ctrl,alt,shift,cmd,s:toggle": cycleHorizontalSize,
	"k:ctrl,alt,shift,cmd,s:toggle": cycleHorizontalPosition,
	"l:ctrl,alt,shift,cmd,s:toggle": cycleVerticalSize,
	";:ctrl,alt,shift,cmd,s:toggle": cycleVerticalPosition,

	"r:ctrl,alt,shift,cmd,s": S.op("relaunch")
});
