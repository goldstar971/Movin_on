PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//1902078/124476/2.43/2/3/Capacitor Polarised

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r245_230"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 2.3) (shapeHeight 2.45))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "CAPPM7343X200N" (originalName "CAPPM7343X200N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r245_230) (pt -3.1, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r245_230) (pt 3.1, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -4.5 2.5) (pt 4.5 2.5) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 4.5 2.5) (pt 4.5 -2.5) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 4.5 -2.5) (pt -4.5 -2.5) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -4.5 -2.5) (pt -4.5 2.5) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.65 2.15) (pt 3.65 2.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 3.65 2.15) (pt 3.65 -2.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 3.65 -2.15) (pt -3.65 -2.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.65 -2.15) (pt -3.65 2.15) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -3.65 1) (pt -2.5 2.15) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt 3.65 2.15) (pt -4.25 2.15) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -3.65 -2.15) (pt 3.65 -2.15) (width 0.2))
		)
	)
	(symbolDef "875015119003" (originalName "875015119003")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 0 mils -35 mils) (rotation 0]) (justify "UpperLeft") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 500 mils 0 mils) (rotation 180) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 500 mils -35 mils) (rotation 0]) (justify "UpperRight") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 200 mils -100 mils) (width 6 mils))
		(line (pt 200 mils -100 mils) (pt 230 mils -100 mils) (width 6 mils))
		(line (pt 230 mils -100 mils) (pt 230 mils 100 mils) (width 6 mils))
		(line (pt 230 mils 100 mils) (pt 200 mils 100 mils) (width 6 mils))
		(line (pt 180 mils 50 mils) (pt 140 mils 50 mils) (width 6 mils))
		(line (pt 160 mils 70 mils) (pt 160 mils 30 mils) (width 6 mils))
		(line (pt 100 mils 0 mils) (pt 200 mils 0 mils) (width 6 mils))
		(line (pt 300 mils 0 mils) (pt 400 mils 0 mils) (width 6 mils))
		(poly (pt 300 mils 100 mils) (pt 300 mils -100 mils) (pt 270 mils -100 mils) (pt 270 mils 100 mils) (pt 300 mils 100 mils) (width 10  mils))
		(attr "RefDes" "RefDes" (pt 350 mils 250 mils) (justify 24) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 350 mils 150 mils) (justify 24) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "875015119003" (originalName "875015119003") (compHeader (numPins 2) (numParts 1) (refDesPrefix C)
		)
		(compPin "1" (pinName "+") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "-") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "875015119003"))
		(attachedPattern (patternNum 1) (patternName "CAPPM7343X200N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "Wurth Elektronik")
		(attr "Manufacturer_Part_Number" "875015119003")
		(attr "Mouser Part Number" "710-875015119003")
		(attr "Mouser Price/Stock" "https://www.mouser.com/Search/Refine.aspx?Keyword=710-875015119003")
		(attr "RS Part Number" "1855760")
		(attr "RS Price/Stock" "https://uk.rs-online.com/web/p/products/1855760")
		(attr "Description" "Wurth Elektronik 100uF 6.3V dc Aluminium Polymer Capacitor, Surface Mount 7.3 x 4.3 x 1.9mm +105C 7.3mm")
		(attr "<Hyperlink>" "https://katalog.we-online.com/pbs/datasheet/875015119003.pdf")
		(attr "<Component Height>" "2")
		(attr "<STEP Filename>" "875015119003.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)