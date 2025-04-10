//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511454_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511454) { }
//type("System.IO.Path"; System_IO_Path51511454) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193732 "Purchase - Quote1"
{
    RDLCLayout = './Layouts/Purchase-Quote1.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Supplier Selection1"; "Supplier Selection1")
        {
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            column(CompanyNameCaption; CompInfo.Name)
            {
            }
            column(CityCaption; CompInfo.City)
            {
            }
            column(TelephoneCaption; CompInfo."Phone No.")
            {
            }
            column(PostCodeCaption; CompInfo."Post Code")
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
                IncludeCaption = true;
            }
            column(ReferenceNo_SupplierSelection1; "Supplier Selection1"."Reference No.")
            {
            }
            column(SupplierName_SupplierSelection1; "Supplier Selection1"."Supplier Name")
            {
            }
            column(ReceiptNo_SupplierSelection1; "Supplier Selection1"."Receipt No.")
            {
                IncludeCaption = true;
            }
            column(DocNumber_Caption; DocNumber)
            {
            }
            column(PostalAddress_Caption; PostalAddress)
            {
            }
            column(PhysicalAddress_Caption; PhysicalAddress)
            {
            }
            column(Date_SupplierSelection1; "Supplier Selection1".Date)
            {
            }
            dataitem("Procurement Request Lines1"; "Procurement Request Lines1")
            {
                DataItemLink = "Requisition No" = field("Reference No.");
                column(ReportForNavId_1000000049; 1000000049) { } // Autogenerated by ForNav - Do not delete
                column(RequisitionNo_ProcurementRequestLines1; "Procurement Request Lines1"."Requisition No")
                {
                }
                column(No_ProcurementRequestLines1; "Procurement Request Lines1".No)
                {
                }
                column(Description_ProcurementRequestLines1; "Procurement Request Lines1".Description)
                {
                }
                column(Quantity_ProcurementRequestLines1; "Procurement Request Lines1".Quantity)
                {
                }
                column(UnitofMeasure_ProcurementRequestLines1; "Procurement Request Lines1"."Unit of Measure")
                {
                }
                column(UnitPrice_ProcurementRequestLines1; "Procurement Request Lines1"."Unit Price")
                {
                }
                column(Amount_ProcurementRequestLines1; "Procurement Request Lines1".Amount)
                {
                }
                column(ProcurementPlan_ProcurementRequestLines1; "Procurement Request Lines1"."Procurement Plan")
                {
                }
                column(ProcurementPlanItem_ProcurementRequestLines1; "Procurement Request Lines1"."Procurement Plan Item")
                {
                }
                column(BudgetLine_ProcurementRequestLines1; "Procurement Request Lines1"."Budget Line")
                {
                }
                column(AmountLCY_ProcurementRequestLines1; "Procurement Request Lines1"."Amount LCY")
                {
                }
                trigger OnPreDataItem();
                begin
                    RecSeq := 0;
                end;

                trigger OnAfterGetRecord();
                begin
                    ThisLNAmt := ThisLNAmt + "Procurement Request Lines1".Amount;
                    RecSeq := RecSeq + 1;
                end;

            }
            trigger OnAfterGetRecord();
            begin
                ProcurementRequest.Reset;
                ProcurementRequest.SetRange(ProcurementRequest.No, "Supplier Selection1"."Reference No.");
                if ProcurementRequest.Find('-') then
                    DocNumber := ProcurementRequest."Document No";
                //supplier address from prequalified supplier1
                PrequalifiedSuppliers1.SetRange(Name, "Supplier Selection1"."Supplier Name");
                if PrequalifiedSuppliers1.Find('-') then
                    PostalAddress := PrequalifiedSuppliers1."Postal Address";
                PhysicalAddress := PrequalifiedSuppliers1."Physical Address";
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
    labels
    {
        QuotationNoLbl = 'Quotation No:';
        ToLbl = 'TO:';
        FromLbl = 'FROM:';
        DirectorLbl = 'Director General';
        InvitationLbl = 'You are invited to submit quotation on materials listed below:';
        NotesLbl = 'Notes:';
        albl = '(a)  THIS IS NOT AN ORDER. Read the conditions and instructions on reverse before quoting.';
        bLbl = '(b) This quotatin should be submitted in a plain wax sealed envelope marked "Quotation No.';
        ForSuppyLbl = 'For Supply of';
        AddressLbl = 'And be addressed to reach the buyer or be placed in the quotation Box in 10th floor, National Bank Building not later than....................................';
        SellersSignatureLbl = 'Seller''s Signature';
        DateLbl = 'Date:';
        OpenedByLbl = 'Opened By:';
        OfficialUseLbl = 'FOR OFFICIAL USE ONLY';
        oneLbl = '(1)';
        TwoLbl = '(2)';
        ThreeLbl = '(3)';
        DesignationLbl = 'Designation';
        SignatureLbl = 'Signature';
        ConditionLbl = 'CONDITIONS';
        ConditionOneLbl = '1.	The General conditions of contract with the Government of Kenya apply to this transaction.';
        ConditionTwoLbl = '2.	The offer shall remain firm for 60 days from the closing date unless other stipulated by the seller';
        ConditionThreeLbl = '3.	The buyer shall be bound to accept the lowest or any other offer, and reserve the right to accept any offer in part unless the contrary is stipulated by the seller.';
        ConditionFourLbl = '4.	Samples of offers when required will be provided free and if not destroyed during the test will, upon request, be returned at seller''s expenses.';
        InstructionsLbl = 'INSTRUCTIONS';
        InstructionOneLbl = '1.	All Entries mus be typed or written in ink. Mistakes must not be erased but should be crossed out and corrections be made and initialed by person signing the quotation.';
        InstructionTwoLbl = '2.	Quote on each item separately, and in units specified.';
        InstructionThreeLbl = '3.	This form must be signed by a competent person and preferrably it should be also rubber stamped.';
        InstructionFourLbl = '4.	Each quotation should be submitted separately in sealed envelope with the quotation Number endorsed on the outside. Descriptive literature or samples of items offered may be forwarded with quotation';
        InstructionFiveLbl = '5.	If you do not wish to quote, please endorse the reason on this form and retrurn it, otherwise your name may be deleted from the buyer''s mailing list for the items listed hereon.';
        NbAwardLbl = 'NB: AWARD WILL BE MADE TO OVERALL LOWEST RESPONSIVE BIDDER PREMIUMS QUOTEED SHOULD BE BASED ON THE VALUATIONS';
        TelLbl = 'TEL';
        PoBoxLbl = 'P.O BOX';
        TimeLbl = 'Time';
    }

    trigger OnInitReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(CompInfo.Picture);
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
        Department: Text[30];
        Dimvalues: Record "Dimension Value";
        Vendors: Record Vendor;
        PrevMonthBud: Decimal;
        CurrMonthBud: Decimal;
        TotAvailableBud: Decimal;
        GLAccount: Record "G/L Account";
        GenLedSetup: Record "General Ledger Setup";
        QtyStore: Record Item;
        GenPostGroup: Record "General Posting Setup";
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        ReqHeader: Record "Internal Requistion Header1";
        BudgetDate: Date;
        YrBudget: Decimal;
        "BudgetB/F": Decimal;
        RequisitionLine: Record "Requistion Line1";
        BudgetGL: Code[20];
        ThisLNAmt: Decimal;
        MonthReqHdr: Record "Internal Requistion Header1";
        PeriodTo: Date;
        MonthReq: Record "Requistion Line1";
        TotalMonthReq: Decimal;
        RecSeq: Integer;
        DateRequired: Date;
        CompInfo: Record "Company Information";
        DocNumber: Code[30];
        ProcurementRequest: Record "Procurement Request1";
        PrequalifiedSuppliers1: Record "Prequalified Suppliers1";
        "SupplierSelections 1": Record "Supplier Selection1";
        PostalAddress: Text;
        PhysicalAddress: Text;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511454_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511454;
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
