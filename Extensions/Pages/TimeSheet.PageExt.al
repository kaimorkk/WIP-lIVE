// PageExtension 52193539 pageextension52193539 extends "Time Sheet"
// {
//     layout
//     {

//         //Unsupported feature: Property Deletion (DecimalPlaces) on "Field1(Control 11)".


//         //Unsupported feature: Property Deletion (DecimalPlaces) on "Field2(Control 15)".


//         //Unsupported feature: Property Deletion (DecimalPlaces) on "Field3(Control 17)".


//         //Unsupported feature: Property Deletion (DecimalPlaces) on "Field4(Control 19)".


//         //Unsupported feature: Property Deletion (DecimalPlaces) on "Field5(Control 21)".

//     }

//     //Unsupported feature: Code Modification on "ValidateQuantity(PROCEDURE 1)".

//     //procedure ValidateQuantity();
//     //Parameters and return type have not been exported.
//     //>>>> ORIGINAL CODE:
//     //begin
//     /*
//     IF (CellData[ColumnNo] <> 0) AND (Type = Type::" ") THEN
//       ERROR(Text001);

//     IF TimeSheetDetail.GET(
//          "Time Sheet No.",
//          "Line No.",
//          ColumnRecords[ColumnNo]."Period Start")
//     THEN BEGIN
//       IF CellData[ColumnNo] <> TimeSheetDetail.Quantity THEN
//         TestTimeSheetLineStatus;

//       IF CellData[ColumnNo] = 0 THEN
//         TimeSheetDetail.DELETE
//       ELSE BEGIN
//         TimeSheetDetail.Quantity := CellData[ColumnNo];
//         TimeSheetDetail.MODIFY(TRUE);
//       END;
//     END ELSE
//       IF CellData[ColumnNo] <> 0 THEN BEGIN
//         TestTimeSheetLineStatus;

//         TimeSheetDetail.INIT;
//         TimeSheetDetail.CopyFromTimeSheetLine(Rec);
//         TimeSheetDetail.Date := ColumnRecords[ColumnNo]."Period Start";
//         TimeSheetDetail.Quantity := CellData[ColumnNo];
//         TimeSheetDetail.INSERT(TRUE);
//       END;
//     */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//     /*
//     #1..17
//     END ELSE BEGIN
//       IF CellData[ColumnNo] <> 0 THEN
//         TestTimeSheetLineStatus;

//       TimeSheetDetail.INIT;
//       TimeSheetDetail.CopyFromTimeSheetLine(Rec);
//       TimeSheetDetail.Date := ColumnRecords[ColumnNo]."Period Start";
//       TimeSheetDetail.Quantity := CellData[ColumnNo];
//       TimeSheetDetail.INSERT(TRUE);
//     END;
//     */
//     //end;
// }

