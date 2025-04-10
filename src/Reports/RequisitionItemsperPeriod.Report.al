//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511271_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511271) { }
//type("System.IO.Path"; System_IO_Path51511271) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193657 "Requisition Items per Period"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/RequisitionItemsperPeriod.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Item; Item)
        {
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(Item_No; Item."No.")
            {
            }
            column(Item_Description; Item.Description)
            {
                IncludeCaption = true;
            }
            column(Item_Base_Unit_of_Measure; Item."Base Unit of Measure")
            {
            }
            column(RequisitionQuantity; RequisitionQuantity)
            {
            }
            column(QuantityLbl; QuantityLbl)
            {
            }
            column(UnitofMeasureLbl; UnitofMeasureLbl)
            {
            }
            column(Title; Title)
            {
            }
            column(PeriodText; PeriodText)
            {
            }
            column(STRSUBSTNO_Text000_PeriodText; StrSubstNo(Text000, PeriodText))
            {
            }
            trigger OnAfterGetRecord();
            begin
                RequisitionQuantity := 0;
                RequisitionLines.Reset;
                RequisitionLines.SetRange(RequisitionLines.Type, RequisitionLines.Type::Item);
                RequisitionLines.SetRange(RequisitionLines.No, Item."No.");
                RequisitionLines.SetRange(RequisitionLines."Requisition Type", RequisitionLines."requisition type"::"Store Requisition");
                RequisitionLines.SetRange(RequisitionLines."Requisition Date", StartDate, EndDate);
                if RequisitionLines.Find('-') then begin
                    repeat
                        RequisitionQuantity := RequisitionQuantity + RequisitionLines.Quantity;
                    until RequisitionLines.Next = 0;
                end;
            end;

        }
    }
    requestpage
    {
        SaveValues = false;
        layout
        {
            area(Content)
            {
                field(StartDate; StartDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Date';
                }
                field(EndDate; EndDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'End Date';
                }
                field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                {
                    ApplicationArea = Basic;
                    Caption = 'Design';
                    Visible = ReportForNavAllowDesign;
                }
            }
        }

    }

    trigger OnInitReport()
    begin
        //;
        //ReportsForNavInit;

    end;

    trigger OnPostReport()
    begin
        /*
		RequisitionHeader.RESET;
		IF RequisitionHeader.FIND('-') THEN BEGIN
		REPEAT
		 RequisitionLines.RESET;
		 RequisitionLines.SETRANGE(RequisitionLines."Requisition No",RequisitionHeader."No.");
		 IF RequisitionLines.FIND('-') THEN BEGIN
		 REPEAT
		   RequisitionLines."Requisition Date":=RequisitionHeader."Requisition Date";
		   RequisitionLines."Requisition Type":=RequisitionHeader."Requisition Type";
		   RequisitionLines.MODIFY;
		 UNTIL RequisitionLines.NEXT=0;
		 END;
		UNTIL RequisitionHeader.NEXT=0;
		END;
		 */
        //;
        ////ReportForNav.Post;

    end;

    trigger OnPreReport()
    begin
        PeriodText := Format(StartDate) + '..' + Format(EndDate);
        //;
        //ReportsForNavPre;
    end;

    var
        RequisitionHeader: Record "Requisition Header1";
        StartDate: Date;
        EndDate: Date;
        RequisitionQuantity: Decimal;
        RequisitionLines: Record "Requisition Lines1";
        QuantityLbl: label 'Requisitioned Qty';
        UnitofMeasureLbl: label 'Unit of Measure';
        ItemNoLbl: label 'Item No.';
        Title: label 'Store Item Requisitions by Period';
        PeriodText: Text[50];
        Text000: label 'Period:%1';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511271_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511271;
        ReportForNavObject: Variant;
    begin
        addInFileName := ApplicationPath() + 'Add-ins\ReportsForNAV_7_3_0_2559\ForNav.Reports.7.3.0.2559.dll';
        if not File.Exists(addInFileName) then begin
            tempAddInFileName := path.GetTempPath() + '\Microsoft Dynamics NAV\Add-Ins\' + ApplicationSystemConstants.PlatformFileVersion() + '\ForNav.Reports.7.3.0.2559.dll';
            if not File.Exists(tempAddInFileName) then
                Error('Please install the ForNAV DLL version 7.3.0.2559 in your service tier Add-ins folder under the file name "%1"\\If you already have the ForNAV DLL on the server, you should move it to this folder and rename it to match this file name.', addInFileName);
        end;
        ReportForNavObject := //ReportForNav.GetLatest(CurrReport.OBJECTID, CurrReport.Language, SerialNumber, UserId, CompanyName);
        ReportForNav := ReportForNavObject;
        //ReportForNav.Init();
    end;

    //local procedure ReportsForNavPre();
    // begin
    ////ReportForNav.OpenDesigner := ReportForNavOpenDesigner;
    //if not //ReportForNav.Pre() then CurrReport.Quit();
    //end;*/

    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
