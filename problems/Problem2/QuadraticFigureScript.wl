(* QuadraticFigureScript.wl *)
BeginPackage["QuadraticFigureScript`"];

(* Gets the current directory, which should be problems/Problem2 *)
currentDirectory = DirectoryName[
	FileNameJoin[{
		Directory[],
		$ScriptCommandLine[[1]]
	}]
];
(* Automatically gets the name of the output file, problems/Problem2/images/quadraticFigure.jpg *)
figureFilename = FileNameJoin[{
	currentDirectory, "images/quadraticFigure.jpg"
}];

Export[figureFilename,
	Plot[x^2, {x, -10, 10}]
];

EndPackage[];