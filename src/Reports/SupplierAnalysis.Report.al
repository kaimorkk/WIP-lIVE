//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511398_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511398) { }
//type("System.IO.Path"; System_IO_Path51511398) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193700 "Supplier Analysis"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/SupplierAnalysis.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Prequalified Suppliers1"; "Prequalified Suppliers1")
        {
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(RefNo; "Prequalified Suppliers1"."Ref No.")
            {
            }
            column(Name; "Prequalified Suppliers1".Name)
            {
            }
            column(Category; "Prequalified Suppliers1".Category)
            {
            }
            column(Selected; "Prequalified Suppliers1".Selected)
            {
            }
            column(Category_Name; "Prequalified Suppliers1"."Category Name")
            {
            }
            column(Company_PIN_No; "Prequalified Suppliers1"."Company PIN No")
            {
            }
            column(Tenders_Purchased; TendersPurchased)
            {
            }
            column(Tenders_Responded; TendersResponded)
            {
            }
            column(Tenders_Rejected; TendersRejected)
            {
            }
            column(Tenders_Awarded; TendersAwarded)
            {
            }
            trigger OnPreDataItem();
            begin
                TendersPurchased := 0;
                TendersResponded := 0;
                TendersAwarded := 0;
                TendersRejected := 0;
                POsAwarded := 0;
                ContractsAwarded := 0;
            end;

            trigger OnAfterGetRecord();
            begin
                Bidders1.Reset;
                Bidders1.SetFilter(Bidders1.Name, '=%1', "Prequalified Suppliers1".Name);
                Bidders1.SetFilter(Bidders1."Receipt No.", '<>%1', '');
                if Bidders1.Find('-') then
                    TendersPurchased := Bidders1.Count;
                SupplierSelection.Reset;
                SupplierSelection.SetFilter(SupplierSelection."Supplier Name", '=%1', "Prequalified Suppliers1".Name);
                //SupplierSelection.SETRANGE(SupplierSelection.Awarded,TRUE);
                if SupplierSelection.Find('-') then
                    TendersResponded := SupplierSelection.Count;
                SupplierSelection.Reset;
                SupplierSelection.SetFilter(SupplierSelection."Supplier Name", '=%1', "Prequalified Suppliers1".Name);
                SupplierSelection.SetRange(SupplierSelection.Awarded, true);
                if SupplierSelection.Find('-') then
                    TendersAwarded := SupplierSelection.Count;
                SupplierSelection.Reset;
                SupplierSelection.SetFilter(SupplierSelection."Supplier Name", '=%1', "Prequalified Suppliers1".Name);
                SupplierSelection.SetRange(SupplierSelection.Awarded, false);
                if SupplierSelection.Find('-') then
                    TendersRejected := SupplierSelection.Count;
            end;

        }
        dataitem(Vendor; Vendor)
        {
            column(ReportForNavId_1000000012; 1000000012) { } // Autogenerated by ForNav - Do not delete
            column(Vendor_No; Vendor."No.")
            {
            }
            column(Vendor_Name; Vendor.Name)
            {
            }
            column(Purchase_Oders_Awarded; POsAwarded)
            {
            }
            column(Contracts_Awarded; ContractsAwarded)
            {
            }
            column(Title; Vendor."Nature of Business")
            {
            }
            trigger OnAfterGetRecord();
            begin
                PurchHeader.Reset;
                PurchHeader.SetRange(PurchHeader."Buy-from Vendor No.", Vendor."No.");
                if PurchHeader.Find('-') then
                    POsAwarded := PurchHeader.Count;
                Contract.Reset;
                Contract.SetRange(Contract."Client StakeHolder", Vendor."No.");
                if Contract.Find('-') then
                    ContractsAwarded := Contract.Count;
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
                group(Options)
                {
                    Caption = 'Options';
                    field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Design';
                        Visible = ReportForNavAllowDesign;
                    }
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
        //;
        ////ReportForNav.Post;
    end;

    trigger OnPreReport()
    begin
        //;
        //ReportsForNavPre;
    end;

    var
        TendersPurchased: Integer;
        TendersRejected: Integer;
        TendersAwarded: Integer;
        TendersResponded: Integer;
        POsAwarded: Integer;
        ContractsAwarded: Integer;
        SupplierSelection: Record "Supplier Selection1";
        PurchHeader: Record "Purchase Header";
        Contract: Record Contract;
        Bidders1: Record Bidders1;
        Title: label 'Supplier Based Analysis ';

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511398_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511398;
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
