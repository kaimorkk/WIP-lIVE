namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Utilities;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Sales.Customer;
using Microsoft.Inventory.Location;
using System.Automation;
using System.Security.User;
using Microsoft.Finance.GeneralLedger.Budget;
using Microsoft.Finance.Dimension;
using Microsoft.HumanResources.Employee;

report 50008 "Imprest Warranty"
{
    Caption = 'Imprest Warranty';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './SRC/Report/Rep50107.ImprestWarranty.rdl';
    EnableHyperlinks = true;


    dataset
    {
        dataitem(Payments; Payments)
        {
            CalcFields = "Total Amount", "Imprest Amount";
            column(No_; "No.")
            {
            }

            column(locationName; locationName)
            {

            }
            column(SystemCreatedAt; Format(SystemCreatedAt, 0, '<Day,2>-<Month,2>-<Year4> <Hours24>:<Minutes>:<Seconds>'))
            {
            }
            column(PostalAddress; PostalAddress)
            {
            }
            column(StationName; StationName)
            {
            }
            column(StationEmail; StationEmail)
            {
            }
            column(StationPhone; StationPhone)
            {
            }
            column(PaymentDetails_Name; PaymentDetails[1])
            {
            }
            column(PaymentDetails_Email; PaymentDetails[2])
            {
            }
            column(PaymentDetails_Phone_no; PaymentDetails[3])
            {
            }
            column(PaymentDetails_JobGroup; PaymentDetails[4])
            {
            }
            column(Paymentdetails_ImprestType; PaymentDetails[5])
            {
            }
            column(PaymentDetails_Purpose; PaymentDetails[6])
            {
            }
            column(AmountInText; AmountInText[1])
            {
            }
            column(PaymentDetails_PayeeAcc; PaymentDetails[7])
            {
            }
            column(PaymentDetails_Start_EndDate; PaymentDetails[8])
            {
            }
            column(KRA_EXR; ActivityDetails[1])
            {
            }
            column(Expenditure_Requisition_Code; "Expenditure Requisition Code")
            {
            }
            column(Workplan_Target_Output; ActivityDetails[2])
            {
            }
            column(Workplan_Activity_Description; ActivityDetails[3])
            {
            }
            column(Workplan_Quarter; ActivityDetails[4])
            {
            }
            column(PaymentDistribution_SCOA; PaymentDistributions[1])
            {
            }
            column(PaymentDistribution_GL_Item; PaymentDistributions[2])
            {
            }
            column(PaymentDistribution_Amount; PaymentDistributions[3])
            {
            }
            column(EXRPreparedBy; UserSetup.GetFullName(PreparedBy))
            {
            }
            // column(EXRPreparedByDesignation; EXRApprovers[1]."Job Tittle")
            // {
            // }
            column(EXRPreparedBySignature; EXRApprovers[1]."User Signature")
            {
            }
            column(EXRPreparedDate; Format(EXRApprovalDates[1], 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            //Checked By
            column(EXRCheckedBy; UserSetup.GetFullName(CheckedByUser))
            {
            }
            // column(EXRCheckedByDesignation; EXRApprovers[2]."Job Tittle")
            // {
            // }
            column(EXRCheckedBySignature; EXRApprovers[2]."User Signature")
            {
            }
            column(EXRCheckedByDate; Format(EXRApprovalDates[2], 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            //Approved  By
            column(EXRApprovedBy; UserSetup.GetFullName(EXRApprovers[3]."User ID"))
            {
            }
            // column(EXRApprovedByByDesignation; EXRApprovers[3]."Job Tittle")
            // {
            // }
            // column(EXRApprovedBySignature; CashMgnt."AIE QR Code")
            // {
            // }
            column(EXRApprovedByDate; Format(EXRApprovalDates[3], 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }

            column(PVPreparedBy; UserSetup.GetFullName(PVApprovers[1]."User ID"))
            {
            }
            // column(PVPreparedByDesignation; PVApprovers[1]."Job Tittle")
            // {
            // }
            // column(PVPreparedBySignature; CashMgnt."Sender QR Code")
            // {
            // }
            column(PVPreparedDate; Format(PVApprovalDates[1], 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            //Checked By
            column(PVCheckedBy; UserSetup.GetFullName(PVApprovers[2]."User ID"))
            {
            }
            // column(PVCheckedByDesignation; PVApprovers[2]."Job Tittle")
            // {
            // }
            column(PVCheckedBySignature; OTPRec1."Approval QR Code")
            {
            }
            column(PVCheckedByDate; Format(PVApprovalDates[2], 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            //Approved  By
            column(PVApprovedBy; UserSetup.GetFullName(PVApprovers[3]."User ID"))
            {
            }
            // column(PVApprovedByByDesignation; PVApprovers[3]."Job Tittle")
            // {
            // }
            column(PVApprovedBySignature; OTPRec2."Approval QR Code")
            {
            }
            column(PVApprovedByDate; Format(PVApprovalDates[3], 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }

            dataitem(SCOA; Integer)
            {
                column(SCOA_Count; Number)
                {
                }
                column(SCOA_Combination; SCOACombinations[Number] [1])
                {
                }
                column(SCOA_Admin_Unit; SCOACombinations[Number] [2])
                {
                }
                column(SCOA_Amount; SCOACombinations[Number] [3])
                {
                }
                column(SCOA_GL_ACCName; SCOACombinations[Number] [4])
                {
                }
                column(SCOA_Budget_Balance; SCOACombinations[Number] [6])
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, SCOACombinationsCount);
                end;


            }

            dataitem("PV Lines"; "PV Lines")
            {
                DataItemLink = No = field("No.");
                column(No_PVLines; "PV Lines".No)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Attachments.Reset();
                    Attachments.SetRange(Document_No, Payments."No.");
                    if Attachments.FindSet() then
                        repeat
                            AttachedDocCount += 1;
                            AttachedDocDetails[AttachedDocCount] [2] := Attachments.FileName;
                            AttachedDocDetails[AttachedDocCount] [3] := Attachments.Link;

                        until Attachments.Next() = 0;
                end;
            }

            dataitem(SupportingDocs; Integer)
            {
                column(SupportingDocs_Count; Number)
                {
                }
                column(SupportingDocs_Number; AttachedDocDetails[Number] [1])
                {
                }
                column(SupportingDocs_Desc; AttachedDocDetails[Number] [2])
                {
                }
                column(SupportingDocs_DocNo; AttachedDocDetails[Number] [3])
                {
                }
                column(SupportingDocs_DocDate; AttachedDocDetails[Number] [4])
                {
                }
                trigger OnPreDataItem()
                begin

                    SetRange(Number, 1, AttachedDocCount);



                end;
            }

            trigger OnAfterGetRecord()
            var
                ApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                Employee: Record Employee;
                ImprestLines: Record "Imprest Lines";
                PvLines: Record "PV Lines";
                SalaryScale: Record "Salary Scales";
                EmployeeBanks: array[2, 4] of Text;
                ImprestMemo: Record "Imprest Memo";
                PaymentMgt: Codeunit "Payments-Post";
                DimensionMgt: Codeunit DimensionManagement;
                DimensionCodes, DimensionCodes2 : array[8] of Code[20];
                Genjnline: Record "Gen. Journal Line";
                DimensionTxt: Text;
                GLAcc: Record "G/L Account";
                Cust: Record Customer;
                CustPostingGrp: Record "Customer Posting Group";
                BudgetMgt: Codeunit "Budget Management";
                BudgetCode: Code[20];
                Budgets: Record "G/L Budget Name";
                Activity: Record "Workplan Activity";
                KRA: Record "Strategic Theme";
                EXRLines: Record "Expense Requisition Line";
                PayPost: Codeunit "Payments-Post";
            begin


                getStationDetails();
                getAdminUnitName();
                GetQRCodes(Payments."No.");


                ApprovalsMgt.GetDocApprovers(Payments.RecordId, PVApprovers[1], PVApprovers[2], PVApprovers[3], PVApprovalDates);
                DimensionMgt.GetShortcutDimensions(Payments."Dimension Set ID", DimensionCodes);

                EXR.Reset;
                EXR.SetRange("No.", "Expenditure Requisition Code");
                if EXR.FindFirst() then
                    ApprovalsMgt.GetDocApprovers(EXR.RecordId, EXRApprovers[1], EXRApprovers[2], EXRApprovers[3], EXRApprovalDates);

                if Activity.Get(EXR."Resource Req. No.", EXR."Activity Code") then begin
                    EXRLines.Reset();
                    EXRLines.SetRange("Document No.", EXR."No.");
                    if EXRLines.FindFirst() then begin
                        if KRA.Get(EXR."Corporate Strategy", EXRLines."KRA ID") then
                            ActivityDetails[1] := KRA.Description;
                    end;

                    ActivityDetails[2] := Activity.Outputs;
                    ActivityDetails[3] := Activity.Descriptions;
                    ActivityDetails[4] := GetQuarter(EXR.Date, EXR."Budget Code");

                end;
                GetQRCodes(Payments."No.");
                case
                    Payments."Payment Type" of
                    Payments."Payment Type"::"Special Imprest", Payments."Payment Type"::"Standing Imprest":
                        begin
                            //Get Employee
                            PVLines.Reset;
                            PVLines.Setrange(No, Payments."No.");
                            PvLines.SetFilter("Account Type", '%1|%2', PvLines."Account Type"::Customer, PvLines."Account Type"::Employee);
                            if PvLines.FindFirst() then begin
                                if Employee.Get(PvLines."Account No") then begin
                                    PaymentDetails[1] := Employee.FullName();
                                    PaymentDetails[2] := Employee."E-Mail";
                                    PaymentDetails[3] := Employee."Phone No.";
                                    SalaryScale.Reset();
                                    SalaryScale.SetRange(Scale, Employee."Salary Scale");
                                    if SalaryScale.FindFirst() then
                                        PaymentDetails[4] := SalaryScale.Description;

                                    PaymentDetails[5] := Format("Payment Type");
                                    PaymentDetails[6] := Payments."Payment Narration";
                                    if Employee."Employee's Bank 2" = '' then begin
                                        PaymentDetails[7] := StrSubstNo('%1 - %2 -  %3', Employee."Bank Name", Employee."Bank Branch Name", Employee."Bank Account No.");
                                    end else begin
                                        PaymentDetails[7] := StrSubstNo('%1 - %2 -  %3', Employee."Bank Name 2", Employee."Bank Branch Name 2", Employee."Bank Account No. 2");
                                    end;
                                end;
                            end;
                            PaymentMgt.InitTextVariable();
                            PaymentMgt.FormatNoText(AmountInText, Payments."Total Amount", Payments."Currency Code");

                            DimensionTxt := StrSubstNo('%1-%2-%3-%4-%5-%6-%7', DimensionCodes[3], DimensionCodes[5], DimensionCodes[6], DimensionCodes[4], '%1', DimensionCodes[1], '000');
                            if "Payment Type" = "Payment Type"::"Special Imprest" then begin
                                if CustPostingGrp.Get(CustPostingGrp.GetPostinGroup(CustPostingGrp.Utilization::"Special Imprest")) then begin
                                    if GLAcc.Get(CustPostingGrp."Receivables Account") then;
                                    PaymentDistributions[1] := StrSubstNo(DimensionTxt, GLAcc."No.");
                                    PaymentDistributions[2] := GLAcc.Name;
                                end;
                            end else begin
                                if CustPostingGrp.Get(CustPostingGrp.GetPostinGroup(CustPostingGrp.Utilization::"Standing Imprest")) then begin
                                    if GLAcc.Get(CustPostingGrp."Receivables Account") then;
                                    PaymentDistributions[1] := StrSubstNo(DimensionTxt, GLAcc."No.");
                                    PaymentDistributions[2] := GLAcc.Name;
                                end;
                            end;
                            PaymentDistributions[3] := Format(Payments."Total Amount");

                            //Payment Lines
                            PVLines.Reset;
                            PVLines.Setrange(No, Payments."No.");
                            if PvLines.FindSet() then begin
                                repeat
                                    SCOACombinationsCount += 1;
                                    DimensionMgt.GetShortcutDimensions(PvLines."Dimension Set ID", DimensionCodes2);
                                    PayPost.UpdateDimensions(Genjnline, DimensionCodes2, DimensionCodes);
                                    DimensionMgt.GetShortcutDimensions(Genjnline."Dimension Set ID", DimensionCodes2);
                                    DimensionTxt := StrSubstNo('%1-%2-%3-%4-%5-%6-%7', DimensionCodes2[3], DimensionCodes2[5], DimensionCodes2[6], DimensionCodes2[4], '%1', DimensionCodes2[1], '000');

                                    if GLAcc.Get(PVLines."Vote Item") then begin
                                        SCOACombinations[SCOACombinationsCount] [1] := StrSubstNo(DimensionTxt, GLAcc."No.");
                                        SCOACombinations[SCOACombinationsCount] [3] := Format(PVLines.Amount);
                                        SCOACombinations[SCOACombinationsCount] [4] := GLAcc.Name;
                                        SCOACombinations[SCOACombinationsCount] [5] := GLAcc.Name;
                                        Budgets.Reset();
                                        Budgets.SetFilter("Start Date", '>=%1', Date);
                                        Budgets.SetFilter("End Date", '<=%1', Date);
                                        if Budgets.FindFirst() then
                                            SCOACombinations[SCOACombinationsCount] [6] := Format(BudgetMgt.GetBudgetBalance(Budgets.Name, GLAcc."No.", DimensionCodes, Date, Date));
                                    end;
                                until PvLines.Next() = 0;
                            end;
                        end;
                    Payments."Payment Type"::Imprest:
                        begin
                            if Employee.Get(Payments."Account No.") then begin
                                PaymentDetails[1] := Employee.FullName();
                                PaymentDetails[2] := Employee."E-Mail";
                                PaymentDetails[3] := Employee."Phone No.";
                                SalaryScale.Reset();
                                SalaryScale.SetRange(Scale, Employee."Salary Scale");
                                if SalaryScale.FindFirst() then
                                    PaymentDetails[4] := SalaryScale.Description;

                                PaymentDetails[5] := 'Safari Imprest';
                                PaymentDetails[6] := Payments."Payment Narration";
                                if Employee."Employee's Bank 2" = '' then begin
                                    PaymentDetails[7] := StrSubstNo('%1 - %2 -  %3', Employee."Bank Name", Employee."Bank Branch Name", Employee."Bank Account No.");
                                end else begin
                                    PaymentDetails[7] := StrSubstNo('%1 - %2 -  %3', Employee."Bank Name 2", Employee."Bank Branch Name 2", Employee."Bank Account No. 2");
                                end;
                            end;

                            if ImprestMemo.Get(ImprestMemo."No.") then
                                PaymentDetails[8] := StrSubstNo('%1 - %2', Format(ImprestMemo."Start Date", 0, '<Day,2>/<Month,2>/<Year4>'), Format(ImprestMemo."End Date", 0, '<Day,2>/<Month,2>/<Year4>'));

                            PaymentMgt.InitTextVariable();
                            PaymentMgt.FormatNoText(AmountInText, Payments."Imprest Amount", Payments."Currency Code");

                            DimensionMgt.GetShortcutDimensions(Payments."Dimension Set ID", DimensionCodes);
                            //Payment Details
                            DimensionTxt := StrSubstNo('%1-%2-%3-%4-%5-%6-%7', DimensionCodes[3], DimensionCodes[5], DimensionCodes[6], DimensionCodes[4], '%1', DimensionCodes[1], '000');
                            if CustPostingGrp.Get(CustPostingGrp.GetPostinGroup(CustPostingGrp.Utilization::"Safari Imprest")) then begin
                                if GLAcc.Get(CustPostingGrp."Receivables Account") then;
                                PaymentDistributions[1] := StrSubstNo(DimensionTxt, GLAcc."No.");
                                PaymentDistributions[2] := GLAcc.Name;
                            end;
                            PaymentDistributions[3] := Format(Payments."Imprest Amount");

                            ImprestLines.Reset;
                            ImprestLines.Setrange(No, Payments."No.");
                            if ImprestLines.FindSet() then begin
                                repeat
                                    SCOACombinationsCount += 1;
                                    DimensionMgt.GetShortcutDimensions(ImprestLines."Dimension Set ID", DimensionCodes2);
                                    PayPost.UpdateDimensions(Genjnline, DimensionCodes2, DimensionCodes);
                                    DimensionMgt.GetShortcutDimensions(Genjnline."Dimension Set ID", DimensionCodes2);
                                    DimensionTxt := StrSubstNo('%1-%2-%3-%4-%5-%6-%7', DimensionCodes2[3], DimensionCodes2[5], DimensionCodes2[6], DimensionCodes2[4], '%1', DimensionCodes2[1], '000');
                                    if GLAcc.Get("Vote Item") then begin
                                        SCOACombinations[SCOACombinationsCount] [1] := StrSubstNo(DimensionTxt, GLAcc."No.");
                                        SCOACombinations[SCOACombinationsCount] [3] := Format(ImprestLines.Amount);
                                        SCOACombinations[SCOACombinationsCount] [4] := GLAcc.Name;
                                        SCOACombinations[SCOACombinationsCount] [5] := GLAcc.Name;

                                        Budgets.Reset();
                                        Budgets.SetFilter("Start Date", '>=%1', Date);
                                        Budgets.SetFilter("End Date", '<=%1', Date);
                                        if Budgets.FindFirst() then
                                            SCOACombinations[SCOACombinationsCount] [6] := Format(BudgetMgt.GetBudgetBalance(Budgets.Name, GLAcc."No.", DimensionCodes, Date, Date));
                                    end;
                                until ImprestLines.Next() = 0;
                            end;

                        end;
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {
                }
            }
        }

        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        PostalAddress, StationName : Text;
        StationEmail, StationPhone : Text;
        AttachedDocDetails: array[30, 6] of Text;
        AttachedDocCount: Integer;
        EXRApprovers, PVApprovers : array[3] of Record "User Setup";
        EXRApprovalDates, PVApprovalDates : array[3] of DateTime;
        UserSetup: Record "User Setup";
        SCOACombinationsCount: Integer;
        SCOACombinations: array[20, 6] of Text;
        EXR: Record "Expense Requisition";
        PaymentDetails: array[20] of Text;
        AmountInText: array[2] of Text;
        PaymentDistributions, ActivityDetails : array[4] of Text;
        CheckedByUser: Text;
        ApprovedBy: Text;
        PreparedBy: Text;
        OTPRec1: Record Otp;
        OTPRec2: Record Otp;
        OTPRec3: Record Otp;
        locationName: Text[50];

        Attachments: Record "Attachments";


    // CashMgnt: Record "Digital Signature";

    procedure GetQRCodes(PvNo: Text)
    var
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        // Bytes: dotnet Array;
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        OutStream: OutStream;
        HrEmp: Record Employee;
        EmpName: Text;
        B64: BigText;
        ByteCount: Integer;
        // Base64Convert: Codeunit "Base64 Convert";
        // QRCodeUnit: Codeunit QRCodeUnit;
        // Convert: dotnet Convert;
        OTP: Record Otp;
        ApprovalEntry: Record "Approval Entry";
        PVHeader: Record Payments;
        ApprovalEntries: Record "Approval Entry";
        i: Integer;
        ApprovalsMgt: Codeunit "Approvals Mgmt.";
    begin
        PVHeader.Get(PvNo);
        ApprovalEntry.Reset();
        ApprovalEntry.setrange(ApprovalEntry."Document No.", PvNo);
        ApprovalEntry.setrange(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
        if ApprovalEntry.find('-') then begin
            OTP.Reset();
            OTP.SetRange(OTP."Document No", PvNo);
            OTP.SetRange(OTP."User ID", ApprovalEntry."Sender ID");
            OTP.SetRange(OTP."OTP Type", OTP."OTP Type"::Initiator);
            if OTP.FindLast() then
                if UserSetup.Get(ApprovalEntry."Sender ID") then
                    if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Initiator:  PJ: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
            // B64 := QRCodeUnit.GenerateApprovalQRCode(57000, PvNo, EmpName, ApprovalEntry."Date-Time Sent for Approval", OTP."OTP Code", HrEmp."Phone No.");
            // Bytes := Convert.FromBase64String(B64);
            // MemoryStream := MemoryStream.MemoryStream(Bytes);
            // CashMgnt.DeleteAll();
            // CashMgnt.Init();
            // ApprovalsMgt.GetDocApprovers(EXR.RecordId, EXRApprovers[1], EXRApprovers[2], EXRApprovers[3], EXRApprovalDates);


            // CashMgnt."Sender QR Code".CreateOutStream(OutStream);
            // Base64Convert.FromBase64(Format(B64), OutStream);
            EXR.Reset;
            EXR.SetRange("No.", PVHeader."Expenditure Requisition Code");
            if EXR.FindFirst() then
                if UserSetup.Get(EXRApprovers[3]."User ID") then
                    if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; AIE Holder:  PJ: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
            // B64 := QRCodeUnit.GenerateApprovalQRCode(50110, EXR."No.", EmpName, EXRApprovalDates[3], OTP."OTP Code", HrEmp."Phone No.");
            // Bytes := Convert.FromBase64String(B64);
            // MemoryStream := MemoryStream.MemoryStream(Bytes);
            // CashMgnt."AIE QR Code".CreateOutStream(OutStream);
            // Base64Convert.FromBase64(Format(B64), OutStream);

            ApprovalEntries.Reset;
            ApprovalEntries.SetRange("Table ID", 57000);
            ApprovalEntries.SetRange("Document No.", Payments."No.");
            ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
            if ApprovalEntries.FindSet() then begin
                i := 0;
                repeat
                    i := i + 1;
                    if ApprovalEntries."Sequence No." = 1 then begin
                        PreparedBy := ApprovalEntries."Sender ID";
                        OTPRec1.reset();
                        OTPRec1.SetRange("Document No", Payments."No.");
                        OTPRec1.SetRange("Table ID", 57000);
                        OTPRec1.SetRange("User ID", ApprovalEntries."Approver ID");
                        OTPRec1.SetRange("Approval Sequence", 1);
                        if OTPRec1.FindLast() then Begin

                            OTPRec1.CALCFIELDS("Approval QR Code");
                            CheckedByUser := OTPRec1."User ID";
                        end;

                    end;
                    if ApprovalEntries."Sequence No." = 2 then begin

                        OTPRec2.reset();
                        OTPRec2.SetRange("Document No", Payments."No.");
                        OTPRec2.SetRange("Table ID", 57000);
                        OTPRec2.SetRange("User ID", ApprovalEntries."Approver ID");
                        OTPRec2.SetRange("Approval Sequence", 2);
                        if OTPRec2.FindLast() then begin
                            ApprovedBy := OTPRec2."User ID";
                            OTPRec2.CALCFIELDS("Approval QR Code");
                        end;
                    end;

                    if ApprovalEntries."Sequence No." = 3 then begin

                        OTPRec3.reset();
                        OTPRec3.SetRange("Document No", Payments."No.");
                        OTPRec3.SetRange("Table ID", 57000);
                        OTPRec3.SetRange("User ID", ApprovalEntries."Approver ID");
                        OTPRec3.SetRange("Approval Sequence", 3);
                        if OTPRec3.Find('-') then
                            OTPRec3.CALCFIELDS("Approval QR Code");

                    end;
                until
               ApprovalEntries.Next = 0;
            end;
            // CashMgnt.Insert();
            // if CashMgnt.Get() then begin
            //     CashMgnt.CalcFields("Sender QR Code");
            //     CashMgnt.CalcFields("Approver 1 QR Code");
            //     CashMgnt.CalcFields("AIE QR Code");
            //     CashMgnt.CalcFields("Approver 2 QR Code");
            //     CashMgnt.CalcFields("Approver 3 QR Code");
            // end;
        end else begin
            // CashMgnt.Delete();
        end;
    end;

    local procedure getStationDetails()
    var
        ResponsibilityCenter: Record "Responsibility Center";
    begin
        ResponsibilityCenter.Reset();
        ResponsibilityCenter.SetRange("Global Dimension 2 Code", Payments."Shortcut Dimension 2 Code");
        ResponsibilityCenter.Setrange("Operating Unit Type", ResponsibilityCenter."Operating Unit Type"::"Court Stations");
        if ResponsibilityCenter.FindFirst() then begin
            // PostalAddress := ResponsibilityCenter.GetAddress();
            StationName := ResponsibilityCenter.Name;
            StationEmail := ResponsibilityCenter."E-Mail";
            StationPhone := ResponsibilityCenter."Phone No.";
        end;
    end;

    procedure getAdminUnitName()
    var
        DimensionValue: Record "Dimension Value";
    begin

        DimensionValue.reset();
        DimensionValue.SetRange(Code, Payments."Shortcut Dimension 1 Code");
        if (DimensionValue.FindFirst()) then
            locationName := DimensionValue.Name;



    end;

    local procedure GetQuarter(Date: Date; BudgetCode: Code[20]): Text
    var
        WorkplanMgt: Codeunit "Workplan Management";
        BudgetDate: array[12, 2] of Date;
    begin
        WorkplanMgt.GetBudgetDates(BudgetCode, 1, BudgetDate);
        case
        true of
            (Date >= BudgetDate[1] [1]) and (Date <= BudgetDate[1] [2]):
                exit('One (1)');
            (Date >= BudgetDate[2] [1]) and (Date <= BudgetDate[2] [2]):
                exit('Two (2)');
            (Date >= BudgetDate[3] [1]) and (Date <= BudgetDate[3] [2]):
                exit('Three (3)');
            (Date >= BudgetDate[4] [1]) and (Date <= BudgetDate[4] [2]):
                exit('Four (4)');
        end;
    end;
}