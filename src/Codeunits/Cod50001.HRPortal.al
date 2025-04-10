codeunit 50001 HRPortal
{

    trigger OnRun()
    begin

    end;

    var
        BlobInStream: InStream;
        BlobOutStream: OutStream;
        // Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        // RecRef: RecordRef;
        ImageEx: Boolean;
        Employee: Record Employee;
        HREmp: Record Employee;
        objMail: Codeunit Mail;
        leaveApp: Variant;
        PaychangeAdvice: Variant;
        loanApp: Variant;
        HRPortalUsers: Record HRPortalUsers;
        leaveApplications: Record "HR Leave Application";
        HrJobsApplicants: Record "Hr Jobs Applicants";
        JobApplicantHobbies: Record "Job Applicant Hobbies";
        JobApplicantReferees: Record "HR Applications Accomplishment";
        JobApplicantsQualifications: Record "Applications Accomplishments";
        CompanyJobs: Record "ManPower Planning Lines";
        JobPositionApplications: Record "HR Professional Qualifications";

        // ImprestMemo: Record "Imprest Memo";
        LegInstr: InStream;
        LegOutStr: OutStream;
        LegText: Text;
        Test: Integer;
        Leg: BigText;
        obj: BigText;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Payments: Record payments;
        Payments1: Record payments;
        Payments2: Record payments;
        PurchaseHeader: Record "Purchase Header";
        annual: Option " ","Annual Leave","Emergency Leave";
        ApplicantEmploymentHistory: Record "Employee History Table";
        jpa: Record "HR Job Applications";
        gender: Option ,Female,Male,Both;
        disabled: Option No,Yes;
        MaritalStatus: Option Single,Married,Separated,Divorced,"Widow(er)",Other;
        applicantQualifications: Record "HR Applicant Qualifications";
        JobApplicants: Record "HR Job Applications";
        professionalQualifications: Record "HR Professional Qualifications";
        attendedTraining: Record "Hr Trainings Attended";
        membershipbody: Record "Hr Proffessional Body";
        applicantAccomplishment: Record "HR Applications Accomplishment";
        referee: Record "HR Applicant Referees";
        externalApplicants: Record "HR Applicant Accounts";
        helpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
        hdesk: Record "ICT Helpdesk";
        item: Record Item;
        applicantBackground: Record "Applicant Background";
        applicantReferee: Record "Applicant Referees";
        jobApplication: Record "Job Application Table";
        jobApp: Record "Job Application Table";
        favouriteJob: Record FavouriteJobsTable;

        employeeLedgerEntry: Record "Employee Ledger Entry";
        EmpFilter: Text[250];
        EmpDateFilter: Text[30];
        TrainingRequisition: Record "Training Requests";
        TrainingReq: Record "Training Requests";
        TrainingParticipants: Record "Training Participants";
        PVLines: Record "PV Lines";
        PettyCashLines: Record "Petty Cash Lines";

        RecID: RecordID;
        RecRef: RecordRef;
        varTableNumber: Integer;
        ProcurementSetup: Record "Procurement Setup";

        FileName: Text[250];
        //  EmployeeStatement: Report "Employee Statement";

        TransportRequisition: Record "Transport Requisition";

        loansApplication: Record "Loan Application";

        DependantsChange: Record "Dependants Change";

        HRWelfareIncidence: Record "HR Welfare Incidence";
        ICT: Integer;

        mergePdfsapiPath: label 'http://192.168.1.87:8095/api/values/MergePdf?tenderNo=';
        createFolderapiPath: label 'http://192.168.1.87:8095/api/values/CreateFolder?tenderNo=';
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        objPurchaseHeader: Record "Purchase Header";
        ImprestRequisition: Record Payments;
        ImprestSurrH: Record Payments;
        ApprovalEntry: Record "Approval Entry";
        StaffClaims: Record Payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HrSetup: Record "Human Resources Setup";
        LeaveReq: Record "HR Leave Allocation Request";
        NextNo: Code[20];
        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        LeaveT: Record "HR Leave Application";
        EmpReq: Record "Recruitment Requisition Header";
        HumanResourcesSetup: Record "Human Resources Setup";
        UserSetup: Record "User Setup";
        FILESPATH: Text[200];
        Mobility: Record "Employee Transfers";
        ClockIn: Record "HR Employee Clock In";
        FltMgtSetup: Record "Fleet Management Setup";
        Disciplinary: Record "HR Disciplinary Cases";
        Grievance: Record "Discipline Applications";
        WorkTicketHeader: Record "Monthly Work Ticket Header";
        WorkTicketLines: Record "Daily Work Ticket Lines";
        LeavePlannerHeader: Record "HR Leave Planner Header";
        LeavePlan: Record "HR Leave Planner Lines";
        Sms: Codeunit "SMS Integration Management";
        PrPeriodTrans: Record "PR Period Transactions";
        ResourceBookingSetup: Record "Resource Booking Setup";
        ReservLine: Record "Resource booking Lines";
        ReservH: Record "Resource Booking Header";
        HandOver: Record "HR Leave Handover Notes";
        LoanEntitlement: Record "Loan Entitlement Per Grade";
        ProcurementPlan: Record "Procurement Plan";
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        PurchSetup: Record "Procurement Setup";
        FinancialYear: Record "Financial Year Code";
        SPMSetup: Record "SPM General Setup";
        ExpenseRequisition: Record "Expense Requisition";
        WorkplanMgt: Codeunit "Workplan Management";
        ExpenseReqLine: Record "Expense Requisition Line";
        ExpenseReqAllocation: Record "Expense Req. Allocation";
        FullUtilizationVoucher: Record Payments;

        PMMU: Record "Perfomance Contract Header";

        ResourceCost: Record "Resource Cost";

        TempBlob_lRec: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        // RecRef: RecordRef;
        FileManagement_lCdu: Codeunit "File Management";
        Base64Convert: Codeunit "Base64 Convert";
        ContractPaymentTerm: Record "Purchase Contract Payment Term";
        LeaveRecall: Record "Leave Application Recall";
        Logs: Record "Integration logs";
        ValidationUrl: Text;
        generateOTP: Codeunit "OTP Sender";

    // DStationTNeeds: Record "Duty Station Training Needs";


    // procedure PostImprest(DocNo: Code[30])
    // var
    //     myInt: Integer;
    //     paymentsRec: Record Payments;
    //     PaymentPost: Codeunit "Payments-Post";
    // begin
    //     paymentsRec.Reset();
    //     paymentsRec.SetRange(paymentsRec."No.", DocNo);
    //     if paymentsRec.FindFirst() then
    //         PaymentPost."Post Imprest"(paymentsRec);
    // end;

    // procedure PostStaffClaim(DocNo: Code[30])
    // var
    //     myInt: Integer;
    //     paymentsRec: Record Payments;
    //     PaymentPost: Codeunit "Payments-Post";
    // begin
    //     paymentsRec.Reset();
    //     paymentsRec.SetRange(paymentsRec."No.", DocNo);
    //     if paymentsRec.FindFirst() then
    //         PaymentPost.PostStaffClaims(paymentsRec, false);
    // end;

    procedure PostBidOpeningRegister(DocNo: code[40]; PostedBy: Text)
    var
        myInt: Integer;
        BidRegister: Record "Bid Opening Register";
        Procurement: Codeunit "Procurement Processing";
    begin
        BidRegister.Reset();
        BidRegister.SetRange(Code, DocNo);
        if BidRegister.FindFirst() then begin
            Procurement.PostBidOpeningRegister(BidRegister);
            BidRegister.Posted := true;
            BidRegister."Posted By" := PostedBy;
            BidRegister."Posted Date" := Today;
            BidRegister.Modify();
        end;

    end;


    procedure GenerateCashbooklReport(BankAccNum: Code[50]; StartDate: date; Enddate: date; DimensionVal: code[40]) filenames: Text
    var
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        ResponseObject: JsonObject;
        ReceitRec: record "Bank Account Ledger Entry";
    begin
        if StartDate = 0D then
            StartDate := Today;
        if Enddate = 0D then
            enddate := today;

        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        ReceitRec.Reset();
        ReceitRec.SetRange(ReceitRec."Bank Account No.", BankAccNum);
        ReceitRec.setrange(ReceitRec."Global Dimension 1 Code", DimensionVal);
        ReceitRec.SetFilter(ReceitRec."Posting Date", '%1..%2', StartDate, Enddate);
        if ReceitRec.Find('-') then begin
            RecRef.GetTable(ReceitRec);
            Report.SaveAs(Report::"Bank Acc. - Detail Trial Bal.", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            //Message(FileContentsB64);
            exit(FileContentsB64)
        end;
    end;

    procedure SendEftForApprval(DocNo: Code[30])
    var
        myInt: Integer;
        EftHeader: Record "EFT Header";
        ApprovalMgt: codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
    begin
        EftHeader.Reset();
        EftHeader.SetRange(No, DocNo);
        if EftHeader.FindFirst() then begin
            VarVariant := EftHeader;
            if ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                ApprovalMgt.RunWorkflowOnSendApprovalRequest(VarVariant);
        end;

    end;

    procedure CancelEftapproval(DocNo: Code[30])
    var
        myInt: Integer;
        EftHeader: Record "EFT Header";
        ApprovalMgt: codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
    begin
        EftHeader.Reset();
        EftHeader.SetRange(No, DocNo);
        if EftHeader.FindFirst() then begin
            VarVariant := EftHeader;
            ApprovalMgt.RunWorkflowOnCancelApprovalRequest(VarVariant);
        end;

    end;


    // procedure GenerateReceiptlReport(DocNum: Code[50]; StartDate: date; Enddate: date; DimensionVal: code[40]) filenames: Text
    // var
    //     BlobOutStream: OutStream;
    //     RecRef: RecordRef;
    //     BlobInStream: InStream;
    //     Base64Convert: Codeunit "Base64 Convert";
    //     TempBlob: Codeunit "Temp Blob";
    //     FileContentsB64: Text;
    //     ResponseObject: JsonObject;
    //     ReceitRec: record Receipts;
    // begin
    //     if StartDate = 0D then
    //         StartDate := Today;
    //     if Enddate = 0D then
    //         enddate := today;

    //     TempBlob.CreateInStream(BlobInStream);
    //     TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
    //     ReceitRec.Reset();
    //     ReceitRec.SetRange(ReceitRec.No, DocNum);
    //     ReceitRec.SetFilter(ReceitRec.Date, '%1..%2', StartDate, Enddate);
    //     if ReceitRec.Find('-') then begin
    //         //MESSAGE('%1%2%3%4',AppraisalNo,AppraisalPeriod,StatusRec,filename);
    //         // Report.SaveAsPdf(Report::"Appraisal Report NEW", filename, AppraisalHeader);
    //         RecRef.GetTable(ReceitRec);
    //         Report.SaveAs(Report::Receipt, '', ReportFormat::Pdf, BlobOutStream, RecRef);
    //         FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
    //         //Message(FileContentsB64);
    //         exit(FileContentsB64)
    //     end;
    // end;

    // procedure PostPaymentVoucher(DocNo: Code[30]; Creator: Code[50])
    // var
    //     myInt: Integer;
    //     PaymentsPost: Codeunit "Payments-Post";
    //     payments: Record Payments;
    // begin
    //     payments.Reset();
    //     payments.SetRange("No.", DocNo);
    //     if payments.FindFirst() then begin
    //         PaymentsPost."Post Payment Voucher"(payments, true, Creator);
    //     end;
    // end;

    // procedure EssCancellPV(DocNo: Code[30])
    // var
    //     myInt: Integer;
    //     Payments: Record Payments;
    //     CreateRefund: Codeunit "Create Refund Voucher";
    // begin
    //     Payments.Reset();
    //     Payments.SetRange("No.", DocNo);
    //     if Payments.FindFirst() then begin
    //         CreateRefund.CancelPV(Payments);
    //     end;

    // end;

    // procedure ScheduleTransfertoBank(EftDoc: Code[40]; loggedInUser: code[20])
    // var
    //     myInt: Integer;
    //     EFTHeader: Record "EFT Header";
    //     OutwardPaymentCodeunit: Codeunit OutwardPayment;
    // begin
    //     EFTHeader.Reset();
    //     EFTHeader.SetRange(No, EftDoc);
    //     if EFTHeader.FindFirst() then
    //         OutwardPaymentCodeunit.CopyEFTLines(EFTHeader, loggedInUser);

    // end;

    // procedure VoidEft(OPtion: Integer; DocNo: code[40]; VoidReason: Text)
    // var
    //     myInt: Integer;
    //     Lines: Record "EFT Line";
    //     EFTHeader: Record "EFT Header";
    // begin
    //     if OPtion = 1 then begin
    //         if EFTHeader.Get(DocNo) then begin

    //             Lines.Reset;
    //             Lines.Setrange("Document No.", EFTHeader."No");
    //             Lines.Setrange(Voided, false);
    //             if Lines.FindFirst() then begin
    //                 repeat
    //                     Lines."Reason for Voiding" := VoidReason;
    //                     Lines.Voided := true;
    //                     Lines.Modify();
    //                 until lines.next = 0;
    //             end;
    //             EFTHeader.Voided := true;
    //             EFTHeader."Reason for Voiding" := VoidReason;
    //             EFTHeader.Validate(EFTHeader.Voided);
    //             EFTHeader.Modify();
    //         end;
    //     end else
    //         if OPtion = 2 then begin
    //             if EFTHeader.Get(DocNo) then begin
    //                 Lines.Reset;
    //                 Lines.Setrange("Document No.", EFTHeader."No");
    //                 Lines.Setrange(Voided, false);
    //                 if Lines.FindFirst() then begin
    //                     repeat
    //                         Lines."Reason for Voiding" := VoidReason;
    //                         Lines.Voided := true;
    //                         Lines.Modify();
    //                     until lines.next = 0;
    //                 end;
    //             end;
    //         end;
    // end;


    // procedure CreateWaranties(UserName: code[100]; Docnum: code[30])
    // var

    //     SafariMembers, SafariMembers1 : Record "Project Members";
    //     CashMgt: Record "Cash Management Setup";
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     Casual: Record Casuals;
    //     LineNo: integer;
    //     EMp: Record Employee;
    //     Usersetup: Record "User Setup";
    //     payMode: Record "Pay Mode";
    //     mail: Codeunit Mail;
    //     attachLink: Record Attachments;
    //     attachLink2: Record Attachments;
    //     entryNo: integer;
    //     Imprestlines: Record "Imprest Lines";
    //     Imprestheaders: Record Payments;
    //     Othercost: Record "Other Costs";
    //     ProjectTeam: Record "Project Members";
    //     Memolines: Record "PV Lines";
    //     Memoheaders: Record "Imprest Memo";
    //     Email1: Text[250];
    //     Email2: Text[250];
    //     Noseries: Code[20];






    // // EmployeeRec
    // begin
    //     //add pv from claims
    //     //added on 27/04/2017
    //     Usersetup.Get(UserName);
    //     Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
    //     Memoheaders.Reset;
    //     Memoheaders.SetRange(Memoheaders."No.", Docnum);
    //     if Memoheaders.Find('-') then begin
    //         //set current key

    //         SafariMembers.Reset;
    //         SafariMembers.SetCurrentkey("No.");
    //         SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
    //         SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
    //         if SafariMembers.FindSet() then begin
    //             repeat
    //                 if (SafariMembers1."No." <> SafariMembers."No.") then begin
    //                     //get the no. series
    //                     CashMgt.Reset;
    //                     if CashMgt.Find('-') then begin
    //                         Noseries := CashMgt."Imprest Nos";
    //                         Email2 := CashMgt."Imprest Email";
    //                     end;
    //                     //create header
    //                     LineNo := 1000;
    //                     Imprestheaders.Init;
    //                     Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
    //                     Imprestheaders.Date := Today;
    //                     Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
    //                     Imprestheaders."Account No." := SafariMembers."No.";
    //                     Imprestheaders.Validate(Imprestheaders."Account No.");
    //                     Imprestheaders."Account Name" := SafariMembers.Name;
    //                     Imprestheaders."Posting Date" := Today;
    //                     Imprestheaders."Pay Mode" := payMode.GetDefaultClaimsPaymode(SafariMembers."Total Entitlement");
    //                     // payMode.Reset();
    //                     // payMode.SetRange(Default, true);
    //                     // if payMode.FindFirst() then
    //                     //     Imprestheaders."Pay Mode" := payMode.Code;
    //                     Imprestheaders."Payment Type" := Imprestheaders."payment type"::Imprest;
    //                     Imprestheaders.Payee := SafariMembers.Name;
    //                     Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
    //                     Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
    //                     Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
    //                     Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
    //                     Imprestheaders.Job := Memoheaders.Job;
    //                     Imprestheaders.Status := Imprestheaders.Status::Open;//matara
    //                     Imprestheaders."Job Task No" := Memoheaders."Job  Task";
    //                     Imprestheaders."Job Task No." := Memoheaders."Job  Task";
    //                     Imprestheaders."Currency Code" := SafariMembers."Currency Code";
    //                     Imprestheaders."Paying Bank Account" := CashMgt."Imprest Bank Account";
    //                     Imprestheaders."Created By" := Username;
    //                     //Imprestheaders."Reference No.":="No.";


    //                     EMp.Reset;
    //                     EMp.SetRange("No.", SafariMembers."No.");
    //                     if EMp.FindFirst() then
    //                         Email1 := EMp."E-Mail";
    //                     Imprestheaders."Travel Date" := Memoheaders."Start Date";
    //                     Imprestheaders."Payment Narration" := Memoheaders.Subject;
    //                     Imprestheaders.Validate(Imprestheaders."Travel Date");
    //                     Imprestheaders."Document Type" := Imprestheaders."document type"::Imprest;
    //                     Imprestheaders."Imprest Memo No" := Memoheaders."No.";
    //                     Imprestheaders."On behalf of" := SafariMembers.Name;
    //                     Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                     Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
    //                     Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                     Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
    //                     Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
    //                     //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
    //                     Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
    //                     Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                     Imprestheaders."Strategic Plan" := Memoheaders."Strategic Plan";
    //                     Imprestheaders."Reporting Year Code" := Memoheaders."Reporting Year Code";
    //                     Imprestheaders."Workplan Code" := Memoheaders."Workplan Code";
    //                     Imprestheaders."Activity Code" := Memoheaders."Activity Code";
    //                     Imprestheaders."Expenditure Requisition Code" := Memoheaders."Expenditure Requisition Code";
    //                     Imprestheaders."Payee Bank Name" := SafariMembers."Bank Name";
    //                     Imprestheaders."Payee Bank Branch" := SafariMembers."Bank Branch";
    //                     Imprestheaders."Payee Branch Name" := SafariMembers."Bank Branch Name";
    //                     Imprestheaders."Payee Bank Account" := SafariMembers."Bank Account Number";
    //                     // Imprestheaders."Payee Bank Account" := Memoheaders."Paying Bank Account";
    //                     ImprestHeaders."Bank Name" := Memoheaders."Bank Name";
    //                     //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
    //                     if Imprestheaders.Insert() then begin
    //                         attachLink.reset();
    //                         attachLink.setRange(attachLink.Document_No, Memoheaders."No.");
    //                         if attachLink.findSet() then
    //                             repeat
    //                                 attachLink2.reset();
    //                                 if attachLink2.FindLast() then
    //                                     entryNo := attachLink2.LineNo + 1
    //                                 else
    //                                     entryNo := 1;

    //                                 attachLink2.init;
    //                                 attachlink2.Copy(attachLink);
    //                                 attachLink2.LineNo := entryNo;
    //                                 attachLink2.Document_No := Imprestheaders."No.";
    //                                 attachlink2.insert();
    //                             until attachLink.next = 0;
    //                     end;
    //                 end;

    //                 //Start of Imprest lines
    //                 Imprestlines.Init;
    //                 Imprestlines."Line No" := LineNo;
    //                 Imprestlines.No := Imprestheaders."No.";
    //                 Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                 // SafariMembers.CalcFields("G/L Account");
    //                 Imprestlines."Account No." := SafariMembers."G/L Account";
    //                 Imprestlines.Validate(Imprestlines."Account No.");
    //                 Imprestlines.Purpose := SafariMembers."Work Type";
    //                 Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
    //                 Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                 Imprestlines."No. of Days" := SafariMembers."Time Period";
    //                 Imprestlines.Amount := SafariMembers.Entitlement;
    //                 Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                 Imprestlines.Insert;
    //                 LineNo := LineNo + 10;
    //                 if SafariMembers."Transport Costs" <> 0 then begin
    //                     Imprestlines.Init;
    //                     Imprestlines."Line No" := LineNo;
    //                     Imprestlines.No := Imprestheaders."No.";
    //                     Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                     // SafariMembers.CalcFields("G/L Account");
    //                     Imprestlines."Account No." := SafariMembers."G/L Account";
    //                     Imprestlines.Validate(Imprestlines."Account No.");
    //                     Imprestlines.Purpose := 'Transport Allowance';
    //                     Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
    //                     Imprestlines."No. of Days" := SafariMembers."Time Period";
    //                     Imprestlines.Amount := SafariMembers."Transport Costs";
    //                     Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                     Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                     Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                     Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
    //                     Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                     Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
    //                     Imprestlines."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                     Imprestlines.Insert;
    //                     LineNo := LineNo + 10;
    //                 end;

    //                 if SafariMembers."Project Lead" = true then begin
    //                     ProjectTeam.Reset;
    //                     ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Docnum);
    //                     ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
    //                     if ProjectTeam.Find('-') then
    //                     //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
    //                     begin
    //                         repeat
    //                             Imprestlines.Init;
    //                             Imprestlines."Line No" := LineNo;
    //                             Imprestlines.No := Imprestheaders."No.";
    //                             Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                             // SafariMembers.CalcFields("G/L Account");
    //                             Imprestlines."Account No." := ProjectTeam."G/L Account";
    //                             Imprestlines.Validate(Imprestlines."Account No.");
    //                             Imprestlines.Purpose := ProjectTeam."Work Type";
    //                             Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                             Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
    //                             Imprestlines."No. of Days" := SafariMembers."Time Period";
    //                             Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
    //                             Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
    //                             Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
    //                             Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                             Imprestlines."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                             Imprestlines.Insert;
    //                             LineNo := LineNo + 10;

    //                         until ProjectTeam.Next = 0;
    //                     end;


    //                     Othercost.Reset;
    //                     Othercost.SetRange(Othercost."Imprest Memo No.", Docnum);
    //                     if Othercost.Find('-') then begin
    //                         repeat
    //                             Imprestlines.Init;
    //                             Imprestlines."Line No" := LineNo;
    //                             Imprestlines.No := Imprestheaders."No.";

    //                             Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                             Othercost.CalcFields("No.");
    //                             Imprestlines."Account No." := Othercost."No.";
    //                             Imprestlines.Validate(Imprestlines."Account No.");
    //                             Imprestlines.Purpose := Othercost."Required For";
    //                             Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
    //                             Imprestlines."No. of Days" := SafariMembers."Time Period";
    //                             Imprestlines.Amount := Othercost."Line Amount";
    //                             Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                             Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
    //                             Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
    //                             Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                             Imprestlines."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                             Imprestlines.Insert;
    //                             LineNo := LineNo + 10;

    //                         until Othercost.Next = 0;
    //                     end;


    //                     Casual.Reset;
    //                     Casual.SetRange(Casual."Imprest Memo No.", Docnum);
    //                     if Casual.Find('-') then begin
    //                         repeat
    //                             Imprestlines.Init;
    //                             Imprestlines."Line No" := LineNo;
    //                             Imprestlines.No := Imprestheaders."No.";
    //                             Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                             Imprestlines."Account No." := Casual."G/L Account";
    //                             Imprestlines.Validate(Imprestlines."Account No.");
    //                             Imprestlines.Purpose := Casual.Activity;
    //                             Imprestlines."Daily Rate" := Casual.Rate;
    //                             Imprestlines."No. of Days" := Casual."No. of Days";
    //                             Imprestlines.Amount := Casual.Amount;
    //                             Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                             Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
    //                             Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
    //                             Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                             Imprestlines."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                             Imprestlines.Insert;
    //                             LineNo := LineNo + 10;

    //                         until Casual.Next = 0;
    //                     end;
    //                 end;

    //                 Imprestheaders.Validate(Imprestheaders.Status);
    //                 //send email to participants
    //                 // CashMgt.Get;
    //                 // if CashMgt."Send Email Notification" = true then begin
    //                 //     if Email1 <> '' then begin
    //                 //         Body := 'Your imprest application no. ' + Imprestheaders."No." + ' has been created from memo no. ' + Rec."No." +
    //                 //         ' Kindly logon to Microsoft Dynamics 365 Business Central to confirm and send it for approval.';

    //                 //         SMTP.Create(Email1, 'Imprest ' + 'No: ' + Imprestheaders."No.",
    //                 //         'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
    //                 //         'Your imprest application no. ' + Imprestheaders."No." + 'of amount ' + Format(SafariMembers.Entitlement) + ''' has been created from memo no. ' + "No." +
    //                 //         ' and has been fowarded to finance for processing.<BR><BR>', true);

    //                 //         SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
    //                 //         mail.Send();

    //                 //     end;
    //                 // end;
    //                 SafariMembers1 := SafariMembers;
    //             until SafariMembers.Next = 0;
    //         end;

    //         Memoheaders."Imprest Created" := true;
    //         Memoheaders."Date converted" := Today;
    //         Memoheaders."Time converted" := Time;
    //         Memoheaders."Converted By" := Username;
    //         Memoheaders.Posted := true;
    //         Memoheaders.Modify;
    //     end
    //     else
    //         Error('The payment for claim No. %1 has already been processed.', Memoheaders."No.");
    // end;





    // procedure CreateWaranties(UserName: code[100]; Docnum: code[30])
    // var
    //     myInt: Integer;
    //     Usersetup: Record "User Setup";
    //     EMp: Record Employee;
    //     Imprestlines: Record "Imprest Lines";
    //     Imprestheaders: Record Payments;
    //     SafariMembers: Record "Project Members";
    //     Othercost: Record "Other Costs";
    //     ProjectTeam: Record "Project Members";
    //     Memolines: Record "PV Lines";
    //     Memoheaders: Record "Imprest Memo";
    //     Email1: Text[250];
    //     Email2: Text[250];
    //     Text005: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
    //     SafariMembers1: Record "Project Members";
    //     ImprestOther: Decimal;
    //     Noseries: Code[20];
    //     CashMgt: Record "Cash Management Setup";
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     Casual: Record Casuals;
    //     LineNo: integer;
    //     payMode: Record "Pay Mode";
    //     Text004: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
    //     attachLink: Record Attachments;
    //     attachLink2: Record Attachments;
    //     entryNo: integer;

    // begin
    //     //added on 27/04/2017
    //     Usersetup.Get(UserName);
    //     Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
    //     // if Confirm(Text004, false, Docnum) then begin
    //     Memoheaders.Reset;
    //     Memoheaders.SetRange(Memoheaders."No.", Docnum);
    //     if Memoheaders.Find('-') then begin
    //         //set current key

    //         SafariMembers.Reset;
    //         //SafariMembers.SetCurrentkey(Docnum);
    //         SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
    //         SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
    //         if SafariMembers.FindSet() then begin
    //             repeat
    //                 if (SafariMembers1."No." <> SafariMembers."No.") then begin
    //                     //get the no. series
    //                     CashMgt.Reset;
    //                     if CashMgt.Find('-') then begin
    //                         Noseries := CashMgt."Imprest Nos";
    //                         Email2 := CashMgt."Imprest Email";
    //                     end;
    //                     //create header
    //                     LineNo := 1000;
    //                     Imprestheaders.Init;
    //                     Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
    //                     Imprestheaders.Date := Today;
    //                     Imprestheaders."Posting Date" := Today;
    //                     Imprestheaders."Pay Mode" := payMode.GetDefaultClaimsPaymode(SafariMembers."Total Entitlement");
    //                     // payMode.Reset();
    //                     // payMode.SetRange(Default, true);
    //                     // if payMode.FindFirst() then
    //                     //     Imprestheaders."Pay Mode" := payMode.Code;
    //                     Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
    //                     Imprestheaders."Account No." := SafariMembers."No.";
    //                     Imprestheaders.validate(Imprestheaders."Account No.");
    //                     Imprestheaders."Account Name" := SafariMembers.Name;
    //                     Imprestheaders."Payment Type" := Imprestheaders."payment type"::Imprest;
    //                     Imprestheaders.Payee := SafariMembers.Name;
    //                     Imprestheaders."Payee Bank Name" := SafariMembers."Bank Name";
    //                     Imprestheaders."Payee Bank Branch" := SafariMembers."Bank Branch";
    //                     Imprestheaders."Payee Branch Name" := SafariMembers."Bank Branch Name";
    //                     Imprestheaders."Payee Bank Account" := SafariMembers."Bank Account Number";

    //                     Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
    //                     Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
    //                     Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
    //                     Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
    //                     Imprestheaders.Job := Memoheaders.Job;
    //                     Imprestheaders.Status := Imprestheaders.Status::Open;//matara
    //                     Imprestheaders."Job Task No" := Memoheaders."Job  Task";
    //                     Imprestheaders."Job Task No." := Memoheaders."Job  Task";
    //                     Imprestheaders."Currency Code" := SafariMembers."Currency Code";
    //                     Imprestheaders."Paying Bank Account" := CashMgt."Imprest Bank Account";
    //                     Imprestheaders."Created By" := UserName;
    //                     //Imprestheaders."Reference No.":="No.";

    //                     Email1 := '';

    //                     EMp.Reset;
    //                     EMp.SetRange("No.", Imprestheaders."Account No.");

    //                     Imprestheaders."Travel Date" := Memoheaders."Start Date";
    //                     Imprestheaders."Payment Narration" := Memoheaders.Subject;
    //                     Imprestheaders.Validate(Imprestheaders."Travel Date");
    //                     Imprestheaders."Document Type" := Imprestheaders."document type"::Imprest;
    //                     Imprestheaders."Imprest Memo No" := Memoheaders."No.";
    //                     Imprestheaders."On behalf of" := SafariMembers.Name;
    //                     Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                     Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
    //                     Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                     Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
    //                     Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
    //                     //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
    //                     Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
    //                     Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                     Imprestheaders."Strategic Plan" := Memoheaders."Strategic Plan";
    //                     Imprestheaders."Reporting Year Code" := Memoheaders."Reporting Year Code";
    //                     Imprestheaders."Workplan Code" := Memoheaders."Workplan Code";
    //                     Imprestheaders."Activity Code" := Memoheaders."Activity Code";
    //                     Imprestheaders."Expenditure Requisition Code" := Memoheaders."Expenditure Requisition Code";
    //                     Imprestheaders."Payee Bank Account" := Memoheaders."Paying Bank Account";
    //                     ImprestHeaders."Bank Name" := Memoheaders."Bank Name";
    //                     //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
    //                     if Imprestheaders.Insert(false) then begin
    //                         attachLink.reset();
    //                         attachLink.setRange(attachLink.Document_No, Memoheaders."No.");
    //                         if attachLink.findSet() then
    //                             repeat
    //                                 attachLink2.reset();
    //                                 if attachLink2.FindLast() then
    //                                     entryNo := attachLink2.LineNo + 1
    //                                 else
    //                                     entryNo := 1;

    //                                 attachLink2.init;
    //                                 attachlink2.Copy(attachLink);
    //                                 attachLink2.LineNo := entryNo;
    //                                 attachLink2.Document_No := Imprestheaders."No.";
    //                                 attachlink2.insert();
    //                             until attachLink.next = 0;
    //                     end;
    //                 end;

    //                 //Start of Imprest lines
    //                 Imprestlines.Init;
    //                 Imprestlines."Line No" := LineNo;
    //                 Imprestlines.No := Imprestheaders."No.";
    //                 Imprestlines."Account Type" := Imprestlines."account type"::Employee;
    //                 // SafariMembers.CalcFields("G/L Account");
    //                 Imprestlines."Account No." := SafariMembers."No.";
    //                 Imprestlines.Validate(Imprestlines."Account No.");
    //                 Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                 // SafariMembers.CalcFields("G/L Account");
    //                 Imprestlines."Account No." := SafariMembers."G/L Account";
    //                 Imprestlines.Validate(Imprestlines."Account No.");
    //                 Imprestlines.Purpose := SafariMembers."Work Type";
    //                 Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
    //                 Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                 Imprestlines."No. of Days" := SafariMembers."Time Period";
    //                 Imprestlines.Amount := SafariMembers.Entitlement;
    //                 Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                 Imprestlines.Insert;
    //                 LineNo := LineNo + 10;
    //                 if SafariMembers."Transport Costs" <> 0 then begin
    //                     Imprestlines.Init;
    //                     Imprestlines."Line No" := LineNo;
    //                     Imprestlines.No := Imprestheaders."No.";
    //                     Imprestlines."Account Type" := Imprestlines."account type"::Employee;
    //                     // SafariMembers.CalcFields("G/L Account");
    //                     Imprestlines."Account No." := SafariMembers."No.";
    //                     Imprestlines.Validate(Imprestlines."Account No.");

    //                     Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                     // SafariMembers.CalcFields("G/L Account");
    //                     Imprestlines."Account No." := SafariMembers."G/L Account";
    //                     Imprestlines.Validate(Imprestlines."Account No.");
    //                     Imprestlines.Purpose := 'Transport Allowance';
    //                     Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
    //                     Imprestlines."No. of Days" := SafariMembers."Time Period";
    //                     Imprestlines.Amount := SafariMembers."Transport Costs";
    //                     Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                     Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                     Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                     Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
    //                     Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                     Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
    //                     Imprestlines."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                     Imprestlines.Insert;
    //                     LineNo := LineNo + 10;
    //                 end;

    //                 if SafariMembers."Project Lead" = true then begin
    //                     ProjectTeam.Reset;
    //                     ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Docnum);
    //                     ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
    //                     if ProjectTeam.Find('-') then
    //                     //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
    //                     begin
    //                         repeat
    //                             Imprestlines.Init;
    //                             Imprestlines."Line No" := LineNo;
    //                             Imprestlines.No := Imprestheaders."No.";
    //                             Imprestlines."Account Type" := Imprestlines."account type"::Employee;
    //                             // SafariMembers.CalcFields("G/L Account");
    //                             Imprestlines."Account No." := SafariMembers."No.";
    //                             Imprestlines.Validate(Imprestlines."Account No.");
    //                             Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                             // SafariMembers.CalcFields("G/L Account");
    //                             Imprestlines."Account No." := ProjectTeam."G/L Account";
    //                             Imprestlines.Validate(Imprestlines."Account No.");
    //                             Imprestlines.Purpose := ProjectTeam."Work Type";
    //                             Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                             Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
    //                             Imprestlines."No. of Days" := SafariMembers."Time Period";
    //                             Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
    //                             Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
    //                             Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
    //                             Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                             Imprestlines."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                             Imprestlines.Insert;
    //                             LineNo := LineNo + 10;

    //                         until ProjectTeam.Next = 0;
    //                     end;


    //                     Othercost.Reset;
    //                     Othercost.SetRange(Othercost."Imprest Memo No.", docnum);
    //                     if Othercost.Find('-') then begin
    //                         repeat
    //                             Imprestlines.Init;
    //                             Imprestlines."Line No" := LineNo;
    //                             Imprestlines.No := Imprestheaders."No.";
    //                             Imprestlines."Account Type" := Imprestlines."account type"::Employee;
    //                             // SafariMembers.CalcFields("G/L Account");
    //                             Imprestlines."Account No." := SafariMembers."No.";
    //                             Imprestlines.Validate(Imprestlines."Account No.");

    //                             Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                             Othercost.CalcFields("No.");
    //                             Imprestlines."Account No." := Othercost."No.";
    //                             Imprestlines.Validate(Imprestlines."Account No.");
    //                             Imprestlines.Purpose := Othercost."Required For";
    //                             Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
    //                             Imprestlines."No. of Days" := SafariMembers."Time Period";
    //                             Imprestlines.Amount := Othercost."Line Amount";
    //                             Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                             Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
    //                             Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
    //                             Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                             Imprestlines."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                             Imprestlines.Insert;
    //                             LineNo := LineNo + 10;

    //                         until Othercost.Next = 0;
    //                     end;


    //                     Casual.Reset;
    //                     Casual.SetRange(Casual."Imprest Memo No.", docnum);
    //                     if Casual.Find('-') then begin
    //                         repeat
    //                             Imprestlines.Init;
    //                             Imprestlines."Line No" := LineNo;
    //                             Imprestlines.No := Imprestheaders."No.";
    //                             Imprestlines."Account Type" := Imprestlines."account type"::Employee;
    //                             // SafariMembers.CalcFields("G/L Account");
    //                             Imprestlines."Account No." := SafariMembers."No.";
    //                             Imprestlines.Validate(Imprestlines."Account No.");

    //                             Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
    //                             Imprestlines."Account No." := Casual."G/L Account";
    //                             Imprestlines.Validate(Imprestlines."Account No.");
    //                             Imprestlines.Purpose := Casual.Activity;
    //                             Imprestlines."Daily Rate" := Casual.Rate;
    //                             Imprestlines."No. of Days" := Casual."No. of Days";
    //                             Imprestlines.Amount := Casual.Amount;
    //                             Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
    //                             Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
    //                             Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
    //                             Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
    //                             Imprestlines."Currency Code" := SafariMembers."Currency Code";
    //                             Imprestlines."Dimension Set ID" := Memoheaders."Dimension Set ID";
    //                             Imprestlines.Insert;
    //                             LineNo := LineNo + 10;

    //                         until Casual.Next = 0;
    //                     end;
    //                 end;

    //                 Imprestheaders.Validate(Imprestheaders.Status);
    //                 // //send email to participants
    //                 // CashMgt.Get;
    //                 // if CashMgt."Send Email Notification" = true then begin
    //                 //     if Email1 <> '' then begin
    //                 //         Body := 'Your imprest application no. ' + Imprestheaders."No." + ' has been created from memo no. ' + Rec."No." +
    //                 //         ' Kindly logon to Microsoft Dynamics 365 Business Central to confirm and send it for approval.';

    //                 //         //SMTP.Create('Judiciary', Email2,
    //                 //         // Email1, 'Imprest ' + 'No: ' + Imprestheaders."No.",
    //                 //         // 'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
    //                 //         // 'Your imprest application no. ' + Imprestheaders."No." + 'of amount ' + Format(SafariMembers.Entitlement) + ''' has been created from memo no. ' + "No." +
    //                 //         // ' and has been fowarded to finance for processing.<BR><BR>', true);

    //                 //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
    //                 //         //SMTP.Send();

    //                 //     end;
    //                 // end;
    //                 SafariMembers1 := SafariMembers;
    //             until SafariMembers.Next = 0;
    //         end;

    //         Memoheaders."Imprest Created" := true;
    //         Memoheaders."Date converted" := Today;
    //         Memoheaders."Time converted" := Time;
    //         Memoheaders."Converted By" := UserName;
    //         Memoheaders.Posted := true;
    //         Memoheaders.Modify;
    //     end;
    //     Message('Success');
    //     // end else
    //     //     Error('The payment for claim No. %1 has already been processed.', Memoheaders."No.");
    //     // //END;
    // end;

    procedure resetPassword("employeeNumber-idNumber": Code[20]) status: Text
    begin
        status := 'danger*Account not found';
        Employee.Reset;
        Employee.SetRange(Employee."No.", "employeeNumber-idNumber");
        if Employee.FindSet then begin
            status := myResetPass(Employee);
        end else begin
            Employee.Reset;
            Employee.SetRange(Employee."ID Number", "employeeNumber-idNumber");
            if Employee.FindSet then begin
                status := myResetPass(Employee);
            end
            else begin
                if HrJobsApplicants.Get("employeeNumber-idNumber") then begin
                    status := myResetPassExternal(HrJobsApplicants);
                end
                else begin
                    status := 'danger*Account with the given credentials does not exist';
                end;
            end;
        end;

    end;

    local procedure myResetPass(Employee: Record Employee) status: Text
    var
        employeeEmail: Text;
        password: Integer;
        passwordOk: Boolean;
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit EMail;
        HumanResourcesSetup: Record "Human Resources Setup";
        SenderName: Text[250];
        SenderEmailAddress: Text[250];
        Receipients: List of [Text];
        Subject: Text[250];
        Body: Text[250];
        CompInfo: Record "Company Information";
    begin
        employeeEmail := Employee."Company E-Mail";
        if employeeEmail = '' then begin
            status := 'danger*You have not added company email to the selected employee. Kindly update and try again';
        end else begin
            passwordOk := false;
            repeat
                password := Random(9999);
                if password > 1000 then
                    passwordOk := true;
            until passwordOk = true;
            HRPortalUsers.Reset;
            HRPortalUsers.SetRange(HRPortalUsers.employeeNo, Employee."No.");
            if HRPortalUsers.FindSet then begin
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Modify(true);
            end else begin
                HRPortalUsers.Init;
                HRPortalUsers.employeeNo := Employee."No.";
                HRPortalUsers.IdNo := Employee."ID Number";
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Insert(true);
            end;
            // prepare email
            // Receipients.Add(Employee."Company E-Mail");
            //HumanResourcesSetup.Get;
            // HumanResourcesSetup.TestField("HR E-mail Address");
            //  SenderEmailAddress := HumanResourcesSetup."HR E-mail Address";
            CompInfo.get();
            Subject := 'ONE TIME PASSWORD (OTP) - ESS';
            Body := 'Dear ' + Employee.Title + ' ' + Employee."First Name" + ' ' + Employee."Last Name" + ', Your One Time password is: ';
            Body := Body + '<strong>' + Format(HrPortalUsers.password) + '</strong>. Kindly use it to access the employee self service portal. <br>';
            Body := Body + ' ' + 'Kind Regards, ' + CompInfo.Name + '<br><br>';
            Body := Body + '[This email is automated. Kindly do not reply to it]<br><br>';
            SMTPMail.Create(employeeEmail, Subject, Body, true);
            Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);
            status := 'success*We have sent a one time password to your email (' + employeeEmail + '). Use it to log in to your account';
        end;
    end;

    local procedure myResetPassExternal(HrJobsApplicants: Record "Hr Jobs Applicants") status: Text
    var
        employeeEmail: Text;
        password: Integer;
        passwordOk: Boolean;
    begin
        employeeEmail := HrJobsApplicants."E-Mail";
        if employeeEmail = '' then begin
            status := 'danger*You have not added an email to you account. ';
        end else begin
            passwordOk := false;
            repeat
                password := Random(9999);
                if password > 1000 then
                    passwordOk := true;
            until passwordOk = true;
            HRPortalUsers.Reset;
            HRPortalUsers.SetRange(HRPortalUsers.IdNo, HrJobsApplicants."ID Number");
            if HRPortalUsers.FindSet then begin
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Modify(true);
            end else begin
                HRPortalUsers.Init;
                HRPortalUsers.employeeNo := Employee."No.";
                HRPortalUsers.IdNo := Employee."ID Number";
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Insert(true);
            end;
            objMail.CreateMessage(employeeEmail, '', '', 'Employee Password Reset', 'Your one time password is <strong>' + Format(password) + '</strong>', true, true);

            // objMail.Send();
            status := 'success*We have sent a on time password to your email (' + employeeEmail + '). Use it to log in to your account';
        end;
    end;

    // procedure createPettyCash(docNo: Text[50]; empNo: Text; job: Text[100]; jobTaskno: Text[100]; pNarration: Text[100]; region: Text[100]; constituency: Text[100]) status: Text
    // begin
    //     Payments.Reset;
    //     Payments.SetRange("No.", docNo);
    //     Payments.SetRange("Account No.", empNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     if Payments.FindSet then begin
    //         Payments."Payment Narration" := pNarration;
    //         Payments.Validate("Payment Narration");
    //         Payments.Job := job;
    //         Payments.Validate(Job);
    //         Payments."Job Task No" := jobTaskno;
    //         Payments."Job Task No." := jobTaskno;
    //         Payments.Validate("Job Task No.");
    //         Payments.Validate("Job Task No");
    //         Payments."Responsibility Center" := region;//Added By Fred
    //         if Payments.Modify(true) then begin
    //             Payments."Responsibility Center" := region;
    //             Payments.Modify(true);
    //             status := 'success*' + Payments."No." + ' *Your Petty cash was successfully updated';
    //         end else begin
    //             status := 'danger*Your Petty cash could not be updated';
    //         end;
    //     end else begin
    //         Payments.Init;
    //         Payments."No." := '';
    //         Payments."Document Type" := Payments."document type"::"Petty Cash";
    //         Payments.Validate("Document Type");
    //         Payments."Payment Type" := Payments."payment type"::"Petty Cash";
    //         Payments.Validate("Payment Type");
    //         Payments."Account Type" := Payments."account type"::Employee;
    //         Payments.Validate("Account Type");
    //         Payments."Account No." := empNo;
    //         Payments.Validate("Account No.");
    //         Payments."Payment Narration" := pNarration;
    //         Payments.Validate("Payment Narration");
    //         Payments."Responsibility Center" := region;//Added By Fred
    //         Payments.Job := job;
    //         Payments.Validate(Job);
    //         Payments."Job Task No" := jobTaskno;
    //         Payments."Job Task No." := jobTaskno;
    //         Payments.Validate("Job Task No.");
    //         Payments.Validate("Job Task No");
    //         Payments.Date := Today();
    //         if Payments.Insert(true) then begin
    //             Payments."Responsibility Center" := region;
    //             Payments.Modify(true);
    //             status := 'success*' + Payments."No.";
    //         end else begin
    //             status := 'danger*Your Petty cash could not be captured';
    //         end;
    //     end;
    // end;

    // procedure createPettyCashLines(docNo: Text[50]; type: Text[100]; Amount: Decimal) status: Text
    // begin
    //     PVLines.Reset;
    //     PVLines.SetRange(No, docNo);
    //     PVLines.SetRange(Type, type);
    //     if PVLines.FindSet then begin
    //         status := 'error* Type with  description ' + type + ' already exists';
    //     end else begin
    //         PVLines.Init;
    //         PVLines.No := docNo;
    //         PVLines.Type := type;
    //         PVLines.Validate(Type);
    //         PVLines.Validate("Account No");
    //         PVLines.Amount := Amount;
    //         PVLines.Insert(true);
    //         status := 'success*Line successfully added';
    //     end
    // end;

    // procedure PopulatePettyCash(docNo: Text[50]; empNo: Text) status: Text
    // begin
    //     Payments.Reset;
    //     Payments.SetRange("No.", docNo);
    //     Payments.SetRange("Account No.", empNo);
    //     Payments.SetRange(Status, Payments.Status::Released);
    //     if Payments.FindSet then begin
    //         Payments."Imprest Issue Doc. No" := docNo;
    //         if Payments.Modify(true) then begin
    //             Payments.Validate("Imprest Issue Doc. No");
    //             status := 'success*' + Payments."No." + ' *Your Petty cash was successfully updated';
    //         end else begin
    //             status := 'danger*Your Petty cash could not be updated';
    //         end;
    //     end;
    // end;

    // procedure editPettyCashLines(type: Text[100]; amount: Decimal; reqNo: Text[100]; id: Integer) status: Text
    // begin
    //     PVLines.Reset;
    //     PVLines.SetRange(No, reqNo);
    //     PVLines.SetRange("Line No", id);
    //     if PVLines.FindSet then begin

    //         PVLines.Type := type;
    //         PVLines.Amount := amount;
    //         PVLines.Validate(Amount);
    //         PVLines.Validate("Account No");
    //         PVLines.Modify(true);
    //         status := 'success*Petty cash line successfully updated';


    //     end
    //     else begin

    //         status := 'error*The Petty cash line could not be updated.'

    //     end
    // end;

    procedure DeletePRNExpense(Document: code[30]; LineNu: Integer)
    var
        myInt: Integer;
        ExpenseLines: Record "Expense Req. Allocation";
    begin
        ExpenseLines.Reset();
        ExpenseLines.SetRange("Document No.", Document);
        ExpenseLines.SetRange("Line No.", LineNu);
        if ExpenseLines.Find('-') then
            ExpenseLines.Delete();
    end;

    procedure DelegateApproval(DocNUm: Code[30])
    var
        myInt: Integer;
        Approvalentry: Record "Approval Entry";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        Approvalentry.Reset();
        Approvalentry.SetRange("Document No.", DocNUm);
        if Approvalentry.FindFirst() then begin
            ApprovalsMgmt.DelegateRecordApprovalRequest(Approvalentry.RecordId);
        end;
    end;

    // procedure deletePettyCashLines(id: Integer; reqNo: Text[100]) status: Text
    // begin
    //     PVLines.Reset;
    //     PVLines.SetRange(No, reqNo);
    //     PVLines.SetRange("Line No", id);
    //     if PVLines.FindSet then begin
    //         PVLines.Delete;
    //         status := 'success* Petty cash line deleted successfully added';

    //     end
    //     else begin

    //         status := 'error*The Petty cash line could not be deleted.Please try again';

    //     end
    // end;

    // procedure sendPettyCashRequestApproval(employeeNo: Code[50]; reqNo: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    // begin
    //     Payments.Reset;
    //     Payments.SetRange("No.", reqNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     if Payments.FindSet then begin
    //         //MESSAGE(FORMAT(Payments."Total Amount"));
    //         Payments.TestField("Payment Narration");
    //         Payments.CalcFields("Total Amount");
    //         Payments.TestField(Payments."Total Amount");
    //         Payments.Status := Payments.Status::"Pending Approval";
    //         if Payments.Modify(true) then begin
    //             status := 'success*The petty cash request was successfully sent for approval';
    //         end else begin
    //             status := 'danger*The petty cash request was not successfully sent for approval';
    //         end
    //     end else begin
    //         status := 'danger*A petty cash request with the given number does not exist, you are not the requestor or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure cancelPettyCashRequestApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text
    // var

    // begin

    //     Payments.Reset;
    //     Payments.SetRange("No.", recordNo);
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange(Status, Payments.Status::"Pending Approval");
    //     if Payments.FindSet then begin
    //         Payments.status := Payments.Status::Open;
    //         if Payments.Modify(true) then begin
    //             status := 'success*Your petty cash requisition approval was successfully cancelled';
    //         end else begin
    //             status := 'danger*Sorry, your request could not be completed. Kindly try again! Contact the system administrator if this error persists. ';
    //         end;


    //     end else begin


    //         status := 'danger*The petty cash requisition does not exist or you are not the requester or status is not pending';
    //     end;
    //     exit(status);

    // end;

    // procedure updatePettyCashSurrenderLine(employeeNo: Code[50]; pettyCashNo: Code[50]; lineNo: Integer; amountSpent: Decimal; receipt: Text) status: Text
    // var
    //     ImprestLines: Record "Imprest Lines";
    // begin
    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.", pettyCashNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
    //     if Payments.FindSet then begin
    //         PettyCashLines.Reset;
    //         PettyCashLines.SetRange(No, pettyCashNo);
    //         PettyCashLines.SetRange("Line No", lineNo);
    //         if PettyCashLines.FindSet then begin

    //             PettyCashLines.Validate("Actual Spent", amountSpent);
    //             PettyCashLines.Validate("Receipt No.", receipt);
    //             if PettyCashLines.Modify(true) then begin
    //                 status := 'success*The petty cash line was successfully updated';//+FORMAT(lineNo);
    //             end else begin
    //                 status := 'danger*The petty cash line could not be updated';
    //             end;
    //         end else begin
    //             status := 'danger*The petty cash line does not exist' + Format(lineNo);
    //         end;
    //     end else begin
    //         status := 'danger*An petty cash surrender with the given number does not exist, you are not the requestor or is no longer released';
    //     end;
    //     exit(status);
    // end;

    // procedure sendPettyCashSurrenderApproval(employeeNo: Code[50]; imprestSurrenderNo: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    // begin

    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.", imprestSurrenderNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
    //     if Payments.FindSet then begin
    //         //Payments.TESTFIELD(Job);
    //         //Payments.TESTFIELD("Job Task No");
    //         //Payments.TESTFIELD("Actual Amount Spent");
    //         //if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
    //         // ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
    //         if Payments1.Get(Payments."No.") then begin
    //             Payments1.Selected := true;
    //             Payments1.Modify;
    //         end;
    //         if Payments2.Get(imprestSurrenderNo) then begin
    //             if Payments2.Status = Payments2.Status::"Pending Approval" then begin
    //                 status := 'success*The Petty Cash Surrender was successfully sent for approval';
    //             end;
    //         end;
    //     end else begin
    //         status := 'danger*An Petty Cash surrender with the given number does not exist, you are not the requestor or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure cancelPettyCashSurrenderApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text
    // var
    //     HRLeaveApplication1: Record "HR Leave Application";
    //     ImprestMemo1: Record "Imprest Memo";
    //     Payments2: Record payments;
    //     ImprestHeader: Record payments;
    //     PurchaseHeader1: Record "Purchase Header";
    //     TransportRequisition: Record "Transport Requisition";
    //     TransportRequisition1: Record "Transport Requisition";
    // begin

    //     Payments.Reset;
    //     Payments.SetRange("No.", recordNo);
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange(Status, Payments.Status::"Pending Approval");
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
    //     if Payments.FindSet then begin
    //         //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
    //         Payments1.Reset;
    //         Payments1.SetRange("No.", recordNo);
    //         if Payments1.FindSet then begin

    //             if Payments1.Status = Payments.Status then begin
    //                 Message(Format(Payments1.Status));
    //                 status := 'warning*Your petty cash surrender  approval could not be cancelled';
    //             end else begin
    //                 status := 'success*Your petty cash surrender approval was successfully cancelled';
    //             end;
    //         end;
    //     end else begin
    //         status := 'danger*The petty cash surrender does not exist or you are not the requester or status is not pending';



    //     end;
    //     exit(status);
    // end;

    procedure createTrainingRequisition(trainingplan: Code[100]; courseTitle: Text[100]; trainingVenue: Text[100]; respCenter: Text; location: Text[100]; provider: Text[100]; empNo: Text[100]; desc: Text) docNo: Text[100];
    begin
        // TrainingRequisition.Reset;
        // TrainingRequisition.SetRange(Code, docNo);
        // TrainingRequisition.SetRange("Employee No.", empNo);
        // if TrainingRequisition.FindSet then begin
        //     TrainingRequisition."Course Title" := courseTitle;
        //     TrainingRequisition.Validate("Course Title");
        //     TrainingRequisition."Training Venue Region Code" := trainingVenue;
        //     TrainingRequisition.Validate("Training Venue Region Code");
        //     TrainingRequisition.Location := location;
        //     TrainingRequisition.Provider := provider;
        //     TrainingRequisition.Validate(Provider);
        //     TrainingRequisition."Global Dimension 1 Code" := respCenter;
        //     TrainingRequisition.Description := desc;
        //     TrainingRequisition.Duration := TrainingRequisition."End Date" - TrainingRequisition."Start Date";
        //     if TrainingRequisition.Modify(true) then begin
        //         status := 'success*Training application created successfully*' + TrainingRequisition.Code + '*' + TrainingRequisition."Training Plan No.";
        //     end else begin
        //         status := 'danger*Training application was not created successfully*';
        //     end;
        // end else begin
        HrSetup.Get();
        HrSetup.TestField("Training Application Nos.");
        docNo := NoSeriesMgt.GetNextNo(HrSetup."Training Application Nos.", 0D, true);
        TrainingRequisition.Init;
        TrainingRequisition.Code := docNo;
        TrainingRequisition."Course Title" := courseTitle;
        TrainingRequisition.Validate("Course Title");
        TrainingRequisition."Employee No." := empNo;
        TrainingRequisition."Training Venue Region Code" := trainingVenue;
        TrainingRequisition.Validate("Training Venue Region Code");
        TrainingRequisition.Location := location;
        TrainingRequisition.Provider := provider;
        TrainingRequisition.Validate(Provider);
        TrainingRequisition."Application Date" := Today();
        TrainingRequisition."Employee No." := empNo;
        if HREmp.Get(empNo) then
            TrainingRequisition."Created By" := HREmp."User ID";
        TrainingRequisition."Created On" := Today;
        TrainingRequisition.Description := desc;
        TrainingRequisition.Duration := TrainingRequisition."End Date" - TrainingRequisition."Start Date";
        TrainingRequisition.Insert(false);
        //end;
    end;

    // procedure ClearEftLines(DocNo: code[40])
    // var
    //     EFTLines: Record "EFT Line";
    // begin
    //     EFTLines.Reset();
    //     EFTLines.SetRange("Document No.", DocNo);
    //     if EFTLines.FindSet() then
    //         EFTLines.DeleteAll(true);
    // end;

    // procedure CreateEftHeader(PayAct: code[40]; GeoLoc: Code[40]; Docum: Code[40]; Remarks: Text; Batch: code[40]; createdBy: Code[20]) Doc: Code[30]

    // var
    //     myInt: Integer;
    //     NxtDoc: code[30];
    //     EftHeader: Record "EFT Header";
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    //     NoSetup: Record "Cash Management Setup";
    // begin
    //     NoSetup.Get();
    //     EftHeader.reset;
    //     if EftHeader.findlast then
    //         NxtDoc := NoSeriesMgt.GetNextNo(NoSetup."EFT Header Nos.", 0D, true);
    //     EftHeader.Init();
    //     EftHeader.No := NxtDoc;
    //     EftHeader.Batch := Batch;
    //     eftheader.Validate(EftHeader.Batch);
    //     EftHeader."Bank  No" := PayAct;
    //     EftHeader.Validate(EftHeader."Bank  No");
    //     EftHeader."Global Dimension 1 Code" := GeoLoc;
    //     EftHeader.Validate(EftHeader."Global Dimension 1 Code");
    //     EftHeader.Remarks := Remarks;
    //     EftHeader."Date Entered" := Today;
    //     EftHeader."Time Entered" := Time;
    //     EftHeader."Entered By" := createdBy;
    //     EftHeader.Insert();
    //     Doc := EftHeader.No;
    //     exit(Doc);
    // end;

    // procedure CreateEftLines(docNo: Code[50]; sourceDocumentNo: Code[50]; lineNumber: Integer; paymentType: Text)
    // var
    //     EFTLines: Record "EFT Line";
    //     PVLines: Record "PV Lines";
    //     LineNo: Integer;
    //     PV: record "Payments";
    // begin
    //     if paymentType in ['Imprest'] then begin
    //         PV.Reset();
    //         PV.SetRange(Posted, true);
    //         PV.SetRange("No.", sourceDocumentNo);
    //         PV.SetRange("EFT Code", '');
    //         if PV.FindFirst() then begin
    //             PV.CalcFields("Imprest Amount", "Total Amount LCY");
    //             EFTLines.Reset();
    //             EFTLines.SetRange("Document No.", docNo);
    //             EFTLines.SetRange("Source Record ID", PV.RecordId);
    //             if EFTLines.FindFirst() then begin

    //                 EFTLines."Account Type" := PV."Account Type";
    //                 EFTLines."Account No." := PV."Account No.";
    //                 EFTLines.Description := PV."Payment Narration";
    //                 if PV."Document Type" = PV."Document Type"::Imprest then
    //                     EFTLines.Amount := PV."Imprest Amount"
    //                 else
    //                     EFTLines.Amount := PV."Total Amount LCY";
    //                 EFTLines."Source Document No." := PV."No.";
    //                 EFTLines."Source Record ID" := PV.RecordId;
    //                 EFTLines."Source Document Type" := Format(PV."Document Type");
    //                 EFTLines."Payee Bank Code" := PV."Payee Bank Code";
    //                 EFTLines."Payee Bank Name" := PV."Payee Bank Name";
    //                 EFTLines."Payee Bank Branch Code" := PV."Payee Bank Branch";
    //                 EFTLines."Payee Bank Branch Name" := PV."Payee Branch Name";
    //                 EFTLines."Payee Bank Account No." := PV."Payee Bank Account";
    //                 EFTLines."Payee Bank Account Name" := PV.Payee;
    //                 EFTLines."Global Dimension 1 Code" := PV."Shortcut Dimension 1 Code";
    //                 EFTLines."Pay Mode" := PV."Pay Mode";
    //                 EFTLines.Modify();
    //                 UpdatePaymentsSourceDocument(EFTLines);
    //             end else begin
    //                 EFTLines.Reset();
    //                 if EFTLines.Find('-') then
    //                     LineNo := EFTLines.Count + 1;
    //                 if LineNo = 0 then LineNo := 1;
    //                 EFTLines.Init();
    //                 EFTLines."Line No." := LineNo;
    //                 EFTLines."Document No." := docNo;
    //                 EFTLines."Account Type" := PV."Account Type";
    //                 EFTLines."Account No." := PV."Account No.";
    //                 EFTLines.Description := PV."Payment Narration";
    //                 EFTLines."Account Type" := PV."Account Type";
    //                 EFTLines."Account No." := PV."Account No.";
    //                 EFTLines.Description := PV."Payment Narration";
    //                 if PV."Document Type" = PV."Document Type"::Imprest then
    //                     EFTLines.Amount := PV."Imprest Amount"
    //                 else
    //                     EFTLines.Amount := PV."Total Amount LCY";
    //                 EFTLines."Source Document No." := PV."No.";
    //                 EFTLines."Source Record ID" := PV.RecordId;
    //                 EFTLines."Source Document Type" := Format(PV."Document Type");
    //                 EFTLines."Payee Bank Code" := PV."Payee Bank Code";
    //                 EFTLines."Payee Bank Name" := PV."Payee Bank Name";
    //                 EFTLines."Payee Bank Branch Code" := PV."Payee Bank Branch";
    //                 EFTLines."Payee Bank Branch Name" := PV."Payee Branch Name";
    //                 EFTLines."Payee Bank Account No." := PV."Payee Bank Account";
    //                 EFTLines."Payee Bank Account Name" := PV.Payee;
    //                 EFTLines."Global Dimension 1 Code" := PV."Shortcut Dimension 1 Code";
    //                 EFTLines."Pay Mode" := PV."Pay Mode";
    //                 EFTLines.Insert();
    //                 UpdatePaymentsSourceDocument(EFTLines);
    //             end;
    //         end;
    //     end else begin
    //         PVLines.Reset();
    //         PVLines.SetRange("No", sourceDocumentNo);
    //         PVLines.SetRange("Line No", lineNumber);
    //         PV.Reset();
    //         PV.SetRange("No.", sourceDocumentNo);
    //         if PV.FindFirst() then begin
    //             if PvLines.Findset() then begin
    //                 EFTLines.Reset();
    //                 EFTLines.SetRange("Document No.", docNo);
    //                 EFTLines.SetRange("Source Record ID", PVLines.RecordId);
    //                 if EFTLines.FindFirst() then begin
    //                     EFTLines."Document No." := docNo;
    //                     EFTLines."Account Type" := PvLines."Account Type";
    //                     EFTLines."Account No." := PvLines."Account No";
    //                     EFTLines.Description := PV."Payment Narration";
    //                     if paymentType = 'Payment Voucher' then
    //                         EFTLines.Amount := PvLines."Net Amount"
    //                     else
    //                         EFTLines.Amount := PvLines.Amount;
    //                     EFTLines."Source Document No." := PvLines.No;
    //                     EFTLines."Source Document Type" := PvLines."Source Document Type";
    //                     EFTLines."Source Record ID" := PVLines.RecordId;
    //                     EFTLines."Payee Bank Code" := PvLines."Payee Bank Code";
    //                     EFTLines."Payee Bank Name" := PvLines."Payee Bank Name";
    //                     EFTLines."Payee Bank Branch Code" := PvLines."Payee Bank Branch Code";
    //                     EFTLines."Payee Bank Branch Name" := PvLines."Payee Bank Branch Name";
    //                     EFTLines."Payee Bank Account No." := PvLines."Payee Bank Account No.";
    //                     EFTLines."Payee Bank Account Name" := PvLines."Payee Bank Acc Name";
    //                     EFTLines."Global Dimension 1 Code" := PvLines.HeaderDimension1Code;
    //                     EFTLines."Pay Mode" := PV."Pay Mode";
    //                     EFTLines.Modify();
    //                     UpdateSourceDocument(EFTLines);
    //                 end else begin
    //                     EFTLines.Reset();
    //                     if EFTLines.Find('-') then
    //                         LineNo := EFTLines.Count + 1;
    //                     if LineNo = 0 then LineNo := 1;
    //                     EFTLines.Init();
    //                     EFTLines."Line No." := LineNo;
    //                     EFTLines."Document No." := docNo;
    //                     EFTLines."Account Type" := PvLines."Account Type";
    //                     EFTLines."Account No." := PvLines."Account No";
    //                     EFTLines.Description := PV."Payment Narration";
    //                     if paymentType = 'Payment Voucher' then
    //                         EFTLines.Amount := PvLines."Net Amount"
    //                     else
    //                         EFTLines.Amount := PvLines.Amount;
    //                     EFTLines."Source Document No." := PvLines.No;
    //                     EFTLines."Source Document Type" := PvLines."Source Document Type";
    //                     EFTLines."Source Record ID" := PVLines.RecordId;
    //                     EFTLines."Payee Bank Code" := PvLines."Payee Bank Code";
    //                     EFTLines."Payee Bank Name" := PvLines."Payee Bank Name";
    //                     EFTLines."Payee Bank Branch Code" := PvLines."Payee Bank Branch Code";
    //                     EFTLines."Payee Bank Branch Name" := PvLines."Payee Bank Branch Name";
    //                     EFTLines."Payee Bank Account No." := PvLines."Payee Bank Account No.";
    //                     EFTLines."Payee Bank Account Name" := PvLines."Payee Bank Acc Name";
    //                     EFTLines."Global Dimension 1 Code" := PvLines.HeaderDimension1Code;
    //                     EFTLines."Pay Mode" := PV."Pay Mode";
    //                     EFTLines.Insert();
    //                     UpdateSourceDocument(EFTLines);
    //                 end;
    //             end;
    //         end;
    //     end;
    // end;


    // procedure UpdateSourceDocument(var EFTLines: Record "EFT Line")
    // var
    //     PVLine: Record "PV Lines";
    //     RecRef: RecordRef;
    // begin
    //     if RecRef.Get(EFTLines."Source Record ID") then;
    //     case
    //         RecRef.Number of
    //         Database::"PV Lines":
    //             begin
    //                 RecRef.SetTable(PVLine);
    //                 PVLine."EFT Code" := EFTLines."Document No.";
    //                 PVLine.Modify();
    //             end;
    //     end;
    // end;

    // procedure UpdatePaymentsSourceDocument(var EFTLines: Record "EFT Line")
    // var
    //     Payment: Record "Payments";
    //     RecRef: RecordRef;
    //     PVLine: Record "PV Lines";
    // begin
    //     if RecRef.Get(EFTLines."Source Record ID") then;
    //     case
    //         RecRef.Number of
    //         Database::"Payments":
    //             begin
    //                 RecRef.SetTable(Payment);
    //                 Payment."EFT Code" := EFTLines."Document No.";
    //                 Payment.Modify();
    //                 PVLine.Reset;
    //                 PVLine.SetRange(No, Payment."No.");
    //                 if PVLine.FindSet() then
    //                     PVLine.ModifyAll("EFT Code", EFTLines."Document No.");
    //             end;
    //     end;
    // end;

    // procedure addTrainingParticipants2(type: Text[100]; participantEmpno: Text[100]; noOfDays: Decimal; reqNo: Text[100]) status: Text
    // begin
    //     TrainingRequisition.Reset;
    //     TrainingRequisition.SetRange(Code, reqNo);
    //     if TrainingRequisition.FindSet then begin
    //         TrainingParticipants.Reset;
    //         TrainingParticipants.SetRange("Training Code", reqNo);
    //         TrainingParticipants.SetRange("Employee Code", participantEmpno);
    //         if TrainingParticipants.FindSet then begin
    //             status := 'error*The participants already exists.'
    //         end else begin
    //             TrainingParticipants.Init;
    //             TrainingParticipants.Type := type;
    //             TrainingParticipants."Employee Code" := participantEmpno;
    //             TrainingParticipants.Validate("Employee Code");
    //             TrainingParticipants."Training Code" := reqNo;
    //             TrainingParticipants.Destination := TrainingRequisition."Training Venue Region Code";
    //             TrainingParticipants."Training Responsibility Code" := TrainingRequisition."Global Dimension 1 Code";
    //             TrainingParticipants."Training Responsibility" := TrainingRequisition."Training Responsibility";
    //             TrainingParticipants."No. of Days" := noOfDays;
    //             TrainingParticipants.Validate("No. of Days");
    //             if TrainingParticipants.Insert(true) then begin
    //                 status := 'success*Training Participant successfully added';
    //             end else begin
    //                 status := 'danger*Training Participant was not added, please try again!';
    //             end
    //         end;
    //     end;
    // end;

    // procedure editTrainingParticipants2(docNo: Code[100]; lineno: Integer; type: Text[100]; empNo: Text[100]; noOfDays: Integer) status: Text
    // begin
    //     TrainingParticipants.Reset;
    //     TrainingParticipants.SetRange("Training Code", docNo);
    //     TrainingParticipants.SetRange("Line No", lineno);
    //     if TrainingParticipants.FindSet then begin
    //         TrainingParticipants.Type := type;
    //         TrainingParticipants."Employee Code" := empNo;
    //         //TrainingParticipants.VALIDATE("Employee Code");
    //         TrainingParticipants."No. of Days" := noOfDays;
    //         if TrainingParticipants.Modify(true) then begin
    //             status := 'success*The training participant was successfully updated';
    //         end else begin
    //             status := 'danger*The training participant could not be updated.';
    //         end;
    //     end
    // end;

    // procedure deleteTrainingParticipants2(id: Integer; reqNo: Text[100]) status: Text
    // begin
    //     TrainingParticipants.Reset;
    //     TrainingParticipants.SetRange("Training Code", reqNo);
    //     TrainingParticipants.SetRange("Line No", id);
    //     if TrainingParticipants.FindSet then begin
    //         if TrainingParticipants.Delete(true) then begin
    //             status := 'success*The training participant ' + TrainingParticipants."Employee Name" + ' was successfully removed';
    //         end else begin
    //             status := 'danger*The training participant ' + TrainingParticipants."Employee Name" + ' would not be removed, kindly try again!';
    //         end;
    //     end;
    // end;

    procedure addTrainingCost2(docNo: Code[100]; costcategory: Integer; costitem: Code[100]; itemcategory: Code[100]; item: Code[100]; unitcost: Decimal; quantity: Integer) status: Text
    var
        TrainingCost: Record "Training Cost";
        TrainingRequests: Record "Training Requests";
    begin
        TrainingCost.Init;
        TrainingCost."Training ID" := docNo;
        TrainingCost."Cost Category" := costcategory;
        TrainingCost."Cost Item" := costitem;
        TrainingCost."Item Category" := itemcategory;
        TrainingCost."Service/Item Code" := item;
        TrainingCost.Validate("Service/Item Code");
        TrainingCost."Unit Cost (LCY)" := unitcost;
        TrainingCost.Quantity := quantity;
        TrainingCost.Validate(Quantity);
        if TrainingCost.Insert(true) then begin
            status := 'success*The training cost was successfully added*';
        end else begin
            status := 'danger*The training cost was not added, please try again';
        end;
    end;

    procedure deleteTrainingcost2(id: Integer; reqNo: Text[100]) status: Text
    var
        TrainingCost: Record "Training Cost";
    begin
        TrainingCost.Reset;
        TrainingCost.SetRange("Training ID", reqNo);
        //TrainingCost.SETRANGE("Line No",id);
        if TrainingCost.FindSet then begin
            if TrainingCost.Delete(true) then begin
                status := 'success*The training cost was successfully removed';
            end else begin
                status := 'danger*The training cost would not be removed, kindly try again!';
            end;
        end;
    end;

    procedure AssignProcurementOfficer(DocNo: code[40]; PerchNum: code[40])
    var
        myInt: Integer;
        SalesPerson: record "User Setup";
        Salesper: Record "Salesperson/Purchaser";
        Purchaseheader: Record "Purchase Header";
    begin
        Purchaseheader.Reset();
        Purchaseheader.SetRange("No.", DocNo);
        if Purchaseheader.FindFirst() then begin
            Salesper.reset;
            Salesper.setrange(Salesper.Code, PerchNum);
            if Salesper.findfirst then begin
                SalesPerson.Reset();
                SalesPerson.SetRange(SalesPerson."Employee No.", Salesper."Employee No");
                if SalesPerson.findfirst then begin
                    Purchaseheader."Purchaser Code2" := SalesPerson."Employee No.";
                    Purchaseheader."Assigned Officer" := SalesPerson."Employee Name";
                    Purchaseheader."Assigned User ID" := SalesPerson."User ID";
                    Purchaseheader.Modify();
                end;
            end else begin
                Purchaseheader."Assigned Officer" := '';
                Purchaseheader.Modify();
            end;
        end;

    end;

    procedure SendBidcodes(Docn: Code[40])
    var
        myInt: Integer;
        BidRegister: Record "Bid Opening Register";
        Procurement: Codeunit "Procurement Processing";
    begin
        BidRegister.Reset();
        BidRegister.SetRange(Code, Docn);
        if BidRegister.FindFirst() then
            Procurement.FnSendSecretCodeOnIFSBidOpening(BidRegister)

    end;

    procedure sendTrainingRequestApproval(employeeNo: Code[50]; reqNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    // ProjectTeam: Record "Project Members";
    // ImprestMemo1: Record "Imprest Memo";
    begin
        TrainingRequisition.Reset;
        TrainingRequisition.SetRange("Employee No.", employeeNo);
        TrainingRequisition.SetRange(Code, reqNo);
        TrainingRequisition.SetRange(Status, TrainingRequisition.Status::Open);
        if TrainingRequisition.FindSet then begin
            TrainingRequisition.TestField(Duration);
            VarVariant := TrainingRequisition;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);

            if TrainingReq.Get(reqNo) then begin
                if TrainingReq.Status = TrainingReq.Status::"Pending Approval" then begin
                    status := 'success*The training request was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A training request with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure cancelTrainingRequestApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
        // ImprestMemo1: Record "Imprest Memo";
        Payments2: Record payments;
        ImprestHeader: Record payments;
        PurchaseHeader1: Record "Purchase Header";
        TransportRequisition: Record "Transport Requisition";
        TransportRequisition1: Record "Transport Requisition";
    begin
        TrainingRequisition.Reset;
        TrainingRequisition.SetRange(Code, recordNo);
        TrainingRequisition.SetRange("Employee No.", employeeNo);
        TrainingRequisition.SetRange(Status, TrainingRequisition.Status::"Pending Approval");
        if TrainingRequisition.FindSet then begin
            VarVariant := TrainingRequisition;
            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);

            if TrainingReq.Get(TrainingRequisition.Code) then begin
                TrainingReq.Status := TrainingReq.Status::Open;
                if TrainingReq.Modify(true) then begin
                    status := 'success*Your training requisition approval was successfully cancelled';
                end else begin
                    status := 'danger*Your training requisition approval could not be cancelled, please try again!';
                end;
            end;
        end;
    end;

    procedure fnGenerateTrainingApplicationReport(docNo: Code[100]) status: Text
    var
        TrainingRequests: Record "Training Requests";
    begin
        TrainingRequests.Reset;
        TrainingRequests.SetRange(Code, docNo);
        if TrainingRequests.FindSet then begin
            // if FILE.Exists(FILESPATH + docNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH + docNo + '.pdf');
            //     Report.SaveAsPdf(69122, FILESPATH + docNo + '.pdf', TrainingRequests);
            //     status := 'success*Generated*Downloads\TrainingApplication\' + docNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(69122, FILESPATH + docNo + '.pdf', TrainingRequests);
            //     status := 'success*Generated*Downloads\TrainingApplication\' + docNo + '.pdf';
            // end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateTrainingPlanReport(docNo: Code[100]) status: Text
    var
        TrainingPlanHeader: Record "Training Plan Header";
    begin
        TrainingPlanHeader.Reset;
        TrainingPlanHeader.SetRange(No, docNo);
        if TrainingPlanHeader.FindSet then begin
            // if FILE.Exists(FILESPATH23 + docNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH23 + docNo + '.pdf');
            //     Report.SaveAsPdf(69145, FILESPATH23 + docNo + '.pdf', TrainingPlanHeader);
            //     status := 'success*Generated*Downloads\TrainingPlan\' + docNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(69145, FILESPATH23 + docNo + '.pdf', TrainingPlanHeader);
            //     status := 'success*Generated*Downloads\TrainingPlan\' + docNo + '.pdf';
            // end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;



    // procedure createNewTrainingRequest(employeeNo: Code[30]; needsNo: Code[30]; CourseID:
    // Text; source: Option; description: Text) status: Text
    // var
    //     Hremployee: Record Employee;
    //     UserSetup: Record "User Setup";
    //     trainingNeedsHeader: Record "Training Needs Header";
    //     GLSetup: Record "Cash Management Setup";
    //     Questions: Record "Apptitude Question";
    //     TNAQuestions: Record "TNA Questions";
    // begin
    //     UserSetup.RESET;
    //     UserSetup.SETRANGE("Employee No.", employeeNo);
    //     IF UserSetup.FINDSET THEN BEGIN
    //         Hremployee.RESET;
    //         Hremployee.SETRANGE("No.", employeeNo);
    //         IF Hremployee.FINDSET THEN BEGIN
    //             IF needsNo = '' THEN BEGIN
    //                 HrSetup.get();
    //                 needsNo := NoSeriesMgt.GetNextNo(HrSetup."Training Need Nos.", 0D, true);
    //                 trainingNeedsHeader.INIT;
    //                 trainingNeedsHeader.Code := needsNo;
    //                 trainingNeedsHeader."Employee No" := UserSetup."Employee No.";
    //                 trainingNeedsHeader."Employee Name" := UserSetup."Employee Name";
    //                 trainingNeedsHeader."Created By" := UserSetup."User ID";
    //                 GLSetup.Get();
    //                 GLSetup.TestField("Current Budget");
    //                 trainingNeedsHeader."Financial Year" := GLSetup."Current Budget";
    //                 trainingNeedsHeader."Created On" := CurrentDatetime;
    //                 trainingNeedsHeader.Department := Hremployee.Department;
    //                 trainingNeedsHeader."Job Title" := Hremployee."Job Title";
    //                 trainingNeedsHeader."Date of First Appointment" := Hremployee."Employment Date";
    //                 trainingNeedsHeader."Course ID" := CourseID;
    //                 trainingNeedsHeader.Validate("Course ID");
    //                 trainingNeedsHeader.Source := source;
    //                 trainingNeedsHeader.Description := description;
    //                 IF trainingNeedsHeader.INSERT(false) THEN BEGIN
    //                     status := needsNo;
    //                 END ELSE BEGIN
    //                     status := '';
    //                 END;
    //             END ELSE BEGIN
    //                 trainingNeedsHeader.RESET;
    //                 trainingNeedsHeader.SETRANGE(Code, needsNo);
    //                 IF trainingNeedsHeader.FINDSET THEN BEGIN
    //                     trainingNeedsHeader.Description := description;
    //                     IF trainingNeedsHeader.MODIFY(TRUE) THEN BEGIN
    //                         status := trainingNeedsHeader.Code;
    //                     END ELSE BEGIN
    //                         status := '';
    //                     END;
    //                 END;
    //             END;
    //             Questions.Reset();
    //             Questions.SetRange("Document Type", Questions."Document Type"::"Training Needs Request");
    //             if Questions.FindSet() then
    //                 repeat
    //                     TNAQuestions.Init();
    //                     TNAQuestions."Training No" := needsNo;
    //                     TNAQuestions."Question ID" := Questions."Question ID";
    //                     TNAQuestions.Question := Questions.Question;
    //                     TNAQuestions.Insert();
    //                 until Questions.Next() = 0;
    //         END;
    //     END;
    // end;

    // procedure createNewTrainingNeedsLines(requestNo: Code[30]; description: Text; source: Integer; comments: Text) status: Text
    // var
    //     trainingNeedsHeader: Record "Training Needs Header";
    //     TrainingNeedsLines: Record "Training Needs Requests";
    // begin
    //     TrainingNeedsHeader.RESET;
    //     TrainingNeedsHeader.SETRANGE(Code, requestNo);
    //     IF TrainingNeedsHeader.FINDSET THEN BEGIN
    //         TrainingNeedsLines.INIT;
    //         TrainingNeedsHeader.Code := TrainingNeedsLines."Training Header No.";
    //         TrainingNeedsLines."Training Header No." := requestNo;
    //         TrainingNeedsLines."Course ID" := description;
    //         TrainingNeedsLines.Validate("Course ID");
    //         TrainingNeedsLines.Source := source;
    //         TrainingNeedsLines.Comments := comments;
    //         IF TrainingNeedsLines.INSERT(TRUE) THEN BEGIN
    //             status := 'success*Training needs lines were added successfully';
    //         END ELSE BEGIN
    //             status := 'danger*your request failed, kindly try again!';
    //         END;
    //     END;
    // end;

    // procedure InsertCurrentSkills(requestNo: Code[30]; "Major Tasks": Text; TrainingMode: Integer; ExistingTrainingNeeds: Text; TrainingRequired: Boolean; StartDate: Date; Institution: Text) status: Text
    // var
    //     trainingNeedsHeader: Record "Training Needs Header";
    //     CurrentSkills: Record "Current Skills Assessment";
    // begin
    //     TrainingNeedsHeader.RESET;
    //     TrainingNeedsHeader.SETRANGE(Code, requestNo);
    //     IF TrainingNeedsHeader.FINDSET THEN BEGIN
    //         CurrentSkills.INIT;
    //         CurrentSkills."Training No" := requestNo;
    //         CurrentSkills."Major Tasks" := "Major Tasks";
    //         CurrentSkills."Training Required" := TrainingRequired;
    //         CurrentSkills."Existing Training Needs" := ExistingTrainingNeeds;
    //         CurrentSkills."Training Mode" := TrainingMode;
    //         CurrentSkills."Start Date" := StartDate;
    //         CurrentSkills."Institution No." := Institution;
    //         CurrentSkills.Validate("Institution No.");
    //         IF CurrentSkills.INSERT(TRUE) THEN BEGIN
    //             status := 'success*Training needs lines were added successfully';
    //         END ELSE BEGIN
    //             status := 'danger*your request failed, kindly try again!';
    //         END;
    //     END;


    // end;


    // procedure SendTrainingNeedsApproval(employeeno: Code[30]; needsno: Code[30]) status: Text
    // var
    //     NeedsHeader: Record "Training Needs Header";
    //     NeedsHeader1: Record "Training Needs Header";
    // begin
    //     NeedsHeader.RESET;
    //     NeedsHeader.SETRANGE("Employee No", employeeno);
    //     //NeedsHeader.SETRANGE(Status, NeedsHeader.Status::Open);
    //     NeedsHeader.SETRANGE(Code, needsno);
    //     IF NeedsHeader.FINDSET THEN BEGIN
    //         VarVariant := NeedsHeader;
    //         IF CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
    //             CustomApprovalMgt.OnSendDocForApproval(VarVariant);
    //         NeedsHeader1.RESET;
    //         NeedsHeader1.SETRANGE("Employee No", employeeno);
    //         NeedsHeader1.SETRANGE(Code, needsno);
    //         IF NeedsHeader1.FINDSET THEN BEGIN
    //             //IF NeedsHeader1.Status = NeedsHeader1.Status::"Pending Approval" THEN BEGIN
    //             status := 'success*The needs request was successfully sent for approval';
    //             // END;
    //         END;
    //     END ELSE BEGIN
    //         status := 'danger*A needs request with the given number does not exist, you are not the requestor or is no longer open';
    //     END;
    //     EXIT(status);
    // end;

    procedure fnEditTrainingNeedsRequestLines(needsno: Code[30]; lineno: Integer; description: Text[100]; source: Integer; comments: Text[100]) status: Text
    var
        trainingNeedsHeader: Record "Training Needs Header";
        NeedsLines: Record "Training Needs Requests";
    begin
        NeedsLines.RESET;
        NeedsLines.SETRANGE("Training Header No.", needsno);
        NeedsLines.SETRANGE("Entry No.", lineno);
        IF NeedsLines.FINDSET THEN BEGIN
            NeedsLines.INIT;
            NeedsLines.Description := description;
            NeedsLines.Source := source;
            NeedsLines.Comments := comments;
            IF NeedsLines.MODIFY(TRUE) THEN BEGIN
                status := 'success*Your training needs request line has been updated successfully*';
            END ELSE BEGIN
                status := 'danger*Your training needs request line could not be updated, please try again!*';
            END;
        END;

    end;

    procedure fnDeleteTrainingNeedsLines(needsno: Code[30]; lineno: Integer) status: Text
    var
        trainingNeedsHeader: Record "Training Needs Header";
        NeedsLines: Record "Training Needs Requests";
    begin
        NeedsLines.RESET;
        NeedsLines.SETRANGE("Training Header No.", needsno);
        NeedsLines.SETRANGE("Entry No.", lineno);
        IF NeedsLines.FINDSET THEN BEGIN
            IF NeedsLines.DELETE(TRUE) THEN BEGIN
                status := 'success*The needs request was deleted successfully';
            END ELSE BEGIN
                status := 'danger*The request was not deleted, please try again!';
            END;
        END;

    end;

    procedure InsertTenderCommitees(IFSCode: Code[20]; CommiteeType: Code[30]; AppointEffDate: date; AppontAuth: Text[100]; CommDurat: Decimal; RaisedBy: text[100]) Docnum: code[20]
    var
        myInt: Integer;
        IFsTender: Record "IFS Tender Committee";
        Procumrent: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DocNo: Text[20];
    begin
        Procumrent.Get();
        IFsTender.init;
        DocNo := NoSeriesMgt.GetNextNo(Procumrent."IFS Tender Committee No.", 0D, true);
        IFsTender."Document No." := DocNo;
        IFsTender."IFS Code" := IFSCode;
        IFsTender.Validate(IFsTender."IFS Code");
        IFsTender."Committee Type" := CommiteeType;
        IFsTender."Appointment Effective Date" := AppointEffDate;
        IFsTender.Duration := CommDurat;
        IFsTender."Appointing Authority" := AppontAuth;
        IFsTender."Raised By" := RaisedBy;
        IFsTender.Validate(IFsTender."Raised By");
        IFsTender.Insert();
        Docnum := DocNo;
        exit(Docnum);
    end;

    procedure InsertTenderCommiteeMembers(DocNum: Code[20]; CommiteeType: Code[30]; Role: option; StaffNumber: code[30]): Boolean
    var
        myInt: Integer;
        IFsTenderMembers: Record "IFS Tender Committee Member";
        IFsTender: Record "IFS Tender Committee";
        DocNo: Text[20];
    begin
        IFsTender.Reset();
        IFsTender.SetRange("Document No.", DocNum);
        IFsTender.SetRange("Committee Type", CommiteeType);
        if IFsTender.FindFirst() then begin
            IFsTenderMembers.Reset();
            if IFsTenderMembers.FindLast() then begin
                IFsTenderMembers.Init();
                IFsTenderMembers."Line No" := IFsTenderMembers."Line No" + 1;
                IFsTenderMembers."Document No." := DocNum;
                IFsTenderMembers."Committee Type" := CommiteeType;
                IFsTenderMembers.Role := Role;
                IFsTenderMembers."Member No." := StaffNumber;
                IFsTenderMembers.Validate(IFsTenderMembers."Member No.");
                if IFsTenderMembers.Insert(true) then
                    exit(true)
                else
                    exit(false)
            end;
        end;
    end;


    // Procedure InsertTrainingExtension(TrainNo: Text; Reason: Text; Remarks: Text; EmployeeNo: Text; StartDate: Date; EndDate: date; FundingSource: Option) DocNo: Text
    // var
    //     TrainingExtension: Record "Training Extension";
    // begin
    //     HrSetup.Get();
    //     TrainingExtension.init;
    //     DocNo := NoSeriesMgt.GetNextNo(HrSetup."Training Application Nos.", 0D, true);
    //     TrainingExtension."No." := DocNo;
    //     TrainingExtension.Employee := EmployeeNo;
    //     TrainingExtension."Application No" := TrainNo;
    //     TrainingExtension.Validate("Application No");
    //     TrainingExtension."Extension Reason" := Reason;
    //     TrainingExtension."Additional Info" := Remarks;
    //     TrainingExtension."Start Date" := StartDate;
    //     TrainingExtension."End Date" := EndDate;
    //     TrainingExtension."Funding Source" := FundingSource;
    //     TrainingExtension.Insert(false);
    // end;

    // procedure SendTrainingExtensionApproval(Docno: Code[30]) status: Text
    // var
    //     TrainingExtension: Record "Training Extension";
    // begin
    //     TrainingExtension.RESET;
    //     TrainingExtension.SETRANGE("No.", Docno);
    //     IF TrainingExtension.FINDSET THEN BEGIN
    //         VarVariant := TrainingExtension;
    //         IF CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
    //             CustomApprovalMgt.OnSendDocForApproval(VarVariant);
    //         status := 'success*The needs request was successfully sent for approval';
    //     END ELSE BEGIN
    //         status := 'danger*A needs request with the given number does not exist, you are not the requestor or is no longer open';
    //     END;
    //     EXIT(status);
    // end;

    procedure createNewTrainingFeedback(employeeNo: Code[30]; feedbackNo: Code[30]; applicationCode: Code[30]) status: Text
    var
        TrainingApplicationFeedback: Record "Training Evaluation Header";
        EmployeeSchedule: Record "Employee Scedule";
        TrainingRequests: Record "Training Requests";
    begin
        /*TrainingRequests.RESET;
        TrainingRequests.SETRANGE(Code,applicationCode);
        IF TrainingRequests.FINDSET THEN BEGIN
          IF feedbackNo='' THEN BEGIN
              TrainingApplicationFeedback.INIT;
             // TrainingApplicationFeedback.Type:=TrainingApplicationFeedback.Type::Feedback;
            //  TrainingApplicationFeedback."Employee No.":= employeeNo;
            //  TrainingApplicationFeedback.VALIDATE("Employee No.");
              TrainingApplicationFeedback."Application Code":= applicationCode;
              TrainingApplicationFeedback.VALIDATE("Application Code");
               IF TrainingApplicationFeedback.INSERT(TRUE) THEN BEGIN
                  TrainingApplicationFeedback.VALIDATE("Application Code");
                status:= 'success*your training feedback request was successful*'+TrainingApplicationFeedback.No;
                END ELSE BEGIN
                   status:= 'danger*Your training feedback failed, kindly try again!';
                END;
          END ELSE BEGIN
            TrainingApplicationFeedback.RESET;
            TrainingApplicationFeedback.SETRANGE(No,feedbackNo);
            TrainingApplicationFeedback.SETRANGE("Employee No.",employeeNo);
            IF TrainingApplicationFeedback.FINDSET THEN BEGIN
              TrainingApplicationFeedback."Application Code":= applicationCode;
              TrainingApplicationFeedback.VALIDATE("Application Code");
               IF TrainingApplicationFeedback.MODIFY(TRUE) THEN BEGIN
                TrainingApplicationFeedback.VALIDATE("Application Code");
                status:= 'success*your training feedback request was successful*'+TrainingApplicationFeedback.No;
                END ELSE BEGIN
                   status:= 'danger*Your training feedback failed, kindly try again!';
                END;
            END;
          END;
        END ELSE BEGIN
        status:= 'danger*Your are not allowed to submit feeedback since you did not attend the training!';
        END;
        */

    end;

    procedure createTrainingFeedbackLines(feedbackNo: Code[30]; lineno: Integer; ratingcode: Code[50]; comments: Text; categorycode: Integer; categorydesc: Text; trainingcategory: Code[100]) status: Text
    var
        TrainingFeedbackLines: Record "Training Feedback Suggestions";
        TrainingApplicationFeedback: Record "Training Evaluation Header";
        CategoryRatingScale: Record "Category Rating Scale";
    begin
        /*TrainingFeedbackLines.RESET;
        TrainingFeedbackLines.SETRANGE("Training Application No",feedbackNo);
        TrainingFeedbackLines.SETRANGE("Entry No.",lineno);
        IF TrainingFeedbackLines.FINDSET THEN BEGIN
          CategoryRatingScale.RESET;
          CategoryRatingScale.SETRANGE("Rating Code",ratingcode);
          IF CategoryRatingScale.FINDSET THEN BEGIN
            TrainingFeedbackLines.Category:= categorycode;
            TrainingFeedbackLines."Training Category":=trainingcategory;
            TrainingFeedbackLines."Category Description":= categorydesc;
            TrainingFeedbackLines.Rating:= ratingcode;
            TrainingFeedbackLines."Rating Description":=CategoryRatingScale."Rating Description";
            TrainingFeedbackLines.Comments:= comments;
            IF TrainingFeedbackLines.MODIFY(TRUE) THEN BEGIN
                  status:= 'success*your training needs feedback was successful';
                END ELSE BEGIN
                    status:= 'danger*your training needs feedback was not successful';
                END;
          END;
        END;
        */

    end;

    procedure fnGenerateTrainingFeedbackReport(docNo: Code[100]) status: Text
    var
        TrainingEvaluationHeader: Record "Training Evaluation Header";
    begin
        TrainingEvaluationHeader.Reset;
        TrainingEvaluationHeader.SetRange(No, docNo);
        if TrainingEvaluationHeader.FindSet then begin
            // if FILE.Exists(FILESPATH20 + docNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH20 + docNo + '.pdf');
            //     Report.SaveAsPdf(69156, FILESPATH20 + docNo + '.pdf', TrainingEvaluationHeader);
            //     status := 'success*Generated*Downloads\TrainingFeedback\' + docNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(69156, FILESPATH20 + docNo + '.pdf', TrainingEvaluationHeader);
            //     status := 'success*Generated*Downloads\TrainingFeedback\' + docNo + '.pdf';
            // end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnEditTrainingFeedbackLines(lineno: Integer; feedbackno: Code[100]; rating: Code[100]; category: Code[100]; comments: Text) status: Text
    var
        TrainingFeedbackLines: Record "Training Feedback Suggestions";
    begin
        TrainingFeedbackLines.Reset;
        TrainingFeedbackLines.SetRange("Training Application No", feedbackno);
        TrainingFeedbackLines.SetRange("Entry No.", lineno);
        if TrainingFeedbackLines.FindSet then begin
            TrainingFeedbackLines.Init;
            TrainingFeedbackLines."Facilitator Rating" := rating;
            TrainingFeedbackLines."Training Category" := category;
            TrainingFeedbackLines.Comments := comments;
            if TrainingFeedbackLines.Modify(true) then begin
                status := 'success*your training feedback line was successful updated';
            end else begin
                status := 'danger*your training feedback lines would not be updated';
            end;
        end;
    end;

    procedure fnDeleteTrainingFeedbackLines(lineno: Integer; feedbackno: Code[100]) status: Text
    var
        TrainingFeedbackLines: Record "Training Feedback Suggestions";
    begin
        TrainingFeedbackLines.Reset;
        TrainingFeedbackLines.SetRange("Training Application No", feedbackno);
        TrainingFeedbackLines.SetRange("Entry No.", lineno);
        if TrainingFeedbackLines.FindSet then begin
            if TrainingFeedbackLines.Delete(true) then begin
                status := 'success*Training feedback line has been removed successfully*';
            end else begin
                status := 'danger*Training feedback line could not be removed, please try again*';
            end;
        end;
    end;

    procedure SubmitTrainingFeedback(feedbackNo: Code[30]) status: Text
    var
        TrainingApplicationFeedback: Record "Training Evaluation Header";
    begin
        TrainingApplicationFeedback.Reset;
        TrainingApplicationFeedback.SetRange(No, feedbackNo);
        if TrainingApplicationFeedback.FindSet then begin
            TrainingApplicationFeedback.Status := TrainingApplicationFeedback.Status::Submitted;
            if TrainingApplicationFeedback.Modify(true) then begin
                status := 'success*your training feedback was successful submitted';
            end else begin
                status := 'danger*your training feedback was not successful';
            end;
        end;
    end;

    procedure createNewTrainingEvaluation(employeeNo: Code[30]; feedbackNo: Code[30]; applicationCode: Code[30]) status: Text
    var
        TrainingApplicationFeedback: Record "Training Evaluation Header";
        EmployeeSchedule: Record "Employee Scedule";
        TrainingRequests: Record "Training Requests";
    begin
        /*TrainingRequests.RESET;
        TrainingRequests.SETRANGE(Code,applicationCode);
        IF TrainingRequests.FINDSET THEN BEGIN
          IF feedbackNo='' THEN BEGIN
              TrainingApplicationFeedback.INIT;
              TrainingApplicationFeedback.Type:=TrainingApplicationFeedback.Type::Evaluation;
              TrainingApplicationFeedback."Employee No.":= employeeNo;
              TrainingApplicationFeedback.VALIDATE("Employee No.");
              TrainingApplicationFeedback."Application Code":= applicationCode;
              TrainingApplicationFeedback.VALIDATE("Application Code");
               IF TrainingApplicationFeedback.INSERT(TRUE) THEN BEGIN
                  TrainingApplicationFeedback.VALIDATE("Application Code");
                status:= 'success*your training evaluation request was successful*'+TrainingApplicationFeedback.No;
                END ELSE BEGIN
                   status:= 'danger*Your training evaluation failed, kindly try again!';
                END;
          END ELSE BEGIN
            TrainingApplicationFeedback.RESET;
            TrainingApplicationFeedback.SETRANGE(No,feedbackNo);
            TrainingApplicationFeedback.SETRANGE("Employee No.",employeeNo);
            IF TrainingApplicationFeedback.FINDSET THEN BEGIN
              TrainingApplicationFeedback."Application Code":= applicationCode;
              TrainingApplicationFeedback.VALIDATE("Application Code");
               IF TrainingApplicationFeedback.MODIFY(TRUE) THEN BEGIN
                TrainingApplicationFeedback.VALIDATE("Application Code");
                status:= 'success*your training evaluation request was successful*'+TrainingApplicationFeedback.No;
                END ELSE BEGIN
                   status:= 'danger*Your training evaluation failed, kindly try again!';
                END;
            END;
          END;
        END ELSE BEGIN
        status:= 'danger*Your are not allowed to submit training evaluation since you did not attend the training!';
        END;
        */

    end;

    procedure SubmitTrainingEvaluation(feedbackNo: Code[30]) status: Text
    var
        TrainingApplicationFeedback: Record "Training Evaluation Header";
    begin
        TrainingApplicationFeedback.Reset;
        TrainingApplicationFeedback.SetRange(No, feedbackNo);
        if TrainingApplicationFeedback.FindSet then begin
            TrainingApplicationFeedback.Status := TrainingApplicationFeedback.Status::Submitted;
            if TrainingApplicationFeedback.Modify(true) then begin
                status := 'success*your training evaluation was successful submitted';
            end else begin
                status := 'danger*your training evaluation was not successful';
            end;
        end;
    end;

    procedure fnGenerateTrainingEvaluationReport(docNo: Code[100]) status: Text
    var
        TrainingEvaluationHeader: Record "Training Evaluation Header";
    begin
        TrainingEvaluationHeader.Reset;
        TrainingEvaluationHeader.SetRange(No, docNo);
        if TrainingEvaluationHeader.FindSet then begin
            // if FILE.Exists(FILESPATH21 + docNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH21 + docNo + '.pdf');
            //     Report.SaveAsPdf(69153, FILESPATH21 + docNo + '.pdf', TrainingEvaluationHeader);
            //     status := 'success*Generated*Downloads\TrainingEvaluation\' + docNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(69153, FILESPATH21 + docNo + '.pdf', TrainingEvaluationHeader);
            //     status := 'success*Generated*Downloads\TrainingEvaluation\' + docNo + '.pdf';
            // end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnInsertEvaluationLines(docNo: Code[100]; lineNo: Integer; rating: Code[100]; comment: Text) status: Text
    var
        CategoryRatingScale: Record "Category Rating Scale";
    begin
        /*TrainingEvaluations.RESET;
        TrainingEvaluations.SETRANGE("Training Evaluation No",docNo);
        TrainingEvaluations.SETRANGE("Entry No.",lineNo);
        IF TrainingEvaluations.FINDSET THEN BEGIN
          CategoryRatingScale.RESET;
          CategoryRatingScale.SETRANGE("Rating Code",rating);
          IF CategoryRatingScale.FINDSET THEN BEGIN
            TrainingEvaluations."Rating Code":=rating;
            TrainingEvaluations."Rating Description":=CategoryRatingScale."Rating Description";
            TrainingEvaluations.Comments:=comment;
            IF TrainingEvaluations.MODIFY(TRUE) THEN BEGIN
              status:='success*comments added successfully';
            END ELSE BEGIN
              status:='danger*comments were not added successfully';
            END;
          END;
        END;
        */

    end;

    procedure leaveApplication(leaveNo: Code[50]; employeeNumber: Code[20]; leaveType: Code[20]; annualLeaveType: Option " ","Annual Leave","Emergency Leave"; daysApplied: Integer; lStartDate: DateTime; phoneNumber: Code[20]; emailAddress: Text; examdetails: Text; dateOfExam: DateTime; previousAttempts: Integer; reliever: Text[50]) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
    begin
        status := 'danger*Your leave application failed';
        annualLeaveType := annualLeaveType;
        case annualLeaveType of
            0:
                annualLeaveType := Annual::"Annual Leave";
            1:
                annualLeaveType := Annual::"Emergency Leave";

            else
        end;
        Employee.Reset;
        Employee.SetRange("No.", employeeNumber);
        if Employee.FindSet then begin
            if leaveNo = '' then begin //a new leave
                leaveApplications.Init;
                leaveApplications."Employee No" := employeeNumber;
                leaveApplications.Validate("Employee No");
                leaveApplications."Leave Type" := leaveType;
                leaveApplications.Validate("Leave Type");
                leaveApplications."Annual Leave Type" := annualLeaveType;
                leaveApplications."Days Applied" := daysApplied;
                leaveApplications."Start Date" := Dt2Date(lStartDate);
                leaveApplications."Cell Phone Number" := phoneNumber;
                leaveApplications."E-mail Address" := emailAddress;
                leaveApplications."Details of Examination" := examdetails;
                leaveApplications."Date of Exam" := Dt2Date(dateOfExam);
                leaveApplications."Number of Previous Attempts" := Format(previousAttempts);
                leaveApplications.Validate("Days Applied");
                leaveApplications.Validate("Date of Exam");
                leaveApplications.Reliever := reliever;
                leaveApplications.Validate(Reliever);
                if leaveApplications.Insert(false) then begin
                    leaveApplications."Employee No" := employeeNumber;
                    leaveApplications.Validate("Employee No");
                    leaveApplications.Validate("Start Date");
                    leaveApplications.Modify(false);
                    status := 'success*Your leave application was successfully placed *' + leaveApplications."Application Code";
                end;
            end else begin //existing leave application
                leaveApplications.Reset;
                leaveApplications.SetRange("Employee No", employeeNumber);
                leaveApplications.SetRange("Application Code", leaveNo);
                leaveApplications.SetRange(Status, leaveApplications.Status::Open);
                if leaveApplications.FindSet then begin
                    leaveApplications."Employee No" := employeeNumber;
                    leaveApplications.Validate("Employee No");
                    leaveApplications."Leave Type" := leaveType;
                    leaveApplications.Validate("Leave Type");
                    leaveApplications."Annual Leave Type" := annualLeaveType;
                    leaveApplications."Days Applied" := daysApplied;
                    leaveApplications."Start Date" := Dt2Date(lStartDate);
                    leaveApplications."Cell Phone Number" := phoneNumber;
                    leaveApplications."E-mail Address" := emailAddress;
                    leaveApplications."Details of Examination" := examdetails;
                    leaveApplications."Date of Exam" := Dt2Date(dateOfExam);
                    leaveApplications."Number of Previous Attempts" := Format(previousAttempts);
                    leaveApplications.Validate("Days Applied");
                    leaveApplications.Validate("Date of Exam");
                    leaveApplications.Reliever := reliever;
                    leaveApplications.Validate(Reliever);
                    if leaveApplications.Modify(true) then begin
                        leaveApplications."Employee No" := employeeNumber;
                        leaveApplications.Validate("Employee No");
                        leaveApplications.Validate("Start Date");
                        leaveApplications.Modify(true);
                        status := 'success*Your leave application was successfully updated *' + leaveApplications."Application Code";
                    end;
                end else begin
                    status := 'danger*A leave application with the given code does not exist, you are not the owner or is no longer open';
                end;
            end;
        end else begin
            status := 'danger*The selected employee does not exist';
        end;
    end;

    procedure generatePayslip(employeeNumber: Code[20]; payPeriod: DateTime) status: Text
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        status := 'danger*could not generate your statement';
        Employee.Reset;
        Employee.SetRange(Employee."No.", employeeNumber);
        if Employee.FindSet then begin
            Employee."Pay Period Filter" := Dt2Date(payPeriod);
            Employee.Modify();
            if HrSetup.Get() then begin
                HrSetup."Payroll Period" := Dt2Date(payPeriod);
                HrSetup.Modify();
            end;
            Employee.Reset;
            Employee.SetRange(Employee."No.", employeeNumber);
            Employee.SetRange("Pay Period Filter", Dt2Date(payPeriod));
            if Employee.FindSet then begin
                RecRef.GetTable(Employee);

                if ImageEx = true then begin
                    Report.SaveAs(Report::"PR Individual Payslip", '', ReportFormat::Pdf, BlobOutStream, RecRef);
                    // Report.SaveAsPdf(Report::"PR Individual Payslip", FILESPATH + employeeNumber + '.pdf', Employee);
                    status := 'success*Generated*finance\payslip\' + employeeNumber + '.pdf';
                end
                else begin
                    Report.SaveAs(Report::"PR Individual Payslip", '', ReportFormat::Pdf, BlobOutStream, RecRef);

                    // Report.SaveAsPdf(Report::"PR Individual Payslip", FILESPATH + employeeNumber + '.pdf', Employee);
                    status := 'success*Generated*finance\payslip\' + employeeNumber + '.pdf';
                end

            end;
        end
        else begin
            status := 'danger*Employee not found';
        end;
    end;

    procedure GeneratePaySlipReport(EmployeeNo: Text; Period: Date; filenameFromApp: Text) PDFFile: Text
    var
        "prSalary Card": Record "pr Salary Card";
        prSalaryCard: Record "pr Salary Card";
        GeneralSetup: Record "Human Resources Setup";
        PRPeriodTrans: Record "PR Period Transactions";
        filename: Text[250];
        ToFile: Text;
        imageinstream: InStream;
        Image6txt2: BigText;
        TempBlob: Codeunit "Temp Blob";
        FilenameDT: File;
        imagetext7: Text;
        FileContentsB64: text;
        BlobOutStream: OutStream;
        BlobInStream: InStream;
    //Bytes: dotnet Array;
    //Convert: dotnet Convert;
    //MemoryStream: dotnet MemoryStream;
    begin
        GeneralSetup.get;
        FILESPATH := GeneralSetup."Portal Reports File Path";
        filename := FILESPATH + filenameFromApp;
        // if Exists(filename) then
        //     Erase(filename);
        //Display payslip report
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);

        HREmp.SetRange("No.", EmployeeNo);
        // HREmp.SETFILTER(HREmp."Pr Period Filter", '%1', Period);
        if HREmp.Find('-') then begin
            RecRef.GetTable(HREmp);
            HREmp."Pay Period Filter" := Period;
            HREmp.Modify();
            if HrSetup.Get() then begin
                HrSetup."Payroll Period" := Period;
                HrSetup.Modify();
            end;
            // Report.SaveAsPdf(Report::"PR Individual Payslip", filename, HREmp);
            Report.SaveAs(Report::"PR Individual Payslip", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);


        end;
        // IF FilenameDT.OPEN(filename) THEN BEGIN
        //     FilenameDT.CREATEINSTREAM(imageinstream);
        //     MemoryStream := MemoryStream.MemoryStream();
        //     COPYSTREAM(MemoryStream, imageinstream);
        //     Bytes := MemoryStream.GetBuffer();
        //     Image6txt2.ADDTEXT(Convert.ToBase64String(Bytes));
        //     FilenameDT.CLOSE;
        //     Image6txt2.GETSUBTEXT(imagetext7, 1);
        //     PDFFile := imagetext7;
        // END;
        EXIT(PDFFile);
    end;

    procedure GeneratePaySlipReport2(EmployeeNo: Text; PMonth: Integer; PYear: Integer) BaseImage: Text
    var
        prSalaryCard: Record "pr Salary Card";
        PRPeriodTrans: Record "PR Period Transactions";
        PRPayrollPeriods: Record "PR Payroll Periods";
    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        PRPayrollPeriods.Reset();
        PRPayrollPeriods.SetRange("Period Month", PMonth);
        PRPayrollPeriods.SetRange("Period Year", PYear);
        PRPayrollPeriods.SetRange(Closed, true);
        PRPayrollPeriods.SetRange("Allow View Payslip?", true);
        if PRPayrollPeriods.FindSet() then begin
            HREmp.Reset;
            HREmp.SetRange("No.", EmployeeNo);
            HREmp.SetFilter(HREmp."Period Filter", '%1', PRPayrollPeriods."Date Opened");
            if HREmp.Find('-') then begin
                HREmp."Pay Period Filter" := PRPayrollPeriods."Date Opened";
                HREmp.Modify();
                if HrSetup.Get() then begin
                    HrSetup."Payroll Period" := PRPayrollPeriods."Date Opened";
                    HrSetup.Modify();
                end;
                RecRef.GetTable(HREmp);
                TempBlob_lRec.CreateOutStream(OutStr);
                Report.SaveAs(Report::"PR Individual Payslip", '', ReportFormat::Pdf, OutStr, RecRef);
                FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('PAYSLIP_%1.Pdf', HREmp."No."), TRUE);
                TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
                BaseImage := Base64Convert.ToBase64(InStr);
            end;
        end;
    end;


    procedure generateP9(employeeNumber: Code[20]; startDate: Date; endDate: Date) status: Text
    var
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        ImagEx: Boolean;

    begin
        ImagEx := true;
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        Employee.Reset;
        Employee.SetRange(Employee."No.", employeeNumber);
        Employee.SetFilter(Employee."Date Filter", Format(Format(startDate) + '..' + Format(endDate)));
        Employee.SetFilter("Pay Period Filter", Format(Format(startDate) + '..' + Format(endDate)));
        if Employee.FindSet then begin
            RecRef.GetTable(Employee);
            if ImagEx = true then begin
                //     FILE.delete(FILESPATH + employeeNumber + '.pdf');
                //     Report.SaveAsPdf(69019, FILESPATH + employeeNumber + '.pdf', Employee);
                Report.SaveAs(69019, FILESPATH + employeeNumber + '.pdf', ReportFormat::Pdf, BlobOutStream, RecRef);
                status := 'success*Generated*finance\p9\' + employeeNumber + '.pdf';
            end else begin
                // Report.SaveAs(69019, FILESPATH + employeeNumber + '.pdf', Employee);
                Report.SaveAs(69019, FILESPATH + employeeNumber + '.pdf', ReportFormat::Pdf, BlobOutStream, RecRef);
                status := 'success*Generated*finance\p9\' + employeeNumber + '.pdf';
            end
        end else begin
            status := 'danger*The P9 Report could not be generated';
        end;
    end;



    procedure generateStoreReqReport(docNo: Code[100]) status: Text
    var
        ImagEx: Boolean;
        BlobOutStream: OutStream;
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        PurchaseHeader.RESET;
        PurchaseHeader.SETRANGE("Document Type", PurchaseHeader."Document Type"::"Store Requisition");
        PurchaseHeader.SETRANGE("No.", docNo);
        IF PurchaseHeader.FINDSET THEN BEGIN
            RecRef.GetTable(PurchaseHeader);
            IF ImagEx = true THEN BEGIN
                // FILE.ERASE(FILESPATH + docNo + '.pdf');
                // REPORT.SAVEASPDF(70009, FILESPATH + docNo + '.pdf', PurchaseHeader);
                Report.SaveAs(70009, FILESPATH + docNo + '.pdf', ReportFormat::Pdf, BlobOutStream, RecRef);

                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END ELSE BEGIN
                Report.SaveAs(70009, FILESPATH + docNo + '.pdf', ReportFormat::Pdf, BlobOutStream, RecRef);
                // REPORT.SAVEASPDF(70009, FILESPATH + docNo + '.pdf', PurchaseHeader);
                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END
        END ELSE BEGIN
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure generatePurchaseReq(docNo: Code[100]) status: Text
    var
        ImagEx: Boolean;
        BlobOutStream: OutStream;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        RecRef: RecordRef;
    begin
        PurchaseHeader.RESET;
        PurchaseHeader.SETRANGE("Document Type", PurchaseHeader."Document Type"::"Purchase Requisition");
        PurchaseHeader.SETRANGE("No.", docNo);
        IF PurchaseHeader.FINDSET THEN BEGIN
            RecRef.gettable(PurchaseHeader);
            if ImagEx = true then begin
                // IF FILE.EXISTS(FILESPATH + docNo + '.pdf') THEN BEGIN
                //     FILE.ERASE(FILESPATH + docNo + '.pdf');
                Report.SaveAs(50097, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // REPORT.SAVEASPDF(50097, FILESPATH + docNo + '.pdf', PurchaseHeader);
                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END ELSE BEGIN
                Report.SaveAs(50097, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // REPORT.SAVEASPDF(50097, FILESPATH + docNo + '.pdf', PurchaseHeader);
                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END
        END ELSE BEGIN
            status := 'danger*The Report could not be generated';
        end;
    end;





    procedure CreateWorksPurchaseRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; location: Code[50]; description: Text; priorityLevel: Option ,Low,Normal,High,Critical; requisitionProductGroup: Option Goods,Services,Works,Assets; constituency: Text[100]; planId: Text[100]; PlanEntryNo: Integer; TemplateId: Text[50]; projectStaffingTemplateId: Text[100]; worksTemplateId: Text[100]) status: Text
    var
        myType: Text;
    begin

        case priorityLevel of
            0:
                priorityLevel := PurchaseHeader."priority level"::Low;
            1:
                priorityLevel := PurchaseHeader."priority level"::Normal;
            2:
                priorityLevel := PurchaseHeader."priority level"::High;
            3:
                priorityLevel := PurchaseHeader."priority level"::Critical;
            else
        end;

        case requisitionProductGroup of
            0:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Goods;
            1:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Services;
            2:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Works;
            3:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Assets;
            else
        end;


        myType := 'Purchase Requisition';
        if requisitionNo = '' then begin //new  requisition
            PurchaseHeader.Init;

            PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
            PurchaseHeader.Validate("Document Type");
            PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::"Project Works";

            PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::Project;
            PurchaseHeader.Validate("Requisition Type");

            PurchaseHeader."Requester ID" := UserId;
            PurchaseHeader."Request-By No." := employeeNo;
            PurchaseHeader.Validate("Request-By No.");
            PurchaseHeader."Location Code" := location;
            PurchaseHeader.Validate("Location Code");
            PurchaseHeader.Description := description;
            PurchaseHeader.Validate(Description);
            PurchaseHeader.Validate("Order Date", Today);
            PurchaseHeader."Responsibility Center" := location;

            PurchaseHeader."Priority Level" := priorityLevel;
            PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
            //PurchaseHeader."PRN Type":=PurchaseHeader."PRN Type"::Standard;
            PurchaseHeader."Procurement Plan ID" := planId;
            //PurchaseHeader."Shortcut Dimension 2 Code":=
            PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;
            //PurchaseHeader.VALIDATE("Procurement Plan Entry No");
            PurchaseHeader."Requisition Template ID" := TemplateId;


            PurchaseHeader."Project Staffing Template ID" := projectStaffingTemplateId;
            PurchaseHeader."Works Equipment Template ID" := worksTemplateId;


            if PurchaseHeader.Insert(true) then begin

                //PurchaseHeader.VALIDATE("Request-By No.");
                // PurchaseHeader.VALIDATE("Location Code",location);
                PurchaseHeader.Validate("Procurement Plan Entry No");
                SuggestPRNPersonnel_equipmentSpecification(PurchaseHeader);
                PurchaseHeader.Modify(true);
                status := 'success*Your ' + myType + ' was successfully created*' + PurchaseHeader."No.";
            end else begin
                status := 'danger*Your ' + myType + ' could not be captured';
            end;

        end else begin //existing
            PurchaseHeader.Reset;

            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            PurchaseHeader.SetRange("No.", requisitionNo);
            if PurchaseHeader.FindSet then begin
                PurchaseHeader."Responsibility Center" := location;
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate(Description, description);
                PurchaseHeader.Validate("Location Code", location);

                PurchaseHeader."Priority Level" := priorityLevel;
                PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
                PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::"Project Works";
                PurchaseHeader."Procurement Plan ID" := planId;
                PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;

                PurchaseHeader."Requisition Template ID" := TemplateId;
                PurchaseHeader."Project Staffing Template ID" := projectStaffingTemplateId;
                PurchaseHeader."Works Equipment Template ID" := worksTemplateId;

                if PurchaseHeader.Modify(true) then begin
                    PurchaseHeader.Validate("Procurement Plan Entry No");
                    SuggestPRNPersonnel_equipmentSpecification(PurchaseHeader);
                    status := 'success*Your ' + myType + ' was successfully updated';
                end else begin
                    status := 'danger*Your ' + myType + ' could not be updated';
                end;

            end else begin
                status := 'danger*A ' + myType + ' with the given number does not exist, you are not the owner or is no longer open' + requisitionNo;
            end;

        end;
        exit(status);
    end;

    procedure createPurchaseRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; location: Code[50]; description: Text; priorityLevel: Option ,Low,Normal,High,Critical; requisitionProductGroup: Option Goods,Services,Works,Assets; constituency: Text[100]; planId: Text[100]; PlanEntryNo: Integer; TemplateId: Text[50]; tfundingsource: Code[100]; tconstituency: Code[100]) status: Text
    var
        myType: Text;
    begin

        case priorityLevel of
            0:
                priorityLevel := PurchaseHeader."priority level"::Low;
            1:
                priorityLevel := PurchaseHeader."priority level"::Normal;
            2:
                priorityLevel := PurchaseHeader."priority level"::High;
            3:
                priorityLevel := PurchaseHeader."priority level"::Critical;
            else
        end;

        case requisitionProductGroup of
            0:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Goods;
            1:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Services;
            2:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Works;
            3:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Assets;
            else
        end;


        myType := 'Purchase Requisition';
        if requisitionNo = '' then begin //new  requisition
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
            PurchaseHeader.Validate("Document Type");
            PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::Project;
            PurchaseHeader.Validate("Requisition Type");
            PurchaseHeader."Requester ID" := UserId;
            PurchaseHeader."Request-By No." := employeeNo;
            PurchaseHeader.Validate("Request-By No.");
            PurchaseHeader."Location Code" := location;
            //PurchaseHeader.VALIDATE("Location Code");
            PurchaseHeader.Description := description;
            PurchaseHeader.Validate(Description);
            PurchaseHeader."Order Date" := Today;
            PurchaseHeader."Responsibility Center" := location;
            PurchaseHeader."Priority Level" := priorityLevel;
            PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
            PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::Standard;
            PurchaseHeader."Procurement Plan ID" := planId;
            PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;
            PurchaseHeader."Requisition Template ID" := TemplateId;
            PurchaseHeader."Shortcut Dimension 2 Code" := tfundingsource;
            PurchaseHeader."Shortcut Dimension 3 Code" := tconstituency;
            if PurchaseHeader.Insert(true) then begin
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader.Validate("Procurement Plan Entry No");
                PurchaseHeader.Modify(true);
                status := 'success*Your ' + myType + ' was successfully created*' + PurchaseHeader."No.";
            end else begin
                status := 'danger*Your ' + myType + ' could not be captured';
            end;

        end else begin //existing
            PurchaseHeader.Reset;
            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            PurchaseHeader.SetRange("No.", requisitionNo);
            if PurchaseHeader.FindSet then begin
                PurchaseHeader."Responsibility Center" := location;
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate(Description, description);
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader."Priority Level" := priorityLevel;
                PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
                PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::Standard;
                PurchaseHeader."Procurement Plan ID" := planId;
                PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;
                PurchaseHeader."Requisition Template ID" := TemplateId;
                if PurchaseHeader.Modify(true) then begin
                    PurchaseHeader.Validate("Procurement Plan Entry No");
                    status := 'success*Your ' + myType + ' was successfully updated';
                end else begin
                    status := 'danger*Your ' + myType + ' could not be updated';
                end;

            end else begin
                status := 'danger*A ' + myType + ' with the given number does not exist, you are not the owner or is no longer open' + requisitionNo;
            end;

        end;
        exit(Status);
    end;

    procedure createPurchaseStoreRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; location: Code[50]; description: Text; type: Integer; fundCode: Code[100]; jobNo: Text; jobTask: Text) status: Text
    var
        myType: Text;
    begin
        myType := 'Store Requisition';
        if type = 0 then
            myType := 'Purchase Requisition';
        status := 'danger*Your ' + myType + ' could not be captured';
        if requisitionNo = '' then begin //new  requisition
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Store Requisition";
            if type = 0 then
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
            PurchaseHeader.Validate("Document Type");
            if type = 0 then begin
                PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::Project;
                PurchaseHeader.Validate("Requisition Type");
            end else
                PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::"Internal Use";
            PurchaseHeader."Requester ID" := UserId;
            PurchaseHeader."Request-By No." := employeeNo;
            PurchaseHeader.Validate("Request-By No.");
            PurchaseHeader."Location Code" := location;
            PurchaseHeader.Validate("Location Code");
            PurchaseHeader.Description := description;
            PurchaseHeader.Validate(Description);
            PurchaseHeader.Validate("Order Date", Today);
            PurchaseHeader."Responsibility Center" := location;
            PurchaseHeader."Shortcut Dimension 3 Code" := fundCode;
            if PurchaseHeader.Insert(true) then begin
                PurchaseHeader.Validate("Request-By No.");
                //PurchaseHeader.VALIDATE("Location Code",location);
                // PurchaseHeader.VALIDATE("Shortcut Dimension 2 Code", fundCode);
                PurchaseHeader.Validate(Job, jobNo);
                // PurchaseHeader.VALIDATE("Job Task No.", jobTask);
                PurchaseHeader.Modify(true);
                status := 'success*Your ' + myType + ' was successfully created*' + PurchaseHeader."No.";
            end else begin
                status := 'danger*Your ' + myType + ' could not be captured';
            end;

        end else begin //existing
            PurchaseHeader.Reset;
            if type = 0 then begin
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            end else begin
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            end;
            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            PurchaseHeader.SetRange("No.", requisitionNo);
            if PurchaseHeader.FindSet then begin
                PurchaseHeader."Responsibility Center" := location;
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate(Description, description);
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader.Validate(Job, jobNo);
                // PurchaseHeader.VALIDATE("Job Task No.", jobTask);
                PurchaseHeader.Validate("Shortcut Dimension 3 Code", fundCode);
                if PurchaseHeader.Modify(true) then begin
                    status := 'success*Your ' + myType + ' was successfully updated';
                end else begin
                    status := 'danger*Your ' + myType + ' could not be updated';
                end;

            end else begin
                status := 'danger*A ' + myType + ' with the given number does not exist, you are not the owner or is no longer open' + requisitionNo;
            end;

        end;
        exit(status);
    end;

    procedure createRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; budget: Code[250]; procurementPlan: Code[250]; itemCategory: Code[250]; item: Code[250]; quantity: Decimal; directUnitCost: Decimal; uom: Text[100]; totalAmount: Decimal; procurementEntryNo: Integer) status: Text
    var
        PurchaseLine: Record "Purchase Line";
        tbl_item: Record Item;
    begin
        status := 'danger*Your Requisition Line could not be added';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            if (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition") then begin
                //add line
                PurchaseLine.Init;
                //Document Type,Document No.,Line No.
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Store Requisition";
                end;
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Purchase Requisition";
                end;
                PurchaseLine."Document No." := requisitionNo;
                PurchaseLine.Validate("Document No.");
                PurchaseLine."Line No." := getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
                PurchaseLine.Validate("Line No.");
                PurchaseLine."Procurement Plan" := budget;
                PurchaseLine.Validate("Procurement Plan");
                PurchaseLine."Procurement Plan Item" := procurementPlan;
                PurchaseLine.Validate("Procurement Plan Item");
                PurchaseLine."Item Category" := itemCategory;
                PurchaseLine.Validate("Item Category");
                PurchaseLine."Service/Item Code" := item;
                PurchaseLine.Validate("Service/Item Code");
                PurchaseLine."Qty. Requested" := quantity;
                PurchaseLine.Quantity := quantity;
                PurchaseLine.Validate("Qty. Requested");
                PurchaseLine."Direct Unit Cost" := directUnitCost;
                PurchaseLine."Unit of Measure" := uom;
                PurchaseLine.Type := PurchaseLine.Type::Item;
                PurchaseLine."No." := item;
                PurchaseLine.Amount := totalAmount;
                PurchaseLine.Validate(Amount);
                PurchaseLine."Amount Including VAT" := totalAmount;
                PurchaseLine.Validate("Amount Including VAT");
                PurchaseLine."Procurement Plan Entry No" := procurementEntryNo;
                // find item and populate PurchaseLine description
                tbl_item.reset;
                tbl_item.setrange(tbl_item."No.", item);
                if tbl_item.findfirst then begin
                    PurchaseLine.Description := tbl_item.Description;
                end;

                if PurchaseLine.Insert(true) then begin

                    status := 'success*The Requisition Line was successfully added';
                end else begin
                    status := 'danger*Your Requisition Line could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    local procedure getPurchaseLineNo(requisitionNo: Code[50]; requisitionType: Option): Integer
    var
        purchaseLine: Record "Purchase Line";
        lineNo: Integer;
    begin
        lineNo := 0;
        purchaseLine.Reset;
        purchaseLine.SetRange("Document No.", requisitionNo);
        purchaseLine.SetRange("Document Type", requisitionType);
        if purchaseLine.FindSet then begin
            repeat
                if purchaseLine."Line No." > lineNo then begin
                    lineNo := purchaseLine."Line No.";
                end;
            until purchaseLine.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure sendLPOApproval(DocNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project Team on The Memo';
        PurchaseHeader1: Record "Purchase Header";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
    begin
        status := 'danger*The Purchase Order could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", DocNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::Order);
        if PurchaseHeader.FindFirst() then begin
            if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then
                ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);
            status := 'success*Your Purchase Order was successfully  sent for approval';

        end else begin
            status := 'danger*A Purchase Order with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure fnCancelLPOApproval(docNo: Code[50]) status: Text
    var
        CustomApprovalEntry: Record "Approval Entry";
        tbl_purchaseHeader: Record "Purchase Header";
    begin
        tbl_purchaseHeader.Reset;
        tbl_purchaseHeader.SetRange(Status, tbl_purchaseHeader.Status::"Pending Approval");
        tbl_purchaseHeader.SetRange("No.", docNo);
        tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."document type"::Order);
        if tbl_purchaseHeader.FindSet then begin
            CustomApprovalEntry.Reset;
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", tbl_purchaseHeader."No.");
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", tbl_purchaseHeader.RecordId);
            if CustomApprovalEntry.FindSet then
                repeat
                    CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                    CustomApprovalEntry.Modify(true);
                until CustomApprovalEntry.Next = 0;
            tbl_purchaseHeader.Status := tbl_purchaseHeader.Status::Open;
            if tbl_purchaseHeader.Modify(true) then
                status := 'success*Your approval request was successfully cancelled';

        end else begin
            status := 'danger*A Purchase Order with the given number does not exist, you are not the requestor or is no longer pending approval';
        end;
        exit(status);

    end;

    procedure sendPurchaseRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project Team on The Memo';
        PurchaseHeader1: Record "Purchase Header";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
    begin
        status := 'danger*The Purchase Requisition could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
        if PurchaseHeader.FindSet then begin

            if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then
                ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);
            status := 'success*Your Purchase Requisition was successfully  sent for approval';

        end else begin
            status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure fnCancelPurchaseRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        CustomApprovalEntry: Record "Approval Entry";
        tbl_purchaseHeader: Record "Purchase Header";

    begin
        tbl_purchaseHeader.Reset;
        tbl_purchaseHeader.SetRange("Request-By No.", employeeNo);
        tbl_purchaseHeader.SetRange(Status, tbl_purchaseHeader.Status::"Pending Approval");
        tbl_purchaseHeader.SetRange("No.", requisitionNo);
        tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."document type"::"Purchase Requisition");
        if tbl_purchaseHeader.FindSet then begin
            CustomApprovalEntry.Reset;
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", tbl_purchaseHeader."No.");
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", tbl_purchaseHeader.RecordId);
            if CustomApprovalEntry.FindSet then
                repeat
                    CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                    CustomApprovalEntry.Modify(true);
                until CustomApprovalEntry.Next = 0;
            tbl_purchaseHeader.Status := tbl_purchaseHeader.Status::Open;
            if tbl_purchaseHeader.Modify(true) then
                status := 'success*Your approval request was successfully cancelled';

        end else begin
            status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or is no longer pending approval';
        end;
        exit(status);

    end;

    procedure createFleetRequisition(employeeNo: Code[50]; requisitionNo: Code[50];
    from: Text; destination: Text; dateOfTrip: Date; timeOut: DateTime;
    journeyRoute: Text; noOfDaysRequested: Decimal; purposeOfTrip: Text; comments: Text; imprest: Text[30]; hourstrip: Decimal;
     requisitiontype: Integer; description: Text[100]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin
        status := 'danger*Your Fleet Requisition could not be updated';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        TransportRequisition.SetRange("Employee No", employeeNo);
        if TransportRequisition.FindSet then begin
            TransportRequisition.Commencement := from;
            TransportRequisition.Validate(Commencement);
            TransportRequisition.Destination := destination;
            TransportRequisition."Date of Trip" := dateOfTrip;
            TransportRequisition."Time out" := Dt2Time(timeOut);
            TransportRequisition."Journey Route" := journeyRoute;
            TransportRequisition."Route Description" := description;
            TransportRequisition."No of Days Requested" := noOfDaysRequested;
            TransportRequisition."Purpose of Trip" := purposeOfTrip;
            TransportRequisition.Subject := purposeOfTrip;
            TransportRequisition.Comments := comments;
            TransportRequisition."Number of Hours Requested" := hourstrip;
            TransportRequisition.Validate("Number of Hours Requested");
            TransportRequisition."Requested By" := employeeNo;
            TransportRequisition.Validate("Employee No");
            TransportRequisition."Approved Imprest Memo" := imprest;
            if TransportRequisition.Modify(true) then begin
                status := 'success*Your Fleet Requisition was successfully updated*' + TransportRequisition."Transport Requisition No";
                if requisitiontype = 1 then
                    TransportRequisition.Validate("Approved Imprest Memo");
            end else begin
                status := 'danger*Your Fleet Requisition could not be updated';
            end;
        end else begin
            if requisitionNo = '' then begin //a new record
                FltMgtSetup.Get;
                FltMgtSetup.TestField(FltMgtSetup."Transport Req No");
                requisitionNo := NoSeriesMgt.GetNextNo(FltMgtSetup."Transport Req No", 0D, true);

                TransportRequisition.Init;
                TransportRequisition.Commencement := from;
                TransportRequisition."Transport Requisition No" := requisitionNo;
                TransportRequisition."Date of Request" := Today;
                TransportRequisition.Validate(Commencement);
                TransportRequisition.Destination := destination;
                TransportRequisition."Date of Trip" := dateOfTrip;
                TransportRequisition.Validate("Date of Trip");
                TransportRequisition."Time out" := Dt2Time(timeOut);
                // TransportRequisition.VALIDATE("Time out");
                TransportRequisition."Journey Route" := journeyRoute;
                TransportRequisition."No of Days Requested" := noOfDaysRequested;
                TransportRequisition."Purpose of Trip" := purposeOfTrip;
                TransportRequisition.Subject := purposeOfTrip;
                TransportRequisition.Comments := comments;
                TransportRequisition."Employee No" := employeeNo;
                TransportRequisition.Validate("Employee No");
                TransportRequisition."Date of Request" := Today;
                if HREmp.Get(employeeNo) then
                    TransportRequisition."Requested By" := HREmp."User ID";
                TransportRequisition."Approved Imprest Memo" := imprest;
                TransportRequisition."Number of Hours Requested" := hourstrip;
                //TransportRequisition.VALIDATE("Number of Hours Requested");
                if TransportRequisition.Insert(false) then begin
                    status := requisitionNo;
                    if requisitiontype = 1 then
                        TransportRequisition.Validate("Approved Imprest Memo");
                end else begin
                    status := '';
                end;
            end;
        end;
        exit(status);
    end;

    procedure addFleetRequisitionStaff(employeeNo: Code[50]; requisitionNo: Code[50]; staffNo: Code[50]; DateofTrip: Date; Days: Integer) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
    begin
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            if TransportRequisition."Approved Imprest Memo" = '' then begin
                TravelRequisitionStaff.Init;
                TravelRequisitionStaff."Req No" := requisitionNo;
                TravelRequisitionStaff.Validate("Req No");
                TravelRequisitionStaff."Employee No" := staffNo;
                TravelRequisitionStaff.Validate("Employee No");
                TravelRequisitionStaff."Date of Trip" := DateofTrip;
                TravelRequisitionStaff."No of Days Requested" := Days;
                if TravelRequisitionStaff.Insert(true) then begin
                    status := 'success*The Staff member was successfully added to your Fleet Requisition';
                end else begin
                    status := 'danger*The Staff member could not be added to your Fleet Requisition';
                end;
            end else begin
                status := 'danger*The Staff member scould not be added to your Fleet Requisition. Only the Members on the Imprest Memo are Allowed';
            end;
        end else begin
            status := 'danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure addFleetRequisitionNonStaff(employeeNo: Code[50]; requisitionNo: Code[50]; IdNumber: Code[10]; PhoneNumber: Code[100]; OrganizationName: Code[100]; Name: Code[100]; purposeoftrip: Text; designations: Text) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
        TravelRequisitionNonStaff: Record "Travel Requisition Non Staff";
    begin
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionNonStaff.Init;
            TravelRequisitionNonStaff."Req No" := requisitionNo;
            TravelRequisitionNonStaff."ID No" := IdNumber;
            //TravelRequisitionNonStaff.Purpose := OrganizationName;
            TravelRequisitionNonStaff.Name := Name;
            TravelRequisitionNonStaff."Phone Number" := PhoneNumber;
            //TravelRequisitionNonStaff.Designation := designations;
            // TravelRequisitionNonStaff.Purpose := purposeoftrip;
            if TravelRequisitionNonStaff.Insert(true) then begin
                status := 'success*The Staff member was successfully added to your Fleet Requisition';
            end else begin
                status := 'danger*The Staff member could not be added to your Fleet Requisition';
            end;

        end else begin
            status := 'danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure removeNonStaffFromTravelRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; entryNo: Integer) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionNonStaff: Record "Travel Requisition Non Staff";
    begin
        //status:='danger*The Staff member could not be removed from your Fleet Requisition';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionNonStaff.Reset;
            TravelRequisitionNonStaff.SetRange(EntryNo, entryNo);
            TravelRequisitionNonStaff.SetRange("Req No", requisitionNo);
            if TravelRequisitionNonStaff.FindSet then begin
                if TravelRequisitionNonStaff.Delete(true) then begin
                    status := 'success*The non-staff member was successfully removed from your Fleet Requisition';
                end;

            end;


        end else begin
            // status:='danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;


    procedure sendFleetRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin
        status := 'danger*The fleet requisition could not be sent for approval';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin

            leaveApp := TransportRequisition;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            IF TransportRequisition.GET(TransportRequisition."Transport Requisition No") THEN BEGIN
                IF TransportRequisition.Status = TransportRequisition.Status::Open THEN BEGIN
                    status := 'warning*Your leave application  could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your leave application was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

        end else begin
            status := 'danger*A fleet requisition with the given number does not exist, is no longer open or you are not the owner';
        end;
        exit(status);
    end;

    procedure removeStaffFromTravelRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; entryNo: Integer) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
    begin
        //status:='danger*The Staff member could not be removed from your Fleet Requisition';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionStaff.Reset;
            TravelRequisitionStaff.SetRange(TravelRequisitionStaff."Employee No", employeeNo);
            TravelRequisitionStaff.SetRange("Req No", requisitionNo);
            if TravelRequisitionStaff.FindSet then begin
                if TravelRequisitionStaff.Delete(true) then begin
                    status := 'success*The Staff member was successfully removed from your Fleet Requisition';
                end;

            end;


        end else begin
            // status:='danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure generateLeaveForm(employeeNo: Code[50]; leaveNo: Code[50]) status: Text
    var
        leaveFileName: Text;
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        status := 'danger*The leave form could not be generated';
        leaveApplications.Reset;
        leaveApplications.SetRange("Application Code", leaveNo);
        leaveApplications.SetRange("Employee No", employeeNo);
        if leaveApplications.FindSet then begin
            leaveFileName := FILESPATH + 'leave' + leaveNo + '.pdf';
            // if FILE.Exists(leaveFileName) then begin
            //     FILE.Erase(leaveFileName);
            // end;
            // Report.SaveAsPdf(69005, leaveFileName, leaveApplications);
            // if FILE.Exists(leaveFileName) then begin
            //     status := 'success*' + 'Downloads\leave' + leaveNo + '.pdf';
            // end;
        end else begin
            status := 'danger*The leave does not exist or you are not the requester';
        end;
        exit(status);
    end;

    procedure sendRecordForApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
    begin
        status := 'danger*The record could not be sent for approval';
        recordType := Lowercase(recordType);
        if recordType = 'leave' then begin
            status := 'danger*The leave could not be sent for approval';
            leaveApplications.Reset;
            leaveApplications.SetRange("Application Code", recordNo);
            leaveApplications.SetRange("Employee No", employeeNo);
            if leaveApplications.FindSet then begin
                // if ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(leaveApplications) then
                //    ApprovalsMgmt.OnSendLeaveAppForApproval(leaveApplications);
                if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
                    if HRLeaveApplication1.Status = HRLeaveApplication1.Status::Open then begin
                        status := 'warning*Your leave application  could not be sent for approval';
                    end else begin
                        status := 'success*Your leave application was successfully  sent for approval';
                    end;
                end;
            end else begin
                status := 'danger*The leave does not exist or you are not the requester';
            end;
        end;
        exit(status);
    end;

    procedure cancelRecordApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Application";
        // ImprestMemo1: Record "Imprest Memo";
        Payments2: Record payments;
        ImprestHeader: Record payments;
        PurchaseHeader1: Record "Purchase Header";
        TransportRequisition: Record "Transport Requisition";
        TransportRequisition1: Record "Transport Requisition";
    begin
        status := 'danger*The record approval could not be cancelled';
        recordType := Lowercase(recordType);
        if recordType = 'leave' then begin
            status := 'danger*The leave approval could not be cancelled';
            leaveApplications.Reset;
            leaveApplications.SetRange("Application Code", recordNo);
            leaveApplications.SetRange("Employee No", employeeNo);
            leaveApplications.SetRange(status, leaveApplications.Status::"Pending Approval");

            if leaveApplications.FindSet then begin
                leaveApp := leaveApplications;
                IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                    CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                IF leaveApplications.GET(leaveApplications."Application Code") THEN BEGIN
                    IF leaveApplications.Status = leaveApplications.Status::"Pending Approval" THEN BEGIN
                        status := 'warning*Your leave application  could not be cancelled. Kindly try again or contact the administrator if this error persists';
                    END ELSE BEGIN
                        status := 'success*Your leave application was successfully  cancelled';
                    END;
                end else begin
                    status := 'danger*Approval workflow is not enabled';
                end;

            end else begin
                status := 'danger*The leave does not exist as pending approval or you are not the requester';

            end;
        end else
            //     if recordType = 'staff claim' then begin
            //         Payments.Reset;
            //         Payments.SetRange("Account No.", employeeNo);
            //         Payments.SetRange("No.", recordNo);

            //         if Payments.FindSet then begin

            //             leaveApp := Payments;
            //             IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
            //                 CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
            //             IF Payments.GET(Payments."No.") THEN BEGIN
            //                 IF Payments.Status = Payments.Status::"Pending Approval" THEN BEGIN
            //                     status := 'warning*Your Staff Claim could not be cancelled. Kindly try again or contact the administrator if this error persists';
            //                 END ELSE BEGIN
            //                     status := 'success*Your Staff Claim was successfully cancelled';
            //                 END;
            //             end else begin
            //                 status := 'danger*Approval workflow is not enabled';
            //             end;


            //         end else begin
            //             status := 'danger*The staff claim is not open or you are not the requestor. Kindly contact the administrator if this error persists. ';

            //         end;
            //     end else

            //         if recordType = 'imprest memo' then begin
            //             status := 'danger*The imprest memo approval could not be cancelled';

            //             ImprestMemo.Reset;
            //             ImprestMemo.SetRange(Requestor, employeeNo);
            //             ImprestMemo.SetRange("No.", recordNo);
            //             ImprestMemo.SetRange(Status, ImprestMemo.Status::"Pending Approval");
            //             if ImprestMemo.FindSet then begin
            //                 leaveApp := ImprestMemo;
            //                 IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
            //                     CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
            //                 IF ImprestMemo.GET(ImprestMemo."No.") THEN BEGIN
            //                     IF ImprestMemo.Status = ImprestMemo.Status::"Pending Approval" THEN BEGIN
            //                         status := 'warning*Your imprest could not be cancelled. Kindly try again or contact the administrator if this error persists';
            //                     END ELSE BEGIN
            //                         status := 'success*Your imprest was successfully cancelled';
            //                     END;
            //                 end else begin
            //                     status := 'danger*Approval workflow is not enabled';
            //                 end;


            //             end else begin
            //                 status := 'danger*An imprest with the given number does not exist, you are not the requestor or has not been sent for approval';
            //             end;
            //             exit(status);
            //         end else
            //             if recordType = 'imprest surrender' then begin
            //                 status := 'danger*The imprest surrender could not be sent for approval';

            //                 Payments.Reset;
            //                 Payments.SetRange("Account No.", employeeNo);
            //                 Payments.SetRange("No.", recordNo);
            //                 Payments.SetRange(Status, Payments.Status::"Pending Approval");
            //                 Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
            //                 Payments.SetRange("Document Type", Payments."document type"::Surrender);
            //                 if Payments.FindSet then begin

            //                     leaveApp := Payments;
            //                     IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
            //                         CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
            //                     IF Payments.GET(Payments."No.") THEN BEGIN
            //                         IF Payments.Status = Payments.Status::"Pending Approval" THEN BEGIN
            //                             status := 'warning*Your imprest surrender could not be cancelled. Kindly try again or contact the administrator if this error persists';
            //                         END ELSE BEGIN
            //                             status := 'success*Your imprest surrender was successfully cancelled';
            //                         END;
            //                     end else begin
            //                         status := 'danger*Approval workflow is not enabled';
            //                     end;

            //                 end else begin
            //                     status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or has not been sent for approval';
            //                 end;
            //                 exit(status);
            //             end else
            if recordType = 'purchase requisition' then begin
                status := 'danger*The Purchase Requisition approval could not be cancelled';
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange("Request-By No.", employeeNo);
                PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
                PurchaseHeader.SetRange("No.", recordNo);
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
                if PurchaseHeader.FindSet then begin

                    leaveApp := PurchaseHeader;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                        CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                    IF PurchaseHeader.GET(PurchaseHeader."No.") THEN BEGIN
                        IF PurchaseHeader.Status = PurchaseHeader.Status::"Pending Approval" THEN BEGIN
                            status := 'warning*Your Purchase Requisition could not be cancelled. Kindly try again or contact the administrator if this error persists';
                        END ELSE BEGIN
                            status := 'success*Your Purchase Requisition was successfully cancelled';
                        END;
                    end else begin
                        status := 'danger*Approval workflow is not enabled';
                    end;

                end else begin
                    status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
                end;

            end else
                if recordType = 'store requisition' then begin
                    status := 'danger*The Store Requisition approval could not be cancelled';
                    PurchaseHeader.Reset;
                    PurchaseHeader.SetRange("Request-By No.", employeeNo);
                    PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
                    PurchaseHeader.SetRange("No.", recordNo);
                    PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
                    if PurchaseHeader.FindSet then begin

                        leaveApp := PurchaseHeader;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                            CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                        IF PurchaseHeader.GET(PurchaseHeader."No.") THEN BEGIN
                            IF PurchaseHeader.Status = PurchaseHeader.Status::"Pending Approval" THEN BEGIN
                                status := 'warning*Your Store Requisition could not be cancelled. Kindly try again or contact the administrator if this error persists';
                            END ELSE BEGIN
                                status := 'success*Your Store Requisition was successfully cancelled';
                            END;
                        end else begin
                            status := 'danger*Approval workflow is not enabled';
                        end;

                    end else begin
                        status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
                    end;
                end else
                    if recordType = 'transport requisition' then begin
                        status := 'danger*The fleet requisition approval could not be cancelled';
                        TransportRequisition.Reset;
                        TransportRequisition.SetRange("Employee No", employeeNo);
                        TransportRequisition.SetRange("Transport Requisition No", recordNo);
                        TransportRequisition.SetRange(Status, TransportRequisition.status::"Pending Approval");
                        if TransportRequisition.FindSet then begin

                            leaveApp := TransportRequisition;
                            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                                CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                            IF TransportRequisition.GET(TransportRequisition."Transport Requisition No") THEN BEGIN
                                IF TransportRequisition.Status = TransportRequisition.Status::"Pending Approval" THEN BEGIN
                                    status := 'warning*Your Transport Requisition could not be cancelled. Kindly try again or contact the administrator if this error persists';
                                END ELSE BEGIN
                                    status := 'success*Your Transport Requisition was successfully cancelled';
                                END;
                            end else begin
                                status := 'danger*Approval workflow is not enabled';
                            end;

                        end else begin
                            status := 'danger*A Transport requisition with the given number does not exist, has not been sent for approval or you are not the owner';
                        end;
                        // end else
                        //     if recordType = 'staff claim' then begin
                        //         status := 'danger*The Staff claim approval could not be cancelled';

                        //         Payments.Reset;
                        //         Payments.SetRange("Account No.", employeeNo);
                        //         Payments.SetRange("No.", recordNo);
                        //         Payments.SetRange(Status, Payments.Status::"Pending Approval");
                        //         Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
                        //         Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
                        //         if Payments.FindSet then begin

                        //             leaveApp := Payments;
                        //             IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                        //                 CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                        //             IF Payments.GET(Payments."No.") THEN BEGIN
                        //                 IF Payments.Status = Payments.Status::"Pending Approval" THEN BEGIN
                        //                     status := 'warning*Your Staff Claim could not be cancelled. Kindly try again or contact the administrator if this error persists';
                        //                 END ELSE BEGIN
                        //                     status := 'success*Your Staff Claim was successfully cancelled';
                        //                 END;
                        //             end else begin
                        //                 status := 'danger*Approval workflow is not enabled';
                        //             end;

                        //         end else begin
                        //             status := 'danger*A Staff Claim with the given number does not exist, you are not the requestor or has not been sent for approval';
                        //         end;
                    end;
        exit(status);
    end;

    procedure changePassword(employeeNo: Code[50]; currentPassword: Text; newPassword: Text; confirmPassword: Text) status: Text
    var
        HRPortalUsers: Record HRPortalUsers;
    begin
        status := 'danger*Your password could not be changed. Please try again';
        HRPortalUsers.Reset;
        HRPortalUsers.SetRange(employeeNo, employeeNo);
        HRPortalUsers.SetRange(password, currentPassword);
        if HRPortalUsers.FindSet then begin
            if StrLen(newPassword) > 3 then begin
                if newPassword = confirmPassword then begin
                    HRPortalUsers.password := newPassword;
                    HRPortalUsers.changedPassword := true;
                    if HRPortalUsers.Modify(true) then begin
                        status := 'success*Your password was successfully updated';
                    end else begin
                        status := 'danger*Your password could not be changed. Please try again';
                    end;
                end else begin
                    status := 'danger*New Password and confirm new password do not match!!!';
                end;
            end else begin
                status := 'danger*The password you entered as your new password is too short. It should be atleast 4 characters';
            end;
        end else begin
            status := 'danger*The password you entered as your current password is wrong. Please try again';
        end;
        exit(status);
    end;

    procedure deleteRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; lineNo: Integer; documentType: Integer) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        status := 'danger*Your Requisition Line could not be deleted';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            PurchaseLine.Reset;
            PurchaseLine.SetRange("Document Type", documentType);
            PurchaseLine.SetRange("Document No.", requisitionNo);
            PurchaseLine.SetRange("Line No.", lineNo);
            if PurchaseLine.FindSet then begin
                if PurchaseLine.Delete(true) then begin
                    status := 'success*The Requisition Line was successfully deleted';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be deleted';
                end;
            end else begin
                status := 'danger*The Requisition Line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    // procedure sendStaffClaimApproval(employeeNo: Code[50]; staffClaim: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    // begin
    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.", staffClaim);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
    //     Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
    //     if Payments.FindSet then begin

    //         leaveApp := Payments;
    //         IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
    //             CustomApprovals.OnSendDocForApproval(leaveApp);
    //         IF Payments.GET(Payments."No.") THEN BEGIN
    //             IF Payments.Status = Payments.Status::Open THEN BEGIN
    //                 status := 'warning*Your staff claim  could not be sent for approval. Kindly try again or contact the administrator if this error persists';
    //             END ELSE BEGIN
    //                 status := 'success*Your staff claim was successfully sent for approval';
    //             END;
    //         end else begin
    //             status := 'danger*Approval workflow is not enabled';
    //         end;

    //         //end;
    //     end else begin
    //         status := 'danger*A staff claim with the given number does not exist, you are not the requestor or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure ApproveStaffClaim(employeeNo: Code[50]; staffClaim: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    //     PortalApprovalEntry: Record "PortalApproval Entry";
    //     Employee: Record Employee;
    // begin
    //     PortalApprovalEntry.Reset;
    //     PortalApprovalEntry.SetRange("Approver ID", employeeNo);
    //     PortalApprovalEntry.SetRange("Document No.", staffClaim);
    //     if PortalApprovalEntry.FindSet then begin
    //         Payments.Reset;
    //         Payments.SetRange("No.", staffClaim);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
    //         Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
    //         if Payments.FindSet then begin
    //             Payments.TestField("Account No.");
    //             Payments.TestField("Account Name");
    //             Payments.TestField("Shortcut Dimension 1 Code");
    //             Payments.TestField(Job);
    //             Payments.TestField("Job Task No");
    //             // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
    //             //    ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
    //             if Payments2.Get(staffClaim) then begin
    //                 if Payments2.Status = Payments2.Status::"Pending Approval" then begin
    //                     PortalApprovalEntry.Status := PortalApprovalEntry.Status::Approved;
    //                     if PortalApprovalEntry.Modify(true) then
    //                         status := 'success*The staff claim was successfully Approved';
    //                 end;
    //             end;
    //         end else begin
    //             status := 'danger*A staff claim with the given number does not exist';
    //         end;
    //     end else begin
    //         status := 'danger*A staff claim with the given number does not exist, you are not the requestor or is no longer open';
    //     end;
    //     exit(status);
    // end;

    // procedure CancelStaffClaimRecordApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    // var
    //     HRLeaveApplication1: Record "HR Leave Application";
    //     ImprestMemo1: Record "Imprest Memo";
    //     Payments2: Record payments;
    //     ImprestHeader: Record payments;
    //     PurchaseHeader1: Record "Purchase Header";
    //     TransportRequisition: Record "Transport Requisition";
    //     TransportRequisition1: Record "Transport Requisition";
    //     Employee: Record Employee;
    //     PortalApprovalEntry: Record "PortalApproval Entry";
    // begin
    //     status := 'danger*The record approval could not be cancelled';
    //     Employee.Reset;
    //     Employee.SetRange("No.", employeeNo);
    //     if Employee.FindSet then begin
    //         PortalApprovalEntry.Reset;
    //         PortalApprovalEntry.SetRange("Document No.", recordNo);
    //         PortalApprovalEntry.SetRange("Approver ID", employeeNo);
    //         if PortalApprovalEntry.FindSet then begin
    //             recordType := Lowercase(recordType);
    //             if recordType = 'leave' then begin
    //                 status := 'danger*The Staff Claim approval could not be cancelled';
    //                 leaveApplications.Reset;
    //                 leaveApplications.SetRange("Application Code", recordNo);
    //                 leaveApplications.SetRange("Employee No", employeeNo);
    //                 if leaveApplications.FindSet then begin
    //                     //  ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(leaveApplications);
    //                     if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
    //                         if HRLeaveApplication1.Status = leaveApplications.Status then begin
    //                             status := 'warning*Your leave application  approval could not be cancelled';
    //                         end else begin
    //                             status := 'success*Your leave application approval was successfully cancelled';
    //                         end;
    //                     end;
    //                 end else begin
    //                     status := 'danger*The leave does not exist or you are not the requester';
    //                 end;
    //             end else
    //                 if recordType = 'imprest memo' then begin
    //                     status := 'danger*The imprest memo approval could not be cancelled';
    //                     ImprestMemo.Reset;
    //                     ImprestMemo.SetRange(Requestor, employeeNo);
    //                     ImprestMemo.SetRange("No.", recordNo);
    //                     ImprestMemo.SetRange(Status, ImprestMemo.Status::"Pending Approval");
    //                     if ImprestMemo.FindSet then begin

    //                         //  ApprovalsMgmt.OnCancelImpMemoApprovalRequest(ImprestMemo);

    //                         ImprestMemo1.Reset;
    //                         ImprestMemo1.SetRange(Requestor, employeeNo);
    //                         ImprestMemo1.SetRange("No.", recordNo);
    //                         if ImprestMemo1.FindSet then begin
    //                             if not (ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval") then begin
    //                                 status := 'success*The imprest memo approval was successfully cancelled';
    //                             end;
    //                         end;

    //                     end else begin
    //                         status := 'danger*An imprest with the given number does not exist, you are not the requestor or has not been sent for approval';
    //                     end;
    //                     exit(status);
    //                 end else
    //                     if recordType = 'imprest surrender' then begin
    //                         status := 'danger*The imprest surrender could not be sent for approval';

    //                         Payments.Reset;
    //                         Payments.SetRange("Account No.", employeeNo);
    //                         Payments.SetRange("No.", recordNo);
    //                         Payments.SetRange(Status, Payments.Status::"Pending Approval");
    //                         Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
    //                         Payments.SetRange("Document Type", Payments."document type"::Surrender);
    //                         if Payments.FindSet then begin
    //                             //  ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

    //                             if Payments2.Get(recordNo) then begin
    //                                 if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
    //                                     status := 'success*The imprest Surrender approval was successfully cancelled';
    //                                     if ImprestHeader.Get(Payments2."Imprest Issue Doc. No") then begin
    //                                         ImprestHeader.Selected := false;
    //                                         ImprestHeader.Modify;
    //                                     end;
    //                                 end;
    //                             end;
    //                         end else begin
    //                             status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or has not been sent for approval';
    //                         end;
    //                         exit(status);
    //                     end else
    //                         if recordType = 'purchase requisition' then begin
    //                             status := 'danger*The Purchase Requisition approval could not be cancelled';
    //                             PurchaseHeader.Reset;
    //                             PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //                             PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
    //                             PurchaseHeader.SetRange("No.", recordNo);
    //                             PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
    //                             if PurchaseHeader.FindSet then begin
    //                                 ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);
    //                                 PurchaseHeader1.Reset;
    //                                 PurchaseHeader1.SetRange("Request-By No.", employeeNo);
    //                                 PurchaseHeader1.SetRange("No.", recordNo);
    //                                 PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
    //                                 if PurchaseHeader1.FindSet then begin
    //                                     if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
    //                                         status := 'success*The Purchase Requisition approval was successfully cancelled';
    //                                     end;
    //                                 end;
    //                             end else begin
    //                                 status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
    //                             end;
    //                         end else
    //                             if recordType = 'store requisition' then begin
    //                                 status := 'danger*The Store Requisition approval could not be cancelled';
    //                                 PurchaseHeader.Reset;
    //                                 PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //                                 PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
    //                                 PurchaseHeader.SetRange("No.", recordNo);
    //                                 PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
    //                                 if PurchaseHeader.FindSet then begin

    //                                     ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);

    //                                     PurchaseHeader1.Reset;
    //                                     PurchaseHeader1.SetRange("Request-By No.", employeeNo);
    //                                     PurchaseHeader1.SetRange("No.", recordNo);
    //                                     PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
    //                                     if PurchaseHeader1.FindSet then begin
    //                                         if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
    //                                             status := 'success*The Store Requisition approval was successfully cancelled';
    //                                         end;
    //                                     end;
    //                                 end else begin
    //                                     status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
    //                                 end;
    //                             end else
    //                                 if recordType = 'transport requisition' then begin
    //                                     status := 'danger*The fleet requisition approval could not be cancelled';
    //                                     TransportRequisition.Reset;
    //                                     TransportRequisition.SetRange("Employee No", employeeNo);
    //                                     TransportRequisition.SetRange("Transport Requisition No", recordNo);
    //                                     if TransportRequisition.FindSet then begin
    //                                         TransportRequisition.TestField(Status, TransportRequisition.Status::"Pending Approval");
    //                                         //   ApprovalsMgmt.OnCancelFleetApprovalRequest(TransportRequisition);
    //                                         if TransportRequisition1.Get(recordNo) then begin
    //                                             if not (TransportRequisition1.Status = TransportRequisition1.Status::"Pending Approval") then begin
    //                                                 status := 'success*The fleet requisition approval was successfully cancelled';
    //                                             end;
    //                                         end;
    //                                     end else begin
    //                                         status := 'danger*A fleet requisition with the given number does not exist, has not been sent for approval or you are not the owner';
    //                                     end;
    //                                 end else
    //                                     if recordType = 'staff claim' then begin
    //                                         status := 'danger*The Staff claim approval could not be cancelled';

    //                                         Payments.Reset;
    //                                         Payments.SetRange("Account No.", employeeNo);
    //                                         Payments.SetRange("No.", recordNo);
    //                                         Payments.SetRange(Status, Payments.Status::"Pending Approval");
    //                                         Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
    //                                         Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
    //                                         if Payments.FindSet then begin
    //                                             //   ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
    //                                             if Payments2.Get(recordNo) then begin
    //                                                 if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
    //                                                     PortalApprovalEntry.Status := PortalApprovalEntry.Status::Canceled;
    //                                                     if PortalApprovalEntry.Modify(true) then
    //                                                         status := 'success*The staff claim approval was successfully cancelled';
    //                                                 end;
    //                                             end;
    //                                         end else begin
    //                                             status := 'danger*A Staff Claim with the given number does not exist, you are not the requestor or has not been sent for approval';
    //                                         end;
    //                                     end;
    //         end;
    //     end;
    //     exit(status);
    // end;

    // procedure createStaffClaim(employeeNo: Code[50]; claimNo: Code[50]; paymentNarration: Text; fundCode: Code[100]; job: Code[100]; jobTask: Code[100]) status: Text
    // begin
    //     status := 'danger*Your staff claim could not be captured';
    //     if claimNo = '' then begin //new imprest surrender
    //         Payments.Init;
    //         Payments."Document Type" := Payments."document type"::"Staff Claims";
    //         Payments.Validate("Document Type");
    //         Payments."Payment Type" := Payments."payment type"::"Staff Claim";
    //         Payments.Validate("Payment Type");
    //         Payments."Account Type" := Payments."account type"::Employee;
    //         Payments.Validate("Account Type");
    //         //Added By Fred To Cater for The HOD Workflows
    //         Payments."Account No." := employeeNo;
    //         if Employee.Get(Payments."Account No.") then
    //             Payments.HOD := Employee.HOD;
    //         //Added By Fred To Cater for The HOD Workflows
    //         Payments.Validate("Account No.");
    //         Payments."Payment Narration" := paymentNarration;
    //         Payments."Funding Source" := fundCode;
    //         Payments.Validate("Payment Narration");
    //         Payments."Shortcut Dimension 2 Code" := fundCode;
    //         Payments.Validate("Shortcut Dimension 2 Code");
    //         Payments.Job := job;
    //         Payments.Validate(Job);
    //         Payments."Job Task No" := jobTask;
    //         Payments.Validate("Job Task No");
    //         Payments."Job Task No." := jobTask;
    //         Payments.Validate("Job Task No.");
    //         if Payments.Insert(true) then begin
    //             status := 'success*Your staff claim was successfully captured*' + Payments."No.";
    //         end else begin
    //             status := 'danger*Your staff claim could not be captured';
    //         end;
    //     end else begin //existing
    //         Payments.Reset;
    //         Payments.SetRange("No.", claimNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //             Payments."Payment Narration" := paymentNarration;
    //             Payments.Validate("Payment Narration");
    //             Payments."Shortcut Dimension 2 Code" := fundCode;
    //             Payments.Validate("Shortcut Dimension 2 Code");
    //             Payments.Job := job;
    //             Payments.Validate(Job);
    //             Payments."Job Task No" := jobTask;
    //             Payments.Validate("Job Task No");
    //             Payments."Job Task No." := jobTask;
    //             Payments.Validate("Job Task No.");
    //             if Payments.Modify(true) then begin
    //                 status := 'success*Your staff claim was successfully updated';
    //             end else begin
    //                 status := 'danger*Your staff claim could not be updated';
    //             end;

    //         end else begin
    //             status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //         end;

    //     end;
    //     exit(status);
    // end;

    // procedure createStaffClaim1(employeeNo: Code[50]; claimNo: Code[50]; paymentNarration: Text; fundCode: Code[100]; job: Code[100]; jobTask: Code[100]; region: Code[100]) status: Text
    // begin
    //     status := 'danger*Your staff claim could not be captured';
    //     if claimNo = '' then begin //new imprest surrender
    //         Payments.Init;
    //         Payments."Document Type" := Payments."document type"::"Staff Claims";
    //         Payments.Validate("Document Type");
    //         Payments."Payment Type" := Payments."payment type"::"Staff Claim";
    //         Payments.Validate("Payment Type");
    //         Payments."Account Type" := Payments."account type"::Employee;
    //         Payments.Validate("Account Type");
    //         //Added By Fred To Cater for The HOD Workflows
    //         Payments."Account No." := employeeNo;
    //         if Employee.Get(Payments."Account No.") then
    //             Payments.HOD := Employee.HOD;
    //         //Added By Fred To Cater for The HOD Workflows
    //         Payments.Validate("Account No.");
    //         Payments."Payment Narration" := paymentNarration;
    //         Payments.Validate("Payment Narration");
    //         Payments."Shortcut Dimension 2 Code" := fundCode;
    //         Payments.Validate("Shortcut Dimension 2 Code");
    //         Payments.Job := job;
    //         Payments.Validate(Job);
    //         Payments."Job Task No" := jobTask;
    //         Payments.Validate("Job Task No");
    //         Payments."Job Task No." := jobTask;
    //         Payments.Validate("Job Task No.");
    //         if Payments.Insert(true) then begin
    //             Payments."Responsibility Center" := region;
    //             Payments.Modify(true);
    //             status := 'success*Your staff claim was successfully captured*' + Payments."No.";
    //         end else begin
    //             status := 'danger*Your staff claim could not be captured';
    //         end;
    //     end else begin //existing
    //         Payments.Reset;
    //         Payments.SetRange("No.", claimNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //             Payments."Payment Narration" := paymentNarration;
    //             Payments.Validate("Payment Narration");
    //             Payments."Shortcut Dimension 2 Code" := fundCode;
    //             Payments.Validate("Shortcut Dimension 2 Code");
    //             Payments.Job := job;
    //             Payments.Validate(Job);
    //             Payments."Job Task No" := jobTask;
    //             Payments.Validate("Job Task No");
    //             Payments."Job Task No." := jobTask;
    //             Payments.Validate("Job Task No.");
    //             if Payments.Modify(true) then begin
    //                 status := 'success*Your staff claim was successfully updated';
    //             end else begin
    //                 status := 'danger*Your staff claim could not be updated';
    //             end;

    //         end else begin
    //             status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //         end;

    //     end;
    //     exit(status);
    // end;

    // procedure deleteStaffClaimLine(employeeNo: Code[100]; claimNo: Code[100]; lineNo: Integer) status: Text
    // var
    //     PVLines: Record "PV Lines";
    // begin
    //     status := 'danger*The staff claim line could not be deleted';
    //     Payments.Reset;
    //     Payments.SetRange("No.", claimNo);
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     if Payments.FindSet then begin
    //         PVLines.Reset;
    //         PVLines.SetRange(No, claimNo);
    //         PVLines.SetRange("Line No", lineNo);
    //         if PVLines.FindSet then begin
    //             if PVLines.Delete(true) then begin
    //                 status := 'success*The staff claim line was successfully deleted';
    //             end else begin
    //                 status := 'danger*The staff claim line could not be deleted'
    //             end;
    //         end else begin
    //             status := 'danger*The staff claim line could not be deleted';
    //         end;
    //     end else begin
    //         status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    // end;



    // procedure createStaffClaimLine(employeeNo: Code[100]; claimNo: Code[100]; claimtype: Code[100]; voteItem: Code[100]; description: Text; amount: Decimal) status: Text
    // var
    //     PVLines: Record "PV Lines";
    // begin
    //     status := 'danger*The staff claim line could not be deleted';
    //     Payments.Reset;
    //     Payments.SetRange("No.", claimNo);
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     if Payments.FindSet then begin
    //         PVLines.INIT;
    //         PVLines.No := claimNo;
    //         PVLines.VALIDATE(No);
    //         PVLines."Account Type" := PVLines."Account Type"::"G/L Account";
    //         PVLines."Type of Expense" := voteItem;
    //         PVLines.VALIDATE("Type of Expense");
    //         PVLines.Description := description;
    //         PVLines.VALIDATE(Description);
    //         PVLines.Amount := amount;
    //         PVLines.VALIDATE(Amount);
    //         if PVLines.Insert(true) then begin
    //             status := 'success*The staff claim line was successfully added';
    //         end else begin
    //             status := 'danger*The staff claim line could not be added'
    //         end;

    //     end else begin
    //         status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    // end;

    // procedure editStaffClaimLine(lineNo: Integer; employeeNo: Code[100]; claimNo: Code[100]; voteItem: Code[100]; description: Text; amount: Decimal) status: Text
    // var
    //     PVLines: Record "PV Lines";
    // begin
    //     status := 'danger*The staff claim line could not be deleted';
    //     Payments.Reset;
    //     Payments.SetRange("No.", claimNo);
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     if Payments.FindSet then begin
    //         PVLines.Reset;
    //         PVLines.SetRange("Line No", lineNo);
    //         PVLines.SetRange(No, claimNo);
    //         if PVLines.FindSet then begin
    //             PVLines.Validate(No);
    //             PVLines."Type of Expense" := voteItem;
    //             PVLines.Validate("Type of Expense");
    //             PVLines.Description := description;
    //             PVLines.Validate(Description);
    //             PVLines.Amount := amount;
    //             PVLines.Validate(Amount);
    //             if PVLines.Modify(true) then begin
    //                 status := 'success*The staff claim line was successfully updated';
    //             end else begin
    //                 status := 'danger*The staff claim line could not be updated'
    //             end;
    //         end else begin
    //             status := 'danger*The staff claim line does not exist';
    //         end;
    //     end else begin
    //         status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //     end;
    // end;

    procedure sendStoreRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        PurchaseHeader1: Record "Purchase Header";
    begin
        status := 'danger*The Store Requisition could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
        if PurchaseHeader.FindSet then begin

            leaveApp := PurchaseHeader;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            IF PurchaseHeader.GET(PurchaseHeader."No.") THEN BEGIN
                IF PurchaseHeader.Status = PurchaseHeader.Status::Open THEN BEGIN
                    status := 'warning*Your Purchase Requisition could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your Purchase Requisition was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;



        end else begin
            status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);

    end;

    procedure createStoreRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; itemCategory: Code[250]; item: Code[250]; quantity: Decimal; uom: Text[100]) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin

        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            if (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition") then begin
                //add line
                PurchaseLine.Init;
                //Document Type,Document No.,Line No.
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Store Requisition";
                end;
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Purchase Requisition";
                end;
                PurchaseLine."Document No." := requisitionNo;
                PurchaseLine.Validate("Document No.");
                PurchaseLine."Line No." := getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
                PurchaseLine.Validate("Line No.");
                PurchaseLine."Item Category" := itemCategory;
                PurchaseLine.Validate("Item Category");
                PurchaseLine."Service/Item Code" := item;
                PurchaseLine.Validate("Service/Item Code");
                PurchaseLine."Qty. Requested" := quantity;
                PurchaseLine.Validate("Qty. Requested");
                PurchaseLine."Unit of Measure" := uom;

                if PurchaseLine.Insert(true) then begin
                    PurchaseLine.Validate("Qty. Requested", quantity);

                    PurchaseLine.Modify(true);
                    status := 'success*The Requisition Line was successfully added';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure applyexternalHrJobs(jobId: Text[20]; surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; religion: Text[50]; idNumber: Text[50]; phoneNo: Text[30]; email: Text[50]; ethinc: Text[30]; postalAddress: Text[50]; postalAddressCode: Text[50]; city: Text[50]; "expected salary": Decimal; registrationDetails: Text[250]) status: Text
    begin
        JobApplicants.Reset;
        JobApplicants.SetRange("Job Applied For", jobId);
        JobApplicants.SetRange("ID Number", idNumber);

        if JobApplicants.FindSet then begin
            status := 'error';
            /*CASE gender OF
                  0:
                    gender:=gender::Male;
                  1:
                    gender:=gender::Female;
                  2:gender:=gender::Both;

                  ELSE
                    END;

              CASE disabled OF
                0:
                  disabled:=disabled::Yes;
                1:
                  disabled:=disabled::No;
                  ELSE
                  END;

           CASE maritalStatus OF
             0:
               maritalStatus:=maritalStatus::Married;

             1:
               maritalStatus:=maritalStatus::Single;
             2:
               maritalStatus:=maritalStatus::Divorced;

             3:
              maritalStatus:=maritalStatus::Separated;
             4:
                maritalStatus:=maritalStatus::"Widow(er)";
             5:
               maritalStatus:=maritalStatus::Other;

               ELSE
               END;
               JobApplicants."Application No":='';
                JobApplicants."Job Applied For":=jobId;
                JobApplicants."First Name":=firstname;
                JobApplicants."Middle Name":=lastname;
                JobApplicants."Last Name":=surname;
                JobApplicants.Initials:=title;
                JobApplicants."Date Applied":=TODAY();
                JobApplicants."Date Of Birth":=DOB;
                JobApplicants.Gender:=gender;
                JobApplicants.Disabled:=disabled;
                JobApplicants."Disability Details":= disabilityDetails;
                JobApplicants.County:=county;
                JobApplicants.Citizenship:=nationality;
                JobApplicants."Marital Status":=maritalStatus;
                JobApplicants.Religion:=religion;
                JobApplicants."ID Number":=idNumber;
                JobApplicants."Ethnic Origin":=ethinc;
                JobApplicants."E-Mail":=email;
                JobApplicants."Cell Phone Number":=phoneNo;
                JobApplicants."Postal Address":= postalAddress;
                JobApplicants."Post Code":= postalAddressCode;
                JobApplicants.City:=city;
                JobApplicants."Expected Salary":="expected salary";


               IF  JobApplicants.MODIFY(TRUE) THEN BEGIN

                    jpa.RESET;
                  jpa.SETRANGE("ID Number",idNumber);
                  jpa.SETRANGE("Job Applied For",jobId);
                  IF jpa.FINDSET THEN BEGIN
                    status:=jpa."Application No";
                    END
                   END
                   ELSE
                   BEGIN
                      status:='error*It seems you have not applied for this position. Please try another position';
                     END
               */
        end
        else begin

            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;
            JobApplicants.Init;
            JobApplicants."Application No" := '';
            JobApplicants."Job Applied For" := jobId;

            JobApplicants."First Name" := firstname;
            JobApplicants."Middle Name" := lastname;
            JobApplicants."Last Name" := surname;
            JobApplicants.Initials := title;
            JobApplicants."Date Applied" := Today();
            JobApplicants."Date Of Birth" := DOB;
            JobApplicants.Gender := gender;
            JobApplicants.Disabled := disabled;
            JobApplicants."Disability Details" := disabilityDetails;
            JobApplicants.County := county;
            JobApplicants.Citizenship := nationality;
            JobApplicants."Marital Status" := maritalStatus;
            JobApplicants.Religion := religion;
            JobApplicants."ID Number" := idNumber;
            JobApplicants."Ethnic Origin" := ethinc;
            JobApplicants."E-Mail" := email;
            JobApplicants."Cell Phone Number" := phoneNo;
            JobApplicants."Details of Disability regist" := registrationDetails;

            JobApplicants."Postal Address" := postalAddress;
            JobApplicants."Post Code" := postalAddressCode;
            JobApplicants.City := city;
            JobApplicants."Expected Salary" := "expected salary";

            if JobApplicants.Insert(true) then begin
                jpa.Reset;
                jpa.SetRange("ID Number", idNumber);
                jpa.SetRange("Job Applied For", jobId);
                if jpa.FindLast then begin
                    status := jpa."Application No";
                end

            end
            else begin
                status := 'error*an error occured during the process of insertion';
            end;

        end;

    end;

    procedure applyinternalHrJobs(docNo: Text[30]; jobId: Text[20]; surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; religion: Text[50]; idNumber: Text[50]; NhifNo: Text[30]; NssfNo: Text[30]; pinNo: Text[30]; phoneNo: Text[30]; altPhoneNo: Text[30]; email: Text[50]; altEmail: Text[50]; empNo: Text[20]; dpt: Text[100]; currentPosition: Text[150]; jobGroup: Text[50]; dateOfFirstAppointment: Date; lastPromotionDate: Date; ethinc: Text[30]) status: Text
    begin
        JobApplicants.Reset;
        JobApplicants.SetRange("Job Applied For", jobId);
        JobApplicants.SetRange("ID Number", idNumber);

        if JobApplicants.FindSet then begin
            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;
            JobApplicants."Application No" := docNo;
            JobApplicants."Job Applied For" := jobId;
            JobApplicants."Employee No" := empNo;
            JobApplicants."First Name" := firstname;
            JobApplicants."Middle Name" := lastname;
            JobApplicants."Last Name" := surname;
            JobApplicants.Initials := title;
            JobApplicants."Date Applied" := Today();
            JobApplicants."Date Of Birth" := DOB;
            JobApplicants.Gender := gender;
            JobApplicants.Disabled := disabled;
            JobApplicants."Disability Details" := disabilityDetails;
            JobApplicants.County := county;
            JobApplicants.Citizenship := nationality;
            JobApplicants."Marital Status" := maritalStatus;
            JobApplicants.Religion := religion;
            JobApplicants."ID Number" := idNumber;
            JobApplicants.NHIF := NhifNo;
            JobApplicants.NSSF := NssfNo;
            JobApplicants."Ethnic Origin" := ethinc;
            JobApplicants."Position held" := currentPosition;
            JobApplicants."Job Group" := jobGroup;
            JobApplicants."First Appointment Date" := dateOfFirstAppointment;
            JobApplicants."Last Appointment Date" := lastPromotionDate;
            JobApplicants."Department Code" := dpt;
            JobApplicants."PIN Number" := pinNo;
            JobApplicants."E-Mail" := email;
            JobApplicants."Alternative Email" := altEmail;
            JobApplicants."Cell Phone Number" := phoneNo;
            JobApplicants."Altenative Phone Number" := altPhoneNo;
            if JobApplicants.Modify(true) then begin

                status := 'success';
            end
            else begin
                status := 'danger*It seems you have not applied for this position. Please try another position';
            end

        end
        else begin

            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;
            //Single,Married,Separated,Divorced,Widow(er),Other

            JobApplicants.Init;
            JobApplicants."Application No" := docNo;
            JobApplicants."Job Applied For" := jobId;
            JobApplicants."Employee No" := empNo;

            JobApplicants."First Name" := firstname;
            JobApplicants."Middle Name" := lastname;
            JobApplicants."Last Name" := surname;
            JobApplicants.Initials := title;
            JobApplicants."Date Applied" := Today();
            JobApplicants."Date Of Birth" := DOB;
            JobApplicants.Gender := gender;
            JobApplicants.Disabled := disabled;
            JobApplicants."Disability Details" := disabilityDetails;
            JobApplicants.County := county;
            JobApplicants.Citizenship := nationality;
            JobApplicants."Marital Status" := maritalStatus;
            JobApplicants.Religion := religion;
            JobApplicants."ID Number" := idNumber;
            JobApplicants.NHIF := NhifNo;
            JobApplicants.NSSF := NssfNo;
            JobApplicants."Ethnic Origin" := ethinc;
            JobApplicants."Position held" := currentPosition;
            JobApplicants."Job Group" := jobGroup;
            JobApplicants."First Appointment Date" := dateOfFirstAppointment;
            JobApplicants."Last Appointment Date" := lastPromotionDate;
            JobApplicants."Department Code" := dpt;




            JobApplicants."PIN Number" := pinNo;
            JobApplicants."E-Mail" := email;
            JobApplicants."Alternative Email" := altEmail;
            JobApplicants."Cell Phone Number" := phoneNo;
            JobApplicants."Altenative Phone Number" := altPhoneNo;
            if JobApplicants.Insert(true) then begin
                jpa.Reset;
                jpa.SetRange("ID Number", idNumber);
                jpa.SetRange("Job Applied For", jobId);
                if jpa.FindLast then begin
                    status := jpa."Application No";
                end

            end
            else begin
                status := 'error*an error occured during the process of insertion';
            end;

        end;
    end;

    procedure updateEmploymentHistory(id: Integer; startDate: Date; endDate: Date; company: Text[150]; designation: Text[150]; JobGrade: Text[100]; appNo: Text[30]; empNo: Text[30]; JobId: Text[30]) status: Text
    begin
        if JobApplicants.Get(id) then begin
            /* ApplicantEmploymentHistory.INIT;
             //ApplicantEmploymentHistory."Entry No.":= appNo;
            // ApplicantEmploymentHistory."Document Type":=company;
             ApplicantEmploymentHistory."Employee No.":=startDate;
             ApplicantEmploymentHistory."Posting Date":=endDate;
             ApplicantEmploymentHistory."User ID":= designation;
             ApplicantEmploymentHistory."Job Grade":=JobGrade;
             ApplicantEmploymentHistory."Entry No.":=appNo;
             ApplicantEmploymentHistory."Employee No":=empNo;
             ApplicantEmploymentHistory."Job Id" := JobId;
             ApplicantEmploymentHistory.MODIFY(TRUE);*/

            status := 'success';

        end
        else
            status := 'error*You seem to have not applied for this position';
        begin
        end

    end;

    procedure addEmploymentHistory(idNumber: Text[30]; startDate: Date; endDate: Date; company: Text[150]; designation: Text[150]; JobGrade: Text[100]; appNo: Text[30]; empNo: Text[30]; JobId: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin
            /* ApplicantEmploymentHistory.INIT;
             ApplicantEmploymentHistory."Entry No.":= appNo;
             ApplicantEmploymentHistory."Document Type":=company;
             ApplicantEmploymentHistory."Employee No.":=startDate;
             ApplicantEmploymentHistory."Posting Date":=endDate;
             ApplicantEmploymentHistory."User ID":= designation;
             ApplicantEmploymentHistory."Job Grade":=JobGrade;
             ApplicantEmploymentHistory."Id Number":=idNumber;
             ApplicantEmploymentHistory."Entry No.":=appNo;
             ApplicantEmploymentHistory."Employee No":=empNo;
             ApplicantEmploymentHistory."Job Id" := JobId;
             ApplicantEmploymentHistory.INSERT(TRUE);

             status:='success';*/

        end
        else
            status := 'error*You seem to have not applied for this position';
        begin
        end

    end;

    procedure addAcademicQualifications(appNo: Code[20]; institution: Text[200]; awardAttainment: Text[150]; specialization: Text[150]; gradeAttained: Text[150]; empNo: Text[30]; jobId: Text[30]; FromDate: Date; ToDate: Date) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            applicantQualifications.Init;

            applicantQualifications."Employee No." := empNo;
            applicantQualifications."Job ID" := jobId;
            applicantQualifications."Institution/Company" := institution;
            applicantQualifications."From Date" := FromDate;
            applicantQualifications."To Date" := ToDate;
            applicantQualifications."Qualification Description" := awardAttainment;
            applicantQualifications.Specialization := specialization;
            applicantQualifications."Course Grade" := gradeAttained;
            applicantQualifications."Application No" := appNo;
            applicantQualifications.Insert(true);

            status := 'success';


        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addProffessionalQualifications(appNo: Code[20]; institution: Text[150]; awardAttainment: Text[100]; specialization: Text[100]; gradeAttained: Text[100]; empNo: Text[20]; jobId: Text[20]; FromDate: Date; ToDate: Date) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            professionalQualifications.Init;
            professionalQualifications."Employee No" := empNo;
            professionalQualifications."Job ID" := jobId;
            professionalQualifications.Institution := institution;
            professionalQualifications."From Date" := FromDate;
            professionalQualifications."To Date" := ToDate;
            professionalQualifications.Attainment := awardAttainment;
            professionalQualifications.Specialization := specialization;
            professionalQualifications."Application No" := appNo;
            professionalQualifications.Grade := gradeAttained;
            professionalQualifications.Insert(true);
            status := 'success';
        end
        else begin
            status := 'You seem to have applied for this position';

        end
    end;

    procedure addTrainingAttended(fromDate: Date; ToDate: Date; JobId: Text[30]; EmployeeNo: Text[30]; Institution: Text[150]; courseName: Text[150]; appNo: Text[30]; attained: Text[100]) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            attendedTraining.Init;
            attendedTraining."Employee No" := EmployeeNo;
            attendedTraining."Application No" := appNo;
            attendedTraining."From Date" := fromDate;
            attendedTraining."To Date" := ToDate;
            attendedTraining."Job ID" := JobId;
            attendedTraining.Institution := Institution;
            attendedTraining."Course Name" := courseName;
            attendedTraining.Attained := attained;
            attendedTraining.Insert(true);
            status := 'success';

        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addProfessionalBody(appNo: Text[30]; jobId: Text[30]; empNo: Text[30]; pBody: Text[100]; mNo: Text[100]; mType: Text[50]; rDate: Date) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            membershipbody.Init;
            membershipbody."Application No" := appNo;
            membershipbody."Employee No" := empNo;
            membershipbody."Job ID" := jobId;
            membershipbody.Institution := pBody;
            membershipbody."Membership Type" := mType;
            membershipbody."Membership No" := mNo;
            membershipbody."Renewal Date" := rDate;

            membershipbody.Insert(true);

            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addApplicantAccomplishment(appNo: Text[30]; empNo: Text[30]; description: Text[500]; number: Integer; jobId: Text[30]; amt: Text[50]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin
            applicantAccomplishment.Reset;
            applicantAccomplishment.SetRange("Job Application No", appNo);
            applicantAccomplishment.SetRange("Indicator Description", description);
            if applicantAccomplishment.FindSet then begin
                applicantAccomplishment.Number := number;
                applicantAccomplishment.Amount := amt;
                applicantAccomplishment.Modify(true);
                status := 'success*Accomplishment updated successfully';

            end
            else begin

                applicantAccomplishment.Init;
                applicantAccomplishment."Job Application No" := appNo;
                applicantAccomplishment."Employee No" := empNo;
                applicantAccomplishment."Job ID" := jobId;
                applicantAccomplishment.Number := number;
                applicantAccomplishment."Id Number" := JobApplicants."ID Number";
                applicantAccomplishment."Indicator Description" := description;
                applicantAccomplishment.Amount := amt;

                applicantAccomplishment.Insert(true);
                status := 'success';
            end
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addAbilityDetails(description: Text[300]; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants."Abilites,Skills" := description;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure createReferee(appNo: Text[30]; empNo: Text[30]; name: Text[100]; occupation: Text[50]; address: Text[50]; postCode: Text[50]; phone: Text[30]; email: Text[40]; knownPeriod: Text[50]; jobId: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin
            referee.Init;
            referee."Job Application No" := appNo;
            referee."Employee No" := empNo;
            referee.Names := name;
            referee.Occupation := occupation;
            referee.Address := address;
            referee."Post Code" := postCode;
            referee."Telephone No" := phone;
            referee."E-Mail" := email;
            referee."Period Known" := knownPeriod;
            referee."Job ID" := jobId;
            referee.Insert(true);
            status := 'success';

        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addCurrentDutiesSkills(abilities: Text[250]; currentDuties: Text[300]; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants."Current Duties" := currentDuties;
            JobApplicants."Abilites,Skills" := abilities;

            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addOtherPersonalDetails(appNo: Text[30]; convicted: Boolean; convictionDesc: Text[30]; dismissal: Boolean; dismissalDesc: Text[100]; highestLevel: Text[100]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants.Convicted := convicted;
            JobApplicants."Conviction Description" := convictionDesc;
            JobApplicants.Dismissal := dismissal;
            JobApplicants."Dismissal Description" := dismissalDesc;
            JobApplicants."Highest Education Level" := highestLevel;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';
        end
    end;

    procedure addDutiesDetails(description: Text[300]; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants."Current Duties" := description;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure deleteAcademicLine(id: Integer; appNo: Text[30]) status: Text
    begin
        applicantQualifications.Reset;
        applicantQualifications.SetRange(Code, id);
        applicantQualifications.SetRange("Application No", appNo);
        if (applicantQualifications.FindSet) then begin
            applicantQualifications.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProfessionalLine(id: Integer; appNo: Text[30]) status: Text
    begin
        professionalQualifications.Reset;
        professionalQualifications.SetRange(Code, id);
        professionalQualifications.SetRange("Application No", appNo);
        if (professionalQualifications.FindSet) then begin
            professionalQualifications.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteTrainingLine(id: Integer; appNo: Text[30]) status: Text
    begin
        attendedTraining.Reset;
        attendedTraining.SetRange(Code, id);
        attendedTraining.SetRange("Application No", appNo);
        if (attendedTraining.FindSet) then begin
            attendedTraining.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProffessionalBodyLine(id: Integer; appNo: Text[30]) status: Text
    begin
        membershipbody.Reset;
        membershipbody.SetRange(Code, id);
        membershipbody.SetRange("Application No", appNo);
        if (membershipbody.FindSet) then begin
            membershipbody.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteEmploymentHistoryLine(id: Integer; appNo: Text[30]) status: Text
    begin
        /*ApplicantEmploymentHistory.RESET;
        ApplicantEmploymentHistory.SETRANGE(Code,id);
        ApplicantEmploymentHistory.SETRANGE("Entry No.",appNo);
        IF(ApplicantEmploymentHistory.FINDSET) THEN BEGIN
          ApplicantEmploymentHistory.DELETE(TRUE);
          status:='success*Record Successfully deleted';

          END
          ELSE BEGIN
            status:='error*The record does not exist';
            END
            */

    end;

    procedure deleteRefereeLine(id: Integer; appNo: Text[30]) status: Text
    begin

        referee.Reset;
        referee.SetRange(Code, id);
        referee.SetRange("Job Application No", appNo);
        if (referee.FindSet) then begin
            referee.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure addDeclaration(declaration: Boolean; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants.Declaralation := declaration;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure createProfileForExternalApplicants(surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; email: Text[100]; religion: Text[50]; idNumber: Text[100]; phoneNo: Text[30]; ethinc: Text[30]; postalAddress: Text[50]; postalAddressCode: Text[50]; city: Text[50]; "expected salary": Decimal; registrationDetails: Text[250]; NhifNo: Text[30]; NssfNo: Text[30]; pinNo: Text[30]; altPhoneNo: Text[30]; altEmail: Text[50]; positionHeld: Text[50]; currentEmployer: Text[100]; GrossSalary: Decimal; effectiveDate: Date) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);

        if externalApplicants.FindSet then begin
            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;

            externalApplicants.FirstName := firstname;
            externalApplicants."Middle Name" := lastname;
            externalApplicants.LastName := surname;
            externalApplicants.Initials := title;
            externalApplicants."Date Applied" := Today();
            externalApplicants."Date Of Birth" := DOB;
            externalApplicants.Gender := gender;
            externalApplicants.Disabled := disabled;
            externalApplicants."Disability Details" := disabilityDetails;
            externalApplicants.County := county;
            externalApplicants.Citizenship := nationality;
            externalApplicants."Marital Status" := maritalStatus;
            externalApplicants.Religion := religion;
            externalApplicants."ID Number" := idNumber;
            externalApplicants."Ethnic Origin" := ethinc;
            externalApplicants."Cell Phone Number" := phoneNo;
            externalApplicants."Details of Disability regist" := registrationDetails;
            externalApplicants."Postal Address" := postalAddress;
            externalApplicants."Post Code" := postalAddressCode;
            externalApplicants.City := city;
            externalApplicants."Expected Salary" := "expected salary";
            externalApplicants.NHIF := NhifNo;
            externalApplicants.NSSF := NssfNo;
            externalApplicants."PIN Number" := pinNo;
            externalApplicants."Altenative Phone Number" := altPhoneNo;
            externalApplicants."Alternative Email" := altEmail;
            externalApplicants."Current Employer" := currentEmployer;
            externalApplicants."Gross Salary" := GrossSalary;
            externalApplicants."Position held" := positionHeld;
            externalApplicants."Effective Date" := effectiveDate;

            if externalApplicants.Modify(true) then begin
                status := 'success';
            end
            else begin
                status := 'error*It seems you have not applied for this position. Please try another position';
            end

        end
    end;

    procedure CreateAccountForExtenalApplicants(fname: Text[100]; lname: Text[100]; email: Text[100]; password: Text[100]; salt: Text[100]) status: Text
    begin
        externalApplicants.Init;
        externalApplicants.FirstName := fname;
        externalApplicants.LastName := lname;
        externalApplicants.Email := email;
        externalApplicants.Password := password;
        externalApplicants.Salt := salt;
        externalApplicants.Insert(true);
        status := 'success';
    end;

    procedure forgotPasswordtForExtenalApplicants(email: Text[100]; password: Text[100]; salt: Text[100]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            externalApplicants.Password := password;
            externalApplicants.Salt := salt;
            externalApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error';

        end
    end;

    procedure createIctRequest(empNo: Text; description: Text[2048]; region: Code[50]; tdepatrment: Code[100]; tcategory: Code[100]) status: Text
    var
        Body: Text[250];
        SMTP: Codeunit Mail;
        Email2: Text[250];
        CInfo: Record "Company Information";
        Category1: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
        SetUp: Record "ICT Helpdesk Global Parameters";
        Email: Text[250];
        empName: Text[250];
        ictMapping: Record "ICT Officers Category Mapping";
    begin
        Employee.Reset;
        Employee.SetRange("No.", empNo);
        if Employee.FindSet then begin

            helpdesk.Init;
            helpdesk."Job No." := '';
            helpdesk."Employee No" := empNo;
            helpdesk.Validate("Employee No");
            helpdesk."Requesting Officer" := UserId;
            helpdesk."Description of the issue" := description;
            //helpdesk."Issue Category Department" := tdepatrment;
            UserSetup."Portal User" := true;
            // helpdesk.Validate("Issue Category Department");
            helpdesk."ICT Issue Category" := tcategory;

            helpdesk."Request Date" := Today();

            helpdesk."Request Time" := Time;

            helpdesk."Global Dimension 1 Code" := region;
            // helpdesk.Validate("Global Dimension 1 Code");
            helpdesk.Status := helpdesk.Status::Assigned;
            // Ass
            ictMapping.Reset();
            ictMapping.SetRange("Help Desk Category", tcategory);
            if ictMapping.Findset(true) then begin
                helpdesk."Assigned to" := ictMapping.UserName;
            end;
            if helpdesk.Insert(true) then begin
                // helpdesk.Validate("Employee No");
                // helpdesk.Validate("Global Dimension 1 Code");
                // MESSAGE(FORMAT( helpdesk));
                // hdesk.SetRange("Employee No", empNo);
                // if hdesk.FindLast then begin
                //     CInfo.Get;


                //     SetUp.Get();
                //     Email2 := CInfo."Administrator Email";
                //     Email := SetUp."ICT Email";
                //     Body := '<br>Kindly login to the ERP System and attend to the ICT Issue No. ' + hdesk."Job No." + ' from ' + Employee."First Name" + ' ' + Employee."Last Name" + '.' + '</br>';
                //     Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                //     Body := Body + ' ' + 'ERP AUTOMATIC MAILS';

                //     SMTP.CreateMessage(Email, '', '', 'ICT Heldesk Notification', Body, true, true);

                //     //  SMTP.Send();
                //     Message('ICT Issue notification sent successfully.');
                //     Employee.Reset;
                //     Employee.SetRange("No.", empNo);
                //     if Employee.Find('-') then begin
                //         Email := Employee."E-Mail";
                //         empName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";

                //         Email2 := CInfo."Administrator Email";
                //         Body := '<br>Your issue has been received by ICT department Issue No. ' + hdesk."Job No." + ' from ' + empName + '.' + '</br>';
                //         Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                //         Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                //         SMTP.CreateMessage(Email, '', '', 'ICT Heldesk Notification', Body, true, true);
                //         Message(Email);
                //         //SMTP.Send();
                //         Message('ICT Issue notification sent successfully.');

                //         status := 'success*Your request sent successfully*' + helpdesk."Job No.";
                //     end


                // end
                status := 'success*Your request sent successfully*' + helpdesk."Job No.";

            end
        end

        else begin
            status := 'error*Employee does not exist';
        end
    end;

    procedure ProvideIctfeedback(appNo: Text; description: Text[250]) status: Text
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", appNo);
        if helpdesk.FindSet then begin
            helpdesk."Requester Feedback" := description;
            helpdesk.Status := helpdesk.Status::Closed;
            if helpdesk.Modify(true) then begin
                status := 'success*Request successfully updated';
            end


        end

        else begin
            status := 'error*Job No does not exist';
        end
    end;

    procedure updateIctRequest(appNo: Text; description: Text[2048]) status: Text
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", appNo);
        if helpdesk.FindSet then begin
            helpdesk."Description of the issue" := description;
            helpdesk."Request Date" := Today();
            helpdesk."Request Time" := Time;
            if helpdesk.Modify(true) then begin
                status := 'success*Request successfully updated';
            end


        end

        else begin
            status := 'error*Job No does not exist';
        end
    end;

    procedure applyexternalJob(jobId: Text[20]; surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; religion: Text[50]; idNumber: Text[50]; phoneNo: Text[30]; email: Text[50]; ethinc: Text[30]; postalAddress: Text[50]; postalAddressCode: Text[50]; city: Text[50]; "expected salary": Decimal; registrationDetails: Text[250]) status: Text
    begin
        JobApplicants.Reset;
        JobApplicants.SetRange("Job Applied For", jobId);
        JobApplicants.SetRange("ID Number", idNumber);
        JobApplicants.SetRange("Application Status", JobApplicants."application status"::Submitted);

        if JobApplicants.FindSet then begin
            status := 'error*You seem to have applied for this position.Please try again';

        end
        else begin
            externalApplicants.Reset;
            externalApplicants.SetRange(Email, email);
            if externalApplicants.FindSet then begin
            end else begin

                JobApplicants.Init;
                JobApplicants."Application No" := '';
                JobApplicants."Job Applied For" := jobId;

                JobApplicants."First Name" := externalApplicants.FirstName;
                JobApplicants."Middle Name" := lastname;
                JobApplicants."Last Name" := surname;
                JobApplicants.Initials := title;
                JobApplicants."Date Applied" := Today();
                JobApplicants."Date Of Birth" := DOB;
                JobApplicants.Gender := gender;
                JobApplicants.Disabled := disabled;
                JobApplicants."Disability Details" := disabilityDetails;
                JobApplicants.County := county;
                JobApplicants.Citizenship := nationality;
                JobApplicants."Marital Status" := maritalStatus;
                JobApplicants.Religion := religion;
                JobApplicants."ID Number" := idNumber;
                JobApplicants."Ethnic Origin" := ethinc;
                JobApplicants."E-Mail" := email;
                JobApplicants."Cell Phone Number" := phoneNo;
                JobApplicants."Details of Disability regist" := registrationDetails;

                JobApplicants."Postal Address" := postalAddress;
                JobApplicants."Post Code" := postalAddressCode;
                JobApplicants.City := city;
                JobApplicants."Expected Salary" := "expected salary";

                if JobApplicants.Insert(true) then begin
                    jpa.Reset;
                    jpa.SetRange("ID Number", idNumber);
                    jpa.SetRange("Job Applied For", jobId);
                    if jpa.FindLast then begin
                        status := jpa."Application No";
                    end

                end
                else begin
                    status := 'error*an error occured during the process of insertion';
                end;



            end




        end;
    end;

    procedure getItemsByLocation(location: Text[100]; category: Text[100]) status: Text
    var
        Loc: Text[100];
    begin
        status := '';
        item.Reset;
        item.SetFilter("Item Category Code", category);
        item.SetFilter("Location Filter", location);
        if item.FindSet then begin
            repeat
                item.CalcFields("Location Code", Inventory);
                status += item."No." + '*';
            until item.Next = 0;
        end
    end;

    procedure getItemDescByLocation(location: Text[100]; category: Text[100]) status: Text
    var
        Loc: Text[100];
    begin
        status := '';
        item.Reset;
        item.SetFilter("Item Category Code", category);
        item.SetFilter("Location Filter", location);
        //item.SETFILTER(Inventory,'>%1',0);
        item.SetRange(Blocked, false);

        if item.FindSet then begin
            repeat
                item.CalcFields("Location Code", Inventory);
                status += item."No." + '_' + item.Description + '*';
            until item.Next = 0;
        end
    end;


    procedure AssignHelpdeskRequest(jobNo: Text[100]; assignee: Text[100]) status: Text
    var
        // ObjNotify: Codeunit "Insurance Notifications";
        SMTP: Codeunit Mail;
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            UserSetup.Reset;
            UserSetup.SetRange("User ID", assignee);
            if UserSetup.FindSet then begin
                helpdesk."Assigned To" := assignee;
                helpdesk.Validate("Assigned To");
                helpdesk."Assigned Date" := Today();
                helpdesk."Assigned Time" := Time;
                helpdesk.Status := helpdesk.Status::Assigned;
                helpdesk."Assigned To EmpNo" := UserSetup."Employee No.";


                if helpdesk.Modify(true) then begin
                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if Employee.Get(helpdesk."Employee No") then
                        Recipient := Employee."E-Mail";
                    Subject := 'ISSUE ASSIGNED' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been assigned to ' + '  ' + assignee;
                    SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                    //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(helpdesk."Assigned To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ASSIGNED' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been assigned to you';
                    SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);
                    //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);



                    status := 'success*Request assigned successfully';
                end


            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end
    end;

    procedure EscalatedHelpdeskRequest(jobNo: Text[100]; assignee: Text[100]; description: Text[300]) status: Text
    var
        // ObjNotify: Codeunit "Insurance Notifications";
        SMTP: Codeunit Mail;
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            UserSetup.Reset;
            UserSetup.SetRange("User ID", assignee);

            if UserSetup.FindSet then begin
                helpdesk."Escalated To" := assignee;
                helpdesk."Escalated Date" := Today();
                helpdesk."Escalated Time" := Time;
                helpdesk.Status := helpdesk.Status::Escalated;
                helpdesk."Escalated By" := helpdesk."Assigned To";
                helpdesk."Ascalation Details" := description;
                helpdesk."Escalated To EmpNo" := UserSetup."Employee No.";
                if helpdesk.Modify(true) then begin
                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if Employee.Get(helpdesk."Employee No") then
                        Recipient := Employee."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + helpdesk."Escalated To";
                    SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                    //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(helpdesk."Escalated To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been escalatd to you by' + ' ' + helpdesk."Assigned To";
                    SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                    //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                    status := 'success*Request assigned successfully';


                end




            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end
    end;

    procedure NotifySupplyChain(Employ: code[40]) Response: Boolean;
    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        Email2: Text;
        ProcOff: Record Employee;
        Body: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        Response := false;
        CompanyInfo.Get;
        Email2 := CompanyInfo."Administrator Email";
        ProcOff.Reset;
        ProcOff.SetRange(ProcOff."No.", Employ);
        if ProcOff.Find('-') then begin
            Body := 'You have been assigned a procurement Requisition. Kindly login for your Actions.';
            EmailMessage.Create(ProcOff."Company E-Mail", 'Purchase Requisition Assignment', Body);
            if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then
                Response := true;
            //Message('Notified Successfully');
        end else
            Response := false;

    end;

    procedure UpdateBidCodes(Document: Code[30]; MemberNo: code[30]; BidCode: code[40])
    var
        myInt: Integer;
        BidCommitees: Record "Bid Opening Tender Committee";
    //IFSCommitteMembers: Record "Bid Opening Tender Committee";
    begin
        BidCommitees.Reset();
        BidCommitees.SetRange("Document No.", Document);
        BidCommitees.SetRange("Member No.", MemberNo);
        if BidCommitees.FindFirst() then begin
            // if BidCommitees.passcode <> BidCode then
            //     error('BID Code miss-match');

            // if BidCommitees."Nominated Bid Opening" = BidCommitees."nominated bid opening"::"Member 1" then begin
            //     if BidCommitees."Opening Person 1" <> BidCode then
            //         error('BID Code miss-match');
            // end else
            //     if BidCommitees."Nominated Bid Opening" = BidCommitees."nominated bid opening"::"Member 2 " then begin
            //         if BidCommitees."Opening Person 2" <> BidCode then
            //             Error('BID Code miss-match');
            //     end else
            //         if BidCommitees."Nominated Bid Opening" = BidCommitees."nominated bid opening"::"Member 3" then begin
            //             if BidCommitees."Opening Person 3" <> BidCode then
            //                 Error('BID Code miss-match');
            //         end else
            //             if BidCommitees."Nominated Bid Opening" = BidCommitees."nominated bid opening"::"Member 4" then begin
            //                 if BidCommitees."Opening Person 4" <> BidCode then
            //                     Error('BID Code miss-match');
            //             end else
            //                 if BidCommitees."Nominated Bid Opening" = BidCommitees."nominated bid opening"::"Member 5" then begin
            //                     if BidCommitees."Opening Person 5" <> BidCode then
            //                         Error('BID Code miss-match');
            //                 end;

            BidCommitees."Member Code" := BidCode;
            BidCommitees.Modify();
        end;

    end;

    procedure CreateInvitedBidders(DocNo: Code[40]; VendorN: Code[40]; Category: code[50])
    var
        myInt: Integer;
        InvitedBidders: Record "Standard Vendor Purchase Code";
    begin
        InvitedBidders.Reset();
        InvitedBidders.Init();
        InvitedBidders.Code := DocNo;
        InvitedBidders."Vendor No." := VendorN;
        InvitedBidders.Validate(InvitedBidders."Vendor No.");
        InvitedBidders.Category := Category;
        InvitedBidders.Insert();
    end;

    procedure ModifyRFQ(DocNo: Code[20]; SEndadate: Date; SEndaTime: Time; RFQDuration: Code[30]; BidTemplate: code[30]; BidOPCom: Code[40]; BidEvaCom: Code[30]; BidOpeningDate: date; BidOpTime: time)
    var
        myInt: Integer;
        Standard: Record "Standard Purchase Code";
    begin
        Standard.Reset();
        Standard.SetRange(Code, DocNo);
        if Standard.FindFirst() then begin
            Standard."Submission End Date" := SEndadate;
            Standard."Submission End Time" := SEndaTime;
            Standard."Bid Opening Date" := BidOpeningDate;
            Standard."Bid Opening Time" := BidOpTime;
            Standard."Tender Validity Duration" := RFQDuration;
            Standard.Validate(Standard."Tender Validity Duration");
            Standard."Bid Opening Committe" := BidOPCom;
            Standard.Validate(Standard."Bid Opening Committe");
            Standard."Bid Evaluation Committe" := BidEvaCom;
            Standard.Validate(Standard."Bid Evaluation Committe");
            Standard."Bid Scoring Template" := BidTemplate;
            Standard.Validate(Standard."Bid Scoring Template");
            Standard.Modify();
        end;
    end;

    procedure CreateInvitationNotice(DocumentNo: code[20]; Display: Boolean; UserI: text[100]): Code[20]
    var
        myInt: Integer;
        Procurement: Codeunit "Procurement Processing";
        Purchase: Record "Purchase Header";
        IFSCodePortal: Code[20];
    begin
        Purchase.Reset();
        Purchase.SetRange("No.", DocumentNo);
        if Purchase.FindFirst() then
            IFSCodePortal := Procurement.CreateInvitationNotice(Purchase, Display, UserI);
        exit(IFSCodePortal);
    end;

    procedure ModifyPurchaseHeader(DocumentNo: code[30];
    Solicitation: Code[100];
    NoticePurchase: Option;
    PPmethod: Option;
    Preference: Code[20];
    Alternatives: Text[100])
    var
        myInt: Integer;
        puruchaseheader: Record "Purchase Header";
    begin
        puruchaseheader.Reset();
        puruchaseheader.SetRange("No.", DocumentNo);
        if puruchaseheader.FindFirst() then begin
            puruchaseheader."PP Solicitation Type" := Solicitation;
            puruchaseheader."PP  Invitation Notice Type" := NoticePurchase;
            puruchaseheader."PP Procurement Method" := PPmethod;
            puruchaseheader."PP Preference/Reservation Code" := Preference;
            puruchaseheader."Other Procurement Methods" := Alternatives;
            puruchaseheader.Modify();
        end;
    end;



    procedure ResolveHelpdeskRequest(jobNo: Text[100]; description: Text[300]) status: Text
    var
        // ObjNotify: Codeunit "Insurance Notifications";
        SMTP: Codeunit Mail;
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            helpdesk."Action Taken" := description;
            helpdesk."Attended By" := helpdesk."Assigned To";
            helpdesk."Attended Date" := Today;
            helpdesk.Status := helpdesk.Status::Resolved;
            if helpdesk.Modify(true) then begin
                ObjComInfo.Get;
                SenderEmailAddress := ObjComInfo."Administrator Email";
                SenderName := COMPANYNAME;
                if Employee.Get(helpdesk."Employee No") then
                    Recipient := Employee."E-Mail";
                Subject := 'ISSUE CLOSURE' + ' ' + jobNo;
                Body := 'Please note that the issue on the subject above has been resolved by' + '  ' + helpdesk."Attended By"
                 + ' ' + 'Kindly login to the system and confirm.Request will be closed after 24 hours.';
                SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                //  ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                status := 'success*Request has been resolved successfully ';
            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end
    end;

    procedure ReopenHelpdeskRequest(jobNo: Text[50]; description: Text[250]) status: Text
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            helpdesk.Status := helpdesk.Status::Pending;
            helpdesk.Reopened := true;
            //helpdesk."Reopened By":=helpdesk.;
            helpdesk."Assigned To" := '';
            helpdesk."Attended By" := '';
            helpdesk."Assigned Date" := 0D;
            helpdesk."Assigned Time" := 0T;
            helpdesk."Attended by Name" := '';
            helpdesk."Attended Date" := 0D;
            helpdesk."Attended Time" := 0T;
            helpdesk.Modify;

            status := 'success*Request successfully reopened';
        end
        else begin
            status := 'error*job no does not exist';
        end
    end;

    procedure addEmploymentHistoryForExternalApplcants(startDate: Date; endDate: Date; company: Text[150]; designation: Text[150]; JobGrade: Text[100]; email: Text[50]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground.Institution := company;
            applicantBackground."From Date" := startDate;
            applicantBackground."To Date" := endDate;
            applicantBackground."Job Title" := designation;
            applicantBackground.Grade := JobGrade;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::Employment;

            applicantBackground.Insert(true);

            status := 'success';

        end
        else
            status := 'error*You seem to have not applied for this position';
        begin
        end
    end;

    procedure addAcademicQualificationsForExternalApplcants(email: Text; institution: Text[200]; awardAttainment: Text[150]; specialization: Text[150]; gradeAttained: Text[150]; FromDate: Date; ToDate: Date) status: Text
    begin

        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground.Institution := institution;
            applicantBackground."From Date" := FromDate;
            applicantBackground."To Date" := ToDate;
            applicantBackground.Attainment := awardAttainment;
            applicantBackground.Specialization := specialization;
            applicantBackground.Grade := gradeAttained;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::Education;
            applicantBackground.Insert(true);

            status := 'success';


        end
        else begin
            status := 'error*That email does not exist';

        end
    end;

    procedure addProffessionalQualificationsForExternalApplcants(email: Text[100]; institution: Text[150]; awardAttainment: Text[100]; specialization: Text[100]; gradeAttained: Text[100]; FromDate: Date; ToDate: Date) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground.Institution := institution;
            applicantBackground."From Date" := FromDate;
            applicantBackground."To Date" := ToDate;
            applicantBackground.Attainment := awardAttainment;
            applicantBackground.Specialization := specialization;
            applicantBackground.Grade := gradeAttained;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::"Professional Qualification";
            applicantBackground.Insert(true);

            status := 'success';
        end
        else begin
            status := 'You seem to have applied for this position';

        end
    end;

    procedure addTrainingAttendedForExternalApplcants(fromDate: Date; ToDate: Date; Institution: Text[150]; courseName: Text[150]; email: Text[50]; attained: Text[100]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground."From Date" := fromDate;
            applicantBackground."To Date" := ToDate;
            applicantBackground.Institution := Institution;
            applicantBackground."Course Name" := courseName;
            applicantBackground.Attainment := attained;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::Training;
            applicantBackground.Insert(true);
            status := 'success';


        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addProfessionalBodyForExternalApplcants(email: Text[50]; pBody: Text[100]; mNo: Text[100]; mType: Text[50]; rDate: Date) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground."Application No" := '';
            applicantBackground."From Date" := 0D;
            applicantBackground.Institution := pBody;
            applicantBackground."Membership Type" := mType;
            applicantBackground."Membership No" := mNo;
            applicantBackground."Date of renewal" := rDate;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::"Professional Body";
            applicantBackground.Insert(true);

            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure createRefereeForExternalApplcants(email: Text[50]; name: Text[100]; occupation: Text[50]; address: Text[50]; postCode: Text[50]; phone: Text[30]; applicantEmail: Text[100]; knownPeriod: Text[50]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, applicantEmail);
        if externalApplicants.FindSet then begin
            applicantReferee.Init;
            applicantReferee.Names := name;
            applicantReferee.Occupation := occupation;
            applicantReferee.Address := address;
            applicantReferee."Post Code" := postCode;
            applicantReferee."Telephone No" := phone;
            applicantReferee.RefereeEmail := email;
            applicantReferee."Period Known" := knownPeriod;
            applicantReferee."E-Mail" := applicantEmail;
            applicantReferee.Insert(true);
            status := 'success';

        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure deleteAcademicLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProfessionalLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteTrainingLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProffessionalBodyLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteEmploymentHistoryLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteRefereeLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin

        applicantReferee.Reset;
        applicantReferee.SetRange(Code, id);
        applicantReferee.SetRange("E-Mail", email);
        if (applicantReferee.FindSet) then begin
            applicantReferee.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure applyOnline(email: Text[100]; jobId: Text[30]) status: Text
    begin
        jobApplication.Reset;
        jobApplication.SetRange(jobApplication.Email, email);
        jobApplication.SetRange(jobApplication."Job Id", jobId);
        jobApplication.SetRange(jobApplication."Application Status", jobApplication."application status"::Submitted);
        if jobApplication.FindSet then begin
            status := 'error*You seem to have applied for this position.Please try another position.';
        end
        else begin
            externalApplicants.Reset;
            externalApplicants.SetRange(Email, email);
            if externalApplicants.FindSet then begin
                jobApplication.Init;
                jobApplication."Application No" := '';
                jobApplication."First Name" := externalApplicants.FirstName;
                jobApplication."Middle Name" := externalApplicants."Middle Name";
                jobApplication.Surname := externalApplicants.LastName;
                jobApplication.Gender := externalApplicants.Gender;
                jobApplication."Marital Status" := externalApplicants."Marital Status";
                jobApplication."Date of Birth" := externalApplicants."Date Of Birth";
                jobApplication."Job Id" := jobId;
                jobApplication."Ethnic Origin" := externalApplicants."Ethnic Origin";
                jobApplication."ID/Passport" := externalApplicants."ID Number";
                jobApplication."Home Phone No." := externalApplicants."Cell Phone Number";
                jobApplication."Postal Address" := externalApplicants."Postal Address";
                jobApplication."Postal Code." := externalApplicants."Post Code";
                jobApplication.County := externalApplicants.County;
                jobApplication."Application Date" := Today;
                jobApplication.Email := email;

                if jobApplication.Insert(true) then begin
                    jobApp.Reset;
                    jobApp.SetRange(Email, email);
                    jobApp.SetRange("Job Id", jobId);
                    jobApp.SetRange("Application Status", jobApp."application status"::Submitted);
                    if jobApp.FindLast then begin
                        status := jobApp."Application No";

                    end




                end
                else begin
                    status := 'error*An unknown errror occured';
                end
                //jobApplication.Salutation:= externalApplicants.Initials;

            end



        end
    end;

    procedure addFavouriteJobs(email: Text[100]; jobId: Text[30]; jobDesc: Text[100]) Status: Text
    begin
        favouriteJob.Reset;
        favouriteJob.SetRange(Email, email);
        favouriteJob.SetRange("Job Id", jobId);
        if favouriteJob.FindSet then begin
            Status := 'error*This job seem to be in your favourite list.Please try another job.';
        end
        else begin
            favouriteJob.Init;
            favouriteJob.Email := email;
            favouriteJob."Job Description" := jobDesc;
            favouriteJob."Job Id" := jobId;
            favouriteJob.Insert(true);
            Status := 'success*Job successfully saved.';

        end
    end;

    procedure deleteFavouriteJobs(id: Integer; JobId: Text[100]) status: Text
    begin
        favouriteJob.Reset;
        favouriteJob.SetRange(Id, id);
        favouriteJob.SetRange("Job Id", JobId);
        if favouriteJob.FindSet then begin
            favouriteJob.Delete(true);
            status := 'success*Job successfully deleted.';
        end
        else begin
            status := 'error';
        end
    end;

    // procedure addImprestSharepointLinks(imprestno: Code[50]; filename: Text; sharepointlink: Text) status: Text
    // var
    //     imprest: Record "Imprest Memo";
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID" = 0 then begin
    //         RecordLink.URL1 := sharepointlink;
    //         RecordLink.Description := filename;
    //         RecordLink.Type := RecordLink.Type::Link;
    //         RecordLink.Company := COMPANYNAME;
    //         RecordLink."User ID" := UserId;
    //         RecordLink.Created := CreateDatetime(Today, Time);
    //         ImprestMemo.Reset;
    //         ImprestMemo."No." := imprestno;
    //         if ImprestMemo.Find('=') then
    //             RecordIDNumber := ImprestMemo.RecordId;
    //         RecordLink."Record ID" := RecordIDNumber;
    //         if RecordLink.Insert(true) then begin
    //             status := 'success*Link successfully created';
    //         end else begin
    //             status := 'error*An error occured during the process of creating link';
    //         end
    //     end;
    // end;

    procedure addStoreRequsitionSharepointLinks(storerequsitionnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        PurchaseHeader: Record "Purchase Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            PurchaseHeader.Reset;
            //PurchaseHeader."No.":=storerequsitionnumber;
            PurchaseHeader.SetRange("No.", storerequsitionnumber);
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            if PurchaseHeader.FindSet then
                RecordLink."Record ID" := PurchaseHeader.RecordId;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    // procedure addStaffClaimSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID" = 0 then begin
    //         RecordLink.URL1 := sharepointlink;
    //         RecordLink.Description := filename;
    //         RecordLink.Type := RecordLink.Type::Link;
    //         RecordLink.Company := COMPANYNAME;
    //         RecordLink."User ID" := UserId;
    //         RecordLink.Created := CreateDatetime(Today, Time);
    //         staffclaim.Reset;
    //         staffclaim."No." := staffclaimnumber;
    //         if staffclaim.Find('=') then
    //             RecordIDNumber := staffclaim.RecordId;
    //         RecordLink."Record ID" := RecordIDNumber;
    //         if RecordLink.Insert(true) then begin
    //             status := 'success*Link successfully created';
    //         end else begin
    //             status := 'error*An error occured during the process of creating link';
    //         end
    //     end;
    // end;

    procedure addLeaveSharepointLinks(leaveno: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        leaveapplication: Record "HR Leave Application";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            leaveapplication.Reset;
            leaveapplication."Application Code" := leaveno;
            if leaveapplication.Find('=') then
                RecordIDNumber := leaveapplication.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    // procedure addImprestSurrenderSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID" = 0 then begin
    //         RecordLink.URL1 := sharepointlink;
    //         RecordLink.Description := filename;
    //         RecordLink.Type := RecordLink.Type::Link;
    //         RecordLink.Company := COMPANYNAME;
    //         RecordLink."User ID" := UserId;
    //         RecordLink.Created := CreateDatetime(Today, Time);
    //         Payments.Reset;
    //         Payments."No." := staffclaimnumber;
    //         if Payments.Find('=') then
    //             RecordIDNumber := Payments.RecordId;
    //         RecordLink."Record ID" := RecordIDNumber;
    //         if RecordLink.Insert(true) then begin
    //             status := 'success*Link successfully created';
    //         end else begin
    //             status := 'error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;

    procedure addPurchaseRequisitionSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            PurchaseHeader.Reset;
            //PurchaseHeader."No.":=staffclaimnumber;
            PurchaseHeader.SetRange("No.", staffclaimnumber);
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            if PurchaseHeader.FindSet then
                RecordIDNumber := PurchaseHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure addFleetRequisitionSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
        TransportRequisition: Record "Transport Requisition";
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            TransportRequisition.Reset;
            TransportRequisition."Transport Requisition No" := staffclaimnumber;
            if TransportRequisition.Find('=') then
                RecordIDNumber := TransportRequisition.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure addTrainingRequisitionSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
        TransportRequisition: Record "Transport Requisition";
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            TrainingRequisition.Reset;
            TrainingRequisition.Code := staffclaimnumber;
            if TrainingRequisition.Find('=') then
                RecordIDNumber := TrainingRequisition.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    // procedure addPettyCashSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID" = 0 then begin
    //         RecordLink.URL1 := sharepointlink;
    //         RecordLink.Description := filename;
    //         RecordLink.Type := RecordLink.Type::Link;
    //         RecordLink.Company := COMPANYNAME;
    //         RecordLink."User ID" := UserId;
    //         RecordLink.Created := CreateDatetime(Today, Time);
    //         Payments.Reset;
    //         Payments."No." := staffclaimnumber;
    //         if Payments.Find('=') then
    //             RecordIDNumber := Payments.RecordId;
    //         RecordLink."Record ID" := RecordIDNumber;
    //         if RecordLink.Insert(true) then begin
    //             status := 'success*Link successfully created';
    //         end else begin
    //             status := 'error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;

    // procedure addPettyCashSurrenderSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID" = 0 then begin
    //         RecordLink.URL1 := sharepointlink;
    //         RecordLink.Description := filename;
    //         RecordLink.Type := RecordLink.Type::Link;
    //         RecordLink.Company := COMPANYNAME;
    //         RecordLink."User ID" := UserId;
    //         RecordLink.Created := CreateDatetime(Today, Time);
    //         Payments.Reset;
    //         Payments."No." := staffclaimnumber;
    //         //Payments."Payment Type"::"Petty Cash Surrender";
    //         if Payments.Find('=') then
    //             RecordIDNumber := Payments.RecordId;
    //         RecordLink."Record ID" := RecordIDNumber;
    //         if RecordLink.Insert(true) then begin
    //             status := 'success*Link successfully created';
    //         end else begin
    //             status := 'error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;

    // procedure FnCreateStaffClaimApprovalRequests(employeeno: Code[10]; staffClaimNo: Code[10]) status: Text
    // var
    //     Employee: Record Employee;
    //     Payments: Record payments;
    //     PortalApprovalEntry: Record "PortalApproval Entry";
    // begin

    //     Employee.Reset;
    //     Employee.SetRange("No.", employeeno);
    //     if Employee.FindSet then begin
    //         varTableNumber := 57000;
    //         if Employee.Supervisor = '' then begin
    //             status := 'danger*Direct Approver is Missing, Kindly Contact HR';
    //         end else begin
    //             PortalApprovalEntry.Reset;
    //             PortalApprovalEntry.SetRange("Document No.", staffClaimNo);
    //             if PortalApprovalEntry.FindSet then begin
    //                 PortalApprovalEntry."Document No." := staffClaimNo;
    //                 PortalApprovalEntry."Document Type" := PortalApprovalEntry."document type"::"staff Claims";
    //                 PortalApprovalEntry."Table ID" := varTableNumber;
    //                 PortalApprovalEntry."Date-Time Sent for Approval" := CurrentDatetime;
    //                 PortalApprovalEntry."Employee Number" := employeeno;
    //                 PortalApprovalEntry.Validate("Employee Number");
    //                 PortalApprovalEntry."Approver ID" := Employee."Supervisor";
    //                 PortalApprovalEntry."Sender ID" := employeeno;
    //                 PortalApprovalEntry."Approval Code" := staffClaimNo;
    //                 PortalApprovalEntry.Status := PortalApprovalEntry.Status::Open;
    //                 if PortalApprovalEntry.Modify(true) then begin
    //                     status := 'success*The Approval Request was successfully Modified';
    //                 end;
    //             end else begin
    //                 PortalApprovalEntry.Init;
    //                 PortalApprovalEntry."Document No." := staffClaimNo;
    //                 PortalApprovalEntry."Document Type" := PortalApprovalEntry."document type"::"staff Claims";
    //                 PortalApprovalEntry."Table ID" := varTableNumber;
    //                 PortalApprovalEntry."Date-Time Sent for Approval" := CurrentDatetime;
    //                 PortalApprovalEntry."Last Date-Time Modified" := CurrentDatetime;
    //                 PortalApprovalEntry."Employee Number" := employeeno;
    //                 PortalApprovalEntry.Validate("Employee Number");
    //                 PortalApprovalEntry."Approver ID" := Employee."Supervisor";
    //                 PortalApprovalEntry."Sender ID" := employeeno;
    //                 PortalApprovalEntry."Approval Code" := staffClaimNo;
    //                 PortalApprovalEntry.Status := PortalApprovalEntry.Status::Open;
    //                 if PortalApprovalEntry.Insert(true) then begin
    //                     status := 'success*The Approval Request was successfully Created';
    //                 end else begin
    //                     status := 'danger*The Staff Claim Number does not exist';
    //                 end;
    //             end;
    //         end;
    //     end;
    // end;

    procedure SuggestLinesFromWorksRequisitionTemplate(docNo: Text[30]; templateId: Text[30]) status: Text
    var
        PurchLines: Record "Purchase Line";
        RequisitionTempLine: Record "BoQ Template Line1";
        RequisitionTempheader: Record "Purchase Requisition Template";
        LineNo: Integer;
    begin

        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("No.", docNo);
        if PurchaseHeader.FindSet then begin
            if PurchaseHeader."PRN Type" <> PurchaseHeader."prn type"::"Project Works" then
                Error('Purchase Requisition Must be Project Works');

            PurchLines.Reset;
            PurchLines.SetRange("Document No.", docNo);
            PurchLines.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            if PurchLines.FindSet then
                PurchLines.DeleteAll;

            //Transfer the Requisition Template Lines to PRN Lines
            RequisitionTempLine.Reset;
            RequisitionTempLine.SetRange("BoQ Template ID", templateId);
            if RequisitionTempLine.FindSet then begin
                repeat
                    PurchLines.Init;
                    PurchLines."Document Type" := PurchaseHeader."Document Type";
                    PurchLines."Document No." := PurchaseHeader."No.";
                    PurchLines."Line No." := PurchLines.Count + 1;
                    PurchLines.Type := RequisitionTempLine.Type;
                    PurchLines."No." := RequisitionTempLine."No.";
                    PurchLines.Description := RequisitionTempLine.Description;
                    PurchLines.Quantity := RequisitionTempLine.Quantity;
                    PurchLines."Unit of Measure Code" := RequisitionTempLine."Unit of Measure Code";
                    //PurchLines.Amount:=RequisitionTempLine."Amount Excl. VAT";
                    PurchLines."Direct Unit Cost" := RequisitionTempLine."Amount Excl. VAT";
                    PurchLines."Shortcut Dimension 1 Code" := RequisitionTempLine."Shortcut Dimension 1 Code";
                    PurchLines."Shortcut Dimension 2 Code" := RequisitionTempLine."Shortcut Dimension 2 Code";
                    PurchLines."Variant Code" := RequisitionTempLine."Variant Code";
                    PurchLines."Dimension Set ID" := RequisitionTempLine."Dimension Set ID";
                    PurchLines."Item Category Code" := RequisitionTempLine."Item Category Code";
                    PurchLines.Insert(true);
                    LineNo := LineNo + 10000;
                until RequisitionTempLine.Next = 0;
                status := 'success*Lines successfully inserted';

            end


        end
    end;

    // procedure SuggestPersonnelEquipmentSpecification(docNo: Text[30]; ProjectTemplateId: Text[30]; WorkTemplateId: Text[30]) status: Text
    // var
    //     PurchLines: Record "Purchase Line";
    //     RequisitionTempLine: Record "BoQ Template Line1";
    //     RequisitionTempheader: Record "Purchase Requisition Template";
    //     PRNPersonnelSpecification: Record "PRN Personnel Specification";
    //     PRNPersonnelqualification: Record "PRN Personnel Qualification";
    //     PRNPersonnelExperience: Record "PRN Personnel Experience";
    //     PRNEquipmentsSpecification: Record "PRN Equipment Specification";
    //     ProjStaffTemplate: Record "Project Staff Template Line";
    //     ProjStaffExperienceTemplate: Record "Project Staff Template Experie";
    //     ProjStaffQualificationTemplate: Record "Project Staff Template Qualifi";
    //     WorksEquipemntSpecification: Record "Works Equipment Template Line";
    //     Purch: Record "Purchase Header";
    // begin
    //     Purch.Reset;
    //     Purch.SetRange("No.", docNo);
    //     if Purch.FindSet then begin
    //         if Purch."PRN Type" <> Purch."prn type"::"Project Works" then
    //             Error('Purchase Requisition Must be Project Works');

    //         PRNPersonnelSpecification.Reset;
    //         PRNPersonnelSpecification.SetRange("Document No.", docNo);
    //         PRNPersonnelSpecification.SetRange("Document Type", PRNPersonnelSpecification."document type"::"Purchase Requisition");
    //         if PRNPersonnelSpecification.FindSet then
    //             PRNPersonnelSpecification.DeleteAll;

    //         //Transfer the Requisition Template Lines to PRN Lines
    //         ProjStaffTemplate.Reset;
    //         ProjStaffTemplate.SetRange("Key Staff Template ID", ProjectTemplateId);
    //         if ProjStaffTemplate.FindSet then begin
    //             // PRNPersonnelSpecification.
    //             repeat
    //                 //Creation of PRN Personnel Specification details
    //                 PRNPersonnelSpecification.Init;
    //                 PRNPersonnelSpecification."Document Type" := Purch."Document Type";
    //                 PRNPersonnelSpecification."Document No." := Purch."No.";
    //                 PRNPersonnelSpecification."Staff Role Code" := ProjStaffTemplate."Project Role Code";
    //                 PRNPersonnelSpecification."Title/Designation Description" := ProjStaffTemplate.Description;
    //                 PRNPersonnelSpecification."Staff Category" := ProjStaffTemplate."Staff Category";
    //                 PRNPersonnelSpecification."Min No. of Recomm Staff" := ProjStaffTemplate."Min No. of Recomm Staff";
    //                 PRNPersonnelSpecification.Insert(true);

    //             until ProjStaffTemplate.Next = 0;

    //         end;
    //         PRNPersonnelExperience.SetRange("Document No.", docNo);
    //         PRNPersonnelExperience.SetRange("Document Type", PRNPersonnelExperience."document type"::"Purchase Requisition");
    //         if PRNPersonnelExperience.FindSet then
    //             PRNPersonnelExperience.DeleteAll;
    //         //Creation of PRN Personnel Experience details
    //         ProjStaffExperienceTemplate.Reset;
    //         ProjStaffExperienceTemplate.SetRange("Key Staff Template ID", ProjectTemplateId);
    //         if ProjStaffExperienceTemplate.FindSet then begin
    //             repeat
    //                 PRNPersonnelExperience.Init;
    //                 PRNPersonnelExperience."Document Type" := Purch."Document Type";
    //                 PRNPersonnelExperience."Document No." := Purch."No.";
    //                 PRNPersonnelExperience."Staff Role Code" := ProjStaffExperienceTemplate."Project Role Code";
    //                 PRNPersonnelExperience."Experience Category" := ProjStaffExperienceTemplate."Experience Category";
    //                 PRNPersonnelExperience."Entry No" := ProjStaffExperienceTemplate."Entry No";
    //                 PRNPersonnelExperience."Minimum Years of Experience" := ProjStaffExperienceTemplate."Minimum Years of Experience";
    //                 PRNPersonnelExperience."Minimum Experience Req" := ProjStaffExperienceTemplate."Minimum Experience Req";
    //                 PRNPersonnelExperience.Insert(true);

    //             until ProjStaffExperienceTemplate.Next = 0;
    //         end;

    //         //Creation of PRN Personnel Qualification details

    //         PRNPersonnelqualification.SetRange("Document No.", docNo);
    //         PRNPersonnelqualification.SetRange("Document Type", PRNPersonnelqualification."document type"::"Purchase Requisition");
    //         if PRNPersonnelqualification.FindSet then
    //             PRNPersonnelqualification.DeleteAll;

    //         ProjStaffQualificationTemplate.Reset;
    //         ProjStaffQualificationTemplate.SetRange("Key Staff Template ID", ProjectTemplateId);
    //         if ProjStaffQualificationTemplate.FindSet then begin
    //             repeat
    //                 PRNPersonnelqualification.Init;
    //                 PRNPersonnelqualification."Document Type" := Purch."Document Type";
    //                 PRNPersonnelqualification."Document No." := Purch."No.";
    //                 PRNPersonnelqualification."Staff Role Code" := ProjStaffQualificationTemplate."Project Role Code";
    //                 PRNPersonnelqualification."Entry No" := ProjStaffQualificationTemplate."Entry No";
    //                 PRNPersonnelqualification."Qualification Category" := ProjStaffQualificationTemplate."Qualification Category";
    //                 PRNPersonnelqualification."Minimum Qualification Req" := ProjStaffQualificationTemplate."Minimum Qualification Req";
    //                 PRNPersonnelqualification.Insert(true);

    //             until ProjStaffQualificationTemplate.Next = 0;
    //         end;

    //         //Creation of PRN Equipment Specifications
    //         PRNEquipmentsSpecification.SetRange("Document No.", docNo);
    //         PRNEquipmentsSpecification.SetRange("Document Type", PRNEquipmentsSpecification."document type"::"Purchase Requisition");
    //         if PRNEquipmentsSpecification.FindSet then
    //             PRNEquipmentsSpecification.DeleteAll;
    //         WorksEquipemntSpecification.Reset;
    //         WorksEquipemntSpecification.SetRange("Equipment Template ID", WorkTemplateId);
    //         if WorksEquipemntSpecification.FindSet then begin
    //             repeat
    //                 PRNEquipmentsSpecification.Init;
    //                 PRNEquipmentsSpecification."Document Type" := Purch."Document Type";
    //                 PRNEquipmentsSpecification."Document No." := Purch."No.";
    //                 PRNEquipmentsSpecification."Equipment Type" := WorksEquipemntSpecification."Equipment Type";
    //                 PRNEquipmentsSpecification.Category := WorksEquipemntSpecification.Category;
    //                 PRNEquipmentsSpecification.Description := WorksEquipemntSpecification.Description;
    //                 PRNEquipmentsSpecification."Minimum Required Qty" := WorksEquipemntSpecification."Minimum Required Qty";
    //                 PRNEquipmentsSpecification.Insert(true);
    //             until WorksEquipemntSpecification.Next = 0;

    //         end;
    //         status := 'success*Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly' + Purch."No.";

    //     end
    //     /*IF Purch."PRN Type"<>Purch."PRN Type"::"Project Works" THEN
    //       ERROR('Purchase Requisition Must be Project Works');

    //     //Transfer the Requisition Template Lines to PRN Lines
    //     ProjStaffTemplate.RESET;
    //     ProjStaffTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     IF ProjStaffTemplate.FINDSET THEN BEGIN
    //       REPEAT
    //         //Creation of PRN Personnel Specification details
    //         PRNPersonnelSpecification.INIT;
    //         PRNPersonnelSpecification."Document Type":=Purch."Document Type";
    //         PRNPersonnelSpecification."Document No.":=Purch."No.";
    //         PRNPersonnelSpecification."Staff Role Code":=ProjStaffTemplate."Project Role Code";
    //         PRNPersonnelSpecification."Title/Designation Description":=ProjStaffTemplate.Description;
    //         PRNPersonnelSpecification."Staff Category":=ProjStaffTemplate."Staff Category";
    //         PRNPersonnelSpecification."Min No. of Recomm Staff":=ProjStaffTemplate."Min No. of Recomm Staff";
    //         PRNPersonnelSpecification.INSERT(TRUE);

    //        UNTIL ProjStaffTemplate.NEXT=0;

    //     END;

    //     //Creation of PRN Personnel Experience details
    //     ProjStaffExperienceTemplate.RESET;
    //     ProjStaffExperienceTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     IF ProjStaffExperienceTemplate.FINDSET THEN BEGIN
    //       REPEAT
    //         PRNPersonnelExperience.INIT;
    //         PRNPersonnelExperience."Document Type":=Purch."Document Type";
    //         PRNPersonnelExperience."Document No.":=Purch."No.";
    //         PRNPersonnelExperience."Staff Role Code":=ProjStaffExperienceTemplate."Project Role Code";
    //         PRNPersonnelExperience."Experience Category":=ProjStaffExperienceTemplate."Experience Category";
    //         PRNPersonnelExperience."Entry No":=ProjStaffExperienceTemplate."Entry No";
    //         PRNPersonnelExperience."Minimum Years of Experience":=ProjStaffExperienceTemplate."Minimum Years of Experience";
    //         PRNPersonnelExperience."Minimum Experience Req":=ProjStaffExperienceTemplate."Minimum Experience Req";
    //         PRNPersonnelExperience.INSERT(TRUE);

    //         UNTIL ProjStaffExperienceTemplate.NEXT=0;
    //       END;

    //     //Creation of PRN Personnel Qualification details

    //     ProjStaffQualificationTemplate.RESET;
    //     ProjStaffQualificationTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     IF ProjStaffQualificationTemplate.FINDSET THEN BEGIN
    //       REPEAT
    //         PRNPersonnelqualification.INIT;
    //         PRNPersonnelqualification."Document Type":=Purch."Document Type";
    //         PRNPersonnelqualification."Document No.":=Purch."No.";
    //         PRNPersonnelqualification."Staff Role Code":=ProjStaffQualificationTemplate."Project Role Code";
    //         PRNPersonnelqualification."Entry No":=ProjStaffQualificationTemplate."Entry No";
    //         PRNPersonnelqualification."Qualification Category":=ProjStaffQualificationTemplate."Qualification Category";
    //         PRNPersonnelqualification."Minimum Qualification Req":=ProjStaffQualificationTemplate."Minimum Qualification Req";
    //         PRNPersonnelqualification.INSERT(TRUE);

    //         UNTIL ProjStaffQualificationTemplate.NEXT=0;
    //       END;

    //     //Creation of PRN Equipment Specifications
    //     WorksEquipemntSpecification.RESET;
    //     WorksEquipemntSpecification.SETRANGE("Equipment Template ID",Purch."Works Equipment Template ID");
    //     IF WorksEquipemntSpecification.FINDSET THEN BEGIN
    //       REPEAT
    //         PRNEquipmentsSpecification.INIT;
    //         PRNEquipmentsSpecification."Document Type":=Purch."Document Type";
    //         PRNEquipmentsSpecification."Document No.":=Purch."No.";
    //         PRNEquipmentsSpecification."Equipment Type":=WorksEquipemntSpecification."Equipment Type";
    //         PRNEquipmentsSpecification.Category:=WorksEquipemntSpecification.Category;
    //         PRNEquipmentsSpecification.Description:=WorksEquipemntSpecification.Description;
    //         PRNEquipmentsSpecification."Minimum Required Qty":=WorksEquipemntSpecification."Minimum Required Qty";
    //         PRNEquipmentsSpecification.INSERT(TRUE);
    //         UNTIL WorksEquipemntSpecification.NEXT=0;

    //       END;
    //     MESSAGE('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly',Purch."No.");
    //     */

    // end;

    procedure suggestLinesFromRequisitionTemplate(docNo: Text[30]; templateId: Text[30]) status: Text
    var
        PurchLines: Record "Purchase Line";
        RequisitionTempLine: Record "BoQ Template Line1";
        RequisitionTempheader: Record "Purchase Requisition Template";
        LineNo: Integer;
    begin

        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("No.", docNo);
        if PurchaseHeader.FindSet then begin
            if PurchaseHeader."PRN Type" <> PurchaseHeader."prn type"::Standard then
                Error('Purchase Requisition Must be Standard');

            PurchLines.Reset;
            PurchLines.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            PurchLines.SetRange("Document No.", docNo);

            if PurchLines.FindSet then
                PurchLines.DeleteAll;

            //Transfer the Requisition Template Lines to PRN Lines
            RequisitionTempLine.Reset;
            RequisitionTempLine.SetRange("BoQ Template ID", templateId);
            if RequisitionTempLine.FindSet then begin
                repeat
                    PurchLines.Init;
                    PurchLines."Document Type" := PurchaseHeader."Document Type";
                    PurchLines."Document No." := PurchaseHeader."No.";
                    PurchLines."Line No." := PurchLines.Count + 1;
                    PurchLines.Type := RequisitionTempLine.Type;
                    PurchLines."No." := RequisitionTempLine."No.";
                    PurchLines.Description := RequisitionTempLine.Description;
                    PurchLines.Quantity := RequisitionTempLine.Quantity;
                    PurchLines."Unit of Measure Code" := RequisitionTempLine."Unit of Measure Code";
                    //PurchLines.Amount:=RequisitionTempLine."Amount Excl. VAT";
                    PurchLines."Direct Unit Cost" := RequisitionTempLine."Amount Excl. VAT";
                    PurchLines."Shortcut Dimension 1 Code" := RequisitionTempLine."Shortcut Dimension 1 Code";
                    PurchLines."Shortcut Dimension 2 Code" := RequisitionTempLine."Shortcut Dimension 2 Code";
                    PurchLines."Variant Code" := RequisitionTempLine."Variant Code";
                    PurchLines."Dimension Set ID" := RequisitionTempLine."Dimension Set ID";
                    PurchLines."Item Category Code" := RequisitionTempLine."Item Category Code";
                    PurchLines.Insert(true);
                    LineNo := LineNo + 10000;
                until RequisitionTempLine.Next = 0;
                status := 'success*Lines successfully inserted';

            end


        end
    end;

    procedure updateRequisitionLines(id: Integer; reqNo: Text[30]; amount: Decimal; qty: Decimal) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.Reset;
        PurchaseLine.SetRange("Line No.", id);
        PurchaseLine.SetRange("Document No.", reqNo);
        PurchaseLine.SetRange("Document Type", PurchaseLine."document type"::"Purchase Requisition");
        if PurchaseLine.FindSet then begin
            PurchaseLine.Amount := amount;
            PurchaseLine."Qty. Requested" := qty;
            PurchaseLine.Modify;
            status := 'success*Rows successfully updated';

        end
        else begin
            status := 'error*an error occured';
        end
    end;

    procedure deletePurchaseRequisitionLines(id: Integer; reqNo: Text[30]) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.Reset;
        PurchaseLine.SetRange("Line No.", id);
        PurchaseLine.SetRange("Document No.", reqNo);
        PurchaseLine.SetRange("Document Type", PurchaseLine."document type"::"Purchase Requisition");
        if PurchaseLine.FindSet then begin

            PurchaseLine.Delete;
            status := 'success*Rows successfully deleted';

        end
        else begin
            status := 'error*an error occured';
        end



        /*
        IF Purch."PRN Type"<>Purch."PRN Type"::"Project Works" THEN
          ERROR('Purchase Requisition Must be Project Works');

        //Transfer the Requisition Template Lines to PRN Lines
        ProjStaffTemplate.RESET;
        ProjStaffTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
        IF ProjStaffTemplate.FINDSET THEN BEGIN
          REPEAT
            //Creation of PRN Personnel Specification details
            PRNPersonnelSpecification.INIT;
            PRNPersonnelSpecification."Document Type":=Purch."Document Type";
            PRNPersonnelSpecification."Document No.":=Purch."No.";
            PRNPersonnelSpecification."Staff Role Code":=ProjStaffTemplate."Project Role Code";
            PRNPersonnelSpecification."Title/Designation Description":=ProjStaffTemplate.Description;
            PRNPersonnelSpecification."Staff Category":=ProjStaffTemplate."Staff Category";
            PRNPersonnelSpecification."Min No. of Recomm Staff":=ProjStaffTemplate."Min No. of Recomm Staff";
            PRNPersonnelSpecification.INSERT(TRUE);

           UNTIL ProjStaffTemplate.NEXT=0;

        END;

        //Creation of PRN Personnel Experience details
        ProjStaffExperienceTemplate.RESET;
        ProjStaffExperienceTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
        IF ProjStaffExperienceTemplate.FINDSET THEN BEGIN
          REPEAT
            PRNPersonnelExperience.INIT;
            PRNPersonnelExperience."Document Type":=Purch."Document Type";
            PRNPersonnelExperience."Document No.":=Purch."No.";
            PRNPersonnelExperience."Staff Role Code":=ProjStaffExperienceTemplate."Project Role Code";
            PRNPersonnelExperience."Experience Category":=ProjStaffExperienceTemplate."Experience Category";
            PRNPersonnelExperience."Entry No":=ProjStaffExperienceTemplate."Entry No";
            PRNPersonnelExperience."Minimum Years of Experience":=ProjStaffExperienceTemplate."Minimum Years of Experience";
            PRNPersonnelExperience."Minimum Experience Req":=ProjStaffExperienceTemplate."Minimum Experience Req";
            PRNPersonnelExperience.INSERT(TRUE);

            UNTIL ProjStaffExperienceTemplate.NEXT=0;
          END;

        //Creation of PRN Personnel Qualification details

        ProjStaffQualificationTemplate.RESET;
        ProjStaffQualificationTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
        IF ProjStaffQualificationTemplate.FINDSET THEN BEGIN
          REPEAT
            PRNPersonnelqualification.INIT;
            PRNPersonnelqualification."Document Type":=Purch."Document Type";
            PRNPersonnelqualification."Document No.":=Purch."No.";
            PRNPersonnelqualification."Staff Role Code":=ProjStaffQualificationTemplate."Project Role Code";
            PRNPersonnelqualification."Entry No":=ProjStaffQualificationTemplate."Entry No";
            PRNPersonnelqualification."Qualification Category":=ProjStaffQualificationTemplate."Qualification Category";
            PRNPersonnelqualification."Minimum Qualification Req":=ProjStaffQualificationTemplate."Minimum Qualification Req";
            PRNPersonnelqualification.INSERT(TRUE);

            UNTIL ProjStaffQualificationTemplate.NEXT=0;
          END;

        //Creation of PRN Equipment Specifications
        WorksEquipemntSpecification.RESET;
        WorksEquipemntSpecification.SETRANGE("Equipment Template ID",Purch."Works Equipment Template ID");
        IF WorksEquipemntSpecification.FINDSET THEN BEGIN
          REPEAT
            PRNEquipmentsSpecification.INIT;
            PRNEquipmentsSpecification."Document Type":=Purch."Document Type";
            PRNEquipmentsSpecification."Document No.":=Purch."No.";
            PRNEquipmentsSpecification."Equipment Type":=WorksEquipemntSpecification."Equipment Type";
            PRNEquipmentsSpecification.Category:=WorksEquipemntSpecification.Category;
            PRNEquipmentsSpecification.Description:=WorksEquipemntSpecification.Description;
            PRNEquipmentsSpecification."Minimum Required Qty":=WorksEquipemntSpecification."Minimum Required Qty";
            PRNEquipmentsSpecification.INSERT(TRUE);
            UNTIL WorksEquipemntSpecification.NEXT=0;

          END;
        MESSAGE('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly',Purch."No.");

        */

    end;

    procedure addProjectDetails(docNo: Text[100]; ProjectTemplateId: Text[100]; WorkTemplate: Text[100]; RoadCode: Text[100]; LinkName: Text[100]; Constituency: Text[100]; WorkLength: Decimal) status: Text
    begin
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("No.", docNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
        if PurchaseHeader.FindSet then begin
            PurchaseHeader."Project Staffing Template ID" := ProjectTemplateId;
            PurchaseHeader."Works Equipment Template ID" := WorkTemplate;
            PurchaseHeader."Road Code" := RoadCode;
            PurchaseHeader.Validate("Road Code");
            PurchaseHeader."Link Name" := LinkName;
            PurchaseHeader."Works Length (Km)" := WorkLength;
            PurchaseHeader.Consitituency := Constituency;
            PurchaseHeader.Modify;
            status := 'success*Project details successfully saved';
        end
        else begin
            status := 'error*Document with No %1, does not exist' + docNo;
        end
    end;


    procedure SuggestPRNPersonnel_equipmentSpecification(Purch: Record "Purchase Header")
    var
        PurchLines: Record "Purchase Line";
        RequisitionTempLine: Record "BoQ Template Line1";
        RequisitionTempheader: Record "Purchase Requisition Template";
        PRNPersonnelSpecification: Record "PRN Personnel Specification";
        PRNPersonnelqualification: Record "PRN Personnel Qualification";
        PRNPersonnelExperience: Record "PRN Personnel Experience";
        PRNEquipmentsSpecification: Record "PRN Equipment Specification";
        ProjStaffTemplate: Record "Project Staff Template Line";
        ProjStaffExperienceTemplate: Record "Project Staff Template Experie";
        ProjStaffQualificationTemplate: Record "Project Staff Template Qualifi";
    // WorksEquipemntSpecification: Record "Works Equipment Template Line";
    begin
        Purch.TestField("PRN Type");
        if Purch."PRN Type" <> Purch."prn type"::"Project Works" then
            Error('Purchase Requisition Must be Project Works');

        //Transfer the Requisition Template Lines to PRN Lines
        ProjStaffTemplate.Reset;
        ProjStaffTemplate.SetRange("Key Staff Template ID", Purch."Project Staffing Template ID");
        if ProjStaffTemplate.FindSet then begin
            repeat
                //Creation of PRN Personnel Specification details
                PRNPersonnelSpecification.Init;
                PRNPersonnelSpecification."Document Type" := Purch."Document Type";
                PRNPersonnelSpecification."Document No." := Purch."No.";
                PRNPersonnelSpecification."Staff Role Code" := ProjStaffTemplate."Project Role Code";
                PRNPersonnelSpecification."Title/Designation Description" := ProjStaffTemplate.Description;
                PRNPersonnelSpecification."Staff Category" := ProjStaffTemplate."Staff Category";
                PRNPersonnelSpecification."Min No. of Recomm Staff" := ProjStaffTemplate."Min No. of Recomm Staff";
                PRNPersonnelSpecification.Insert(true);

            until ProjStaffTemplate.Next = 0;

        end;

        //Creation of PRN Personnel Experience details
        ProjStaffExperienceTemplate.Reset;
        ProjStaffExperienceTemplate.SetRange("Key Staff Template ID", Purch."Project Staffing Template ID");
        if ProjStaffExperienceTemplate.FindSet then begin
            repeat
                PRNPersonnelExperience.Init;
                PRNPersonnelExperience."Document Type" := Purch."Document Type";
                PRNPersonnelExperience."Document No." := Purch."No.";
                PRNPersonnelExperience."Staff Role Code" := ProjStaffExperienceTemplate."Project Role Code";
                PRNPersonnelExperience."Experience Category" := ProjStaffExperienceTemplate."Experience Category";
                PRNPersonnelExperience."Entry No" := ProjStaffExperienceTemplate."Entry No";
                PRNPersonnelExperience."Minimum Years of Experience" := ProjStaffExperienceTemplate."Minimum Years of Experience";
                PRNPersonnelExperience."Minimum Experience Req" := ProjStaffExperienceTemplate."Minimum Experience Req";
                PRNPersonnelExperience.Insert(true);

            until ProjStaffExperienceTemplate.Next = 0;
        end;

        //Creation of PRN Personnel Qualification details

        ProjStaffQualificationTemplate.Reset;
        ProjStaffQualificationTemplate.SetRange("Key Staff Template ID", Purch."Project Staffing Template ID");
        if ProjStaffQualificationTemplate.FindSet then begin
            repeat
                PRNPersonnelqualification.Init;
                PRNPersonnelqualification."Document Type" := Purch."Document Type";
                PRNPersonnelqualification."Document No." := Purch."No.";
                PRNPersonnelqualification."Staff Role Code" := ProjStaffQualificationTemplate."Project Role Code";
                PRNPersonnelqualification."Entry No" := ProjStaffQualificationTemplate."Entry No";
                PRNPersonnelqualification."Qualification Category" := ProjStaffQualificationTemplate."Qualification Category";
                PRNPersonnelqualification."Minimum Qualification Req" := ProjStaffQualificationTemplate."Minimum Qualification Req";
                PRNPersonnelqualification.Insert(true);

            until ProjStaffQualificationTemplate.Next = 0;
        end;

        //Creation of PRN Equipment Specifications
        // WorksEquipemntSpecification.Reset;
        // WorksEquipemntSpecification.SetRange("Equipment Template ID", Purch."Works Equipment Template ID");
        // if WorksEquipemntSpecification.FindSet then begin
        //     repeat
        //         PRNEquipmentsSpecification.Init;
        //         PRNEquipmentsSpecification."Document Type" := Purch."Document Type";
        //         PRNEquipmentsSpecification."Document No." := Purch."No.";
        //         PRNEquipmentsSpecification."Equipment Type" := WorksEquipemntSpecification."Equipment Type";
        //         PRNEquipmentsSpecification.Category := WorksEquipemntSpecification.Category;
        //         PRNEquipmentsSpecification.Description := WorksEquipemntSpecification.Description;
        //         PRNEquipmentsSpecification."Minimum Required Qty" := WorksEquipemntSpecification."Minimum Required Qty";
        //         PRNEquipmentsSpecification.Insert(true);
        //     until WorksEquipemntSpecification.Next = 0;

        // end;
        Message('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly', Purch."No.");
    end;

    procedure updatePersonnelSpecifications(id: Integer; docNo: Text[50]; noOfStafff: Integer; desc: Text[200]) status: Text
    var
        PersonnelSpecification: Record "PRN Personnel Specification";
    begin
        PersonnelSpecification.Reset;
        PersonnelSpecification.SetRange("Entry No", id);
        PersonnelSpecification.SetRange("Document No.", docNo);
        PersonnelSpecification.SetRange("Title/Designation Description", desc);
        if PersonnelSpecification.FindSet then begin
            PersonnelSpecification."Min No. of Recomm Staff" := noOfStafff;
            PersonnelSpecification.Modify;
            status := 'success*Record successfully updated';
        end else begin
            status := 'error*Record with document number' + docNo + ' does not exist';
        end
    end;

    procedure deletePersonnelSpecifications(id: Integer; docNo: Text[50]; desc: Text) status: Text
    var
        PersonnelSpecification: Record "PRN Personnel Specification";
    begin
        PersonnelSpecification.Reset;
        PersonnelSpecification.SetRange("Entry No", id);
        PersonnelSpecification.SetRange("Document No.", docNo);
        PersonnelSpecification.SetRange("Title/Designation Description", desc);
        if PersonnelSpecification.FindSet then begin
            PersonnelSpecification.Delete;
            status := 'success*Record successfully deleted';
        end else begin
            status := 'error*Record with document number' + docNo + ' does not exist';
        end
    end;

    procedure updateEquipmentSpecifications(id: Integer; docNo: Text[50]; qty: Decimal) status: Text
    var
        EquipmentSpecification: Record "PRN Equipment Specification";
    begin
        EquipmentSpecification.Reset;
        // EquipmentSpecification.SetRange(Id, id);
        EquipmentSpecification.SetRange("Document No.", docNo);
        if EquipmentSpecification.FindSet then begin
            EquipmentSpecification."Minimum Required Qty" := qty;
            EquipmentSpecification.Modify;
            status := 'success*Record successfully updated';
        end else begin
            status := 'error*Record with document number' + docNo + ' does not exist';
        end
    end;

    procedure deleteEquipmentSpecifications(id: Integer; docNo: Text[50]) status: Text
    var
        EquipmentSpecification: Record "PRN Equipment Specification";
    begin
        EquipmentSpecification.Reset;
        // EquipmentSpecification.SetRange(Id, id);
        EquipmentSpecification.SetRange("Document No.", docNo);
        if EquipmentSpecification.FindSet then begin
            EquipmentSpecification.Delete;
            status := 'success*Record successfully deleted';
        end else begin
            status := 'error*Record with document number' + docNo + ' does not exist';
        end
    end;

    procedure AddVehicleMaintenanceRequestDetails(employeeNo: Code[10]; region: Code[10]; registrationnumber: Code[10]; odometerreading: Decimal; servicetype: Integer; description: Text; fundingcode: Code[10]; projectnumber: Code[10]; budgetline: Code[10]; maintenancecost: Code[10]; vendornumber: Code[10]; tservicecode: Text) status: Text
    var
        FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
        FleetManagementSetup: Record "Fleet Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        FleetManagementSetup.Get;
        FuelMaintenanceRequisition.Init;
        FuelMaintenanceRequisition."Requisition No" := NoSeriesManagement.GetNextNo(FleetManagementSetup."Maintenance Request", Today, true);
        FuelMaintenanceRequisition."Vehicle Reg No" := registrationnumber;
        FuelMaintenanceRequisition."Shortcut Dimension 1 Code" := region;
        FuelMaintenanceRequisition.Validate("Vehicle Reg No");
        FuelMaintenanceRequisition."Odometer Reading" := odometerreading;
        // FuelMaintenanceRequisition."Service Type" := servicetype;
        FuelMaintenanceRequisition."Shortcut Dimension 2 Code" := fundingcode;
        FuelMaintenanceRequisition."Service Code" := tservicecode;
        FuelMaintenanceRequisition.Validate("Service Code");
        FuelMaintenanceRequisition."Employee No" := employeeNo;
        FuelMaintenanceRequisition.Description := description;
        FuelMaintenanceRequisition."Project Name" := projectnumber;
        //FuelMaintenanceRequisition."Task Number":=budgetline;
        //FuelMaintenanceRequisition.M:=maintenancecost;
        FuelMaintenanceRequisition."Vendor(Dealer)" := vendornumber;
        FuelMaintenanceRequisition.Validate("Vendor(Dealer)");
        FuelMaintenanceRequisition.Type := FuelMaintenanceRequisition.Type::Maintenance;
        if FuelMaintenanceRequisition.Insert(true) then begin
            status := 'success*The Vehicle Maintenance Request was successfully submitted*' + FuelMaintenanceRequisition."Requisition No";
        end else begin
            status := 'danger*The Vehicle Maintenance Request could not be submitted';
        end;
        exit(status);
    end;

    procedure SendVehicleMaintenancetforApproval(docNo: Code[100]) status: Text
    var
        FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        FuelMaintenanceRequisition1: Record "Fuel & Maintenance Requisition";
    begin
        FuelMaintenanceRequisition.Reset;
        FuelMaintenanceRequisition.SetRange("Requisition No", docNo);
        FuelMaintenanceRequisition.SetRange(Status, FuelMaintenanceRequisition.Status::Open);
        if FuelMaintenanceRequisition.FindSet then begin

            leaveApp := FuelMaintenanceRequisition;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            IF FuelMaintenanceRequisition.GET(FuelMaintenanceRequisition."Requisition No") THEN BEGIN
                IF FuelMaintenanceRequisition.Status = FuelMaintenanceRequisition.Status::Open THEN BEGIN
                    status := 'warning*Your Fuel Maintenance Requisition could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your Fuel Maintenance Requisition was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

        end else begin
            status := 'error* Either New File Movement Number does not exist or it is no longer open';
        end
    end;

    procedure AddFuelRequisitionDetails(employeeNo: Code[10]; fueltype: Integer; vendornumber: Code[10]; litersrequested: Decimal; vehicleregistration: Code[10]; mileage: Decimal; pricerperLiter: Decimal; driverCode: Code[50]) status: Text
    var
        FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
        FleetManagementSetup: Record "Fleet Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        FleetManagementSetup.Get;
        FuelMaintenanceRequisition.Init;
        FuelMaintenanceRequisition.Type := FuelMaintenanceRequisition.Type::Fuel;
        FuelMaintenanceRequisition."Requisition No" := NoSeriesManagement.GetNextNo(FleetManagementSetup."Fuel Register", Today, true);
        FuelMaintenanceRequisition."Vehicle Reg No" := vehicleregistration;
        FuelMaintenanceRequisition.Validate("Vehicle Reg No");
        FuelMaintenanceRequisition."Vendor(Dealer)" := vendornumber;
        FuelMaintenanceRequisition.Validate("Vendor(Dealer)");
        FuelMaintenanceRequisition."Type of Fuel" := fueltype;
        FuelMaintenanceRequisition."Employee No" := employeeNo;
        // FuelMaintenanceRequisition.Mileage := mileage;
        FuelMaintenanceRequisition."Litres of Oil" := litersrequested;
        FuelMaintenanceRequisition."Price/Litre" := pricerperLiter;
        FuelMaintenanceRequisition.Driver := driverCode;
        FuelMaintenanceRequisition.Validate(Driver);
        if FuelMaintenanceRequisition.Insert(true) then begin
            status := 'success*The Vehicle Fuel  Request was successfully submitted*' + FuelMaintenanceRequisition."Requisition No";
        end else begin
            status := 'danger*The Vehicle Fuel Request could not be submitted*' + FuelMaintenanceRequisition."Requisition No";
        end;
    end;

    procedure SendVehicleRequisitionApproval(imprestNumber: Code[20]) status: Text
    begin
    end;

    procedure CloseDriverOpenTrips(requisitionNumber: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin

        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNumber);
        TransportRequisition.SetRange(TransportRequisition.Status, TransportRequisition.Status::Approved);
        if TransportRequisition.FindSet then begin
            TransportRequisition.Status := TransportRequisition.Status::Closed;
            //  TransportRequisition.Selected := false;
            if TransportRequisition.Modify(true) then begin
                status := 'success*The Trip has been successully closed';
            end else begin
                status := 'danger*The Trip was not successully closed';
            end;
        end;
    end;

    procedure AddDriverAllocations(requisitionNumber: Code[50]; driverCode: Code[50]; dateofTrip: Date; vehiclenumber: Code[50]; noofdays: Integer) status: Text
    var
        VehicleDriversAllocation: Record "Vehicle Driver Allocation";
        TransportRequisition: Record "Transport Requisition";
        NonKeRRADriverAllocation: Record "Non-KeRRA Driver Allocation";
    begin

        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNumber);
        if TransportRequisition.FindSet then begin
            VehicleDriversAllocation.Init;
            VehicleDriversAllocation."Requisition Number" := requisitionNumber;
            VehicleDriversAllocation."Driver Code" := driverCode;
            VehicleDriversAllocation.Validate("Driver Code");
            VehicleDriversAllocation."Vehicle Registration No" := vehiclenumber;
            VehicleDriversAllocation.Validate("Vehicle Registration No");
            if VehicleDriversAllocation.Insert(true) then begin
                status := 'success*The Driver has been allocated Successfully';
            end else begin
                status := 'danger*The Driver could not be allocated Successfully';
            end;
        end;
    end;

    procedure AddNonKeRRADriverAllocations(requisitionNumber: Code[50]; driverIDNumber: Code[50]; driverName: Code[50]; phonenumber: Code[10]; emailaddress: Code[50]; drivinglicenseNumber: Code[50]) status: Text
    var
        VehicleDriversAllocation: Record "Vehicle Driver Allocation";
        TransportRequisition: Record "Transport Requisition";
        NonKeRRADriverAllocation: Record "Non-KeRRA Driver Allocation";
    begin
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNumber);
        if TransportRequisition.FindSet then begin
            NonKeRRADriverAllocation.Init;
            NonKeRRADriverAllocation."Req No" := requisitionNumber;
            NonKeRRADriverAllocation."ID No" := driverIDNumber;
            NonKeRRADriverAllocation."Driver Name" := driverName;
            NonKeRRADriverAllocation."Phone Number" := phonenumber;
            NonKeRRADriverAllocation."Email Address" := emailaddress;
            NonKeRRADriverAllocation."DL Number" := drivinglicenseNumber;
            if NonKeRRADriverAllocation.Insert(true) then begin
                status := 'success*The Driver has been allocated Successfully';
            end else begin
                status := 'danger*The Driver could not be allocated Successfully';
            end;
        end;
    end;

    procedure SendFuelRequisitionforApproval(docNo: Code[100]) status: Text
    var
        FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        FuelMaintenanceRequisition1: Record "Fuel & Maintenance Requisition";
    begin
        FuelMaintenanceRequisition.Reset;
        FuelMaintenanceRequisition.SetRange("Requisition No", docNo);
        FuelMaintenanceRequisition.SetRange(Status, FuelMaintenanceRequisition.Status::Open);
        if FuelMaintenanceRequisition.FindSet then begin
            //if ApprovalsMgmt.CheckFuelReqApprovalsWorkflowEnabled(FuelMaintenanceRequisition) then
            //   ApprovalsMgmt.OnSendFuelReqForApproval(FuelMaintenanceRequisition);
            FuelMaintenanceRequisition1.Reset;
            FuelMaintenanceRequisition1.SetRange("Requisition No", docNo);
            if FuelMaintenanceRequisition1.FindSet then begin
                if FuelMaintenanceRequisition1.Status = FuelMaintenanceRequisition1.Status::"Pending Approval" then begin
                    status := 'success*The Vehicle Maintenance request was successfully sent for approval';
                end else begin
                    status := 'success*The Vehicle Maintenance request was already approved on is no longer Pending Approval';
                end;
            end else begin
                status := 'danger* New Vehicle Maintenance request with the given number does not exist';
            end;
        end else begin
            status := 'error* Either New File Movement Number does not exist or it is no longer open';
        end
    end;

    procedure ProcessDriverAllocations(docNumber: Code[50]) status: Text
    var
        VehicleDrivers: Record "Vehicle Drivers";
        VehicleDriversAll: Record "Vehicle Driver Allocation";
        VehicleDrivers11: Record "Vehicle Drivers";
        TransportRequisition: Record "Transport Requisition";
    begin
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", docNumber);
        if TransportRequisition.FindSet then begin
            VehicleDriversAll.Reset;
            VehicleDriversAll.SetRange(VehicleDriversAll."Requisition Number", docNumber);
            VehicleDriversAll.SetRange(VehicleDriversAll."Reassigned?", false);
            if VehicleDriversAll.Find('-') then begin
                repeat
                    if VehicleDriversAll."Vehicle Registration No" = '' then begin
                        status := 'danger*Please allocate vehicle to driver %1 before proceeding';
                    end else begin
                        if TransportRequisition."Approved Imprest Memo" <> '' then begin
                            // UpateDriverAllocationToImprestMemo(docNumber, TransportRequisition."Approved Imprest Memo");
                        end;
                    end;
                until VehicleDriversAll.Next = 0;
                // SendDriverEmailNotification(docNumber);
                status := 'success*The Driver Allocation details has been completed Successfully'
            end else begin
                status := 'danger*No Driver Available for this action'
            end;
        end;
    end;

    // procedure UpateDriverAllocationToImprestMemo(docNumber: Code[50]; ImprestNumber: Code[50]) status: Text
    // var
    //     FleetSetup: Record "Fleet Management Setup";
    //     ProjectMember1: Record "Project Members";
    //     ProjectMembers: Record "Project Members";
    //     ProjectMember2: Record "Project Members";
    //     DefaultDriver: Code[10];
    //     DriverAlloc: Record "Vehicle Driver Allocation";
    // begin

    //     if ImprestMemo.Get(docNumber) then begin
    //         FleetSetup.Get;
    //         FleetSetup.TestField("Default Fleet Driver");
    //         DefaultDriver := FleetSetup."Default Fleet Driver";
    //         DriverAlloc.Reset;
    //         DriverAlloc.SetRange("Requisition Number", docNumber);
    //         if DriverAlloc.FindSet then begin
    //             ProjectMember1.Reset;
    //             ProjectMember1.SetRange(ProjectMember1."Imprest Memo No.", docNumber);
    //             if ProjectMember1.FindFirst then begin
    //                 ProjectMembers.Init;
    //                 ProjectMembers."Imprest Memo No." := docNumber;
    //                 ProjectMembers."Work Type" := ProjectMember1."Work Type";
    //                 ProjectMembers.Validate("Work Type");
    //                 ProjectMembers.Type := ProjectMembers.Type::Person;
    //                 ProjectMembers."No." := DriverAlloc."Driver Code";
    //                 ProjectMembers.Validate("No.");
    //                 ProjectMembers."Time Period" := DriverAlloc."Number of Days";
    //                 ProjectMembers.Validate(ProjectMembers."Time Period");
    //                 ProjectMembers."Vote Item" := ProjectMember1."Vote Item";
    //                 ProjectMembers.Validate("Vote Item");
    //                 ProjectMembers."Type of Expense" := ProjectMember1."Type of Expense";
    //                 ProjectMembers.Validate("Type of Expense");
    //                 // ProjectMembers.Job := ProjectMember1.Job;
    //                 // ProjectMembers."Job  Task" := ProjectMember1."Job  Task";
    //                 // ProjectMembers.Validate(Job);
    //                 if not ProjectMembers.Insert(true) then
    //                     ProjectMembers.Modify(true);
    //             end;
    //             ProjectMember2.Reset;
    //             ProjectMember2.SetRange(ProjectMember2."Imprest Memo No.", docNumber);
    //             ProjectMember2.SetRange(ProjectMember2."No.", DefaultDriver);
    //             if ProjectMember2.FindSet then
    //                 ProjectMember2.Delete;

    //         end;
    //     end;
    // end;

    // procedure SendDriverEmailNotification(docNumber: Code[50]) status: Text
    // var
    //     VehicleDriverAllocation: Record "Vehicle Driver Allocation";
    //     TransportRequisition: Record "Transport Requisition";
    //     Emp: Record Employee;
    //     Header: Code[100];
    //     SMTPSetup: Record "Email Account";
    //     SMTPMail: Codeunit Mail;
    //     ObjCompany: Record "Company Information";
    //     SenderEmail: Text;
    //     SenderName: Text;
    //     Approved: Boolean;
    //     VehicleDrivers: Record "Vehicle Drivers";
    //     ImprestMemo: Record "Imprest Memo";
    //     ImprestMemo1: Record "Imprest Memo";
    //     ProjectMembers: Record "Project Members";
    //     ProjectMember1: Record "Project Members";
    //     VehicleDriversAll: Record "Vehicle Driver Allocation";
    //     VehicleDrivers11: Record "Vehicle Drivers";
    // begin
    //     VehicleDriverAllocation.Reset;
    //     VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Requisition Number", docNumber);
    //     VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Reassigned?", false);
    //     if VehicleDriverAllocation.Find('-') then begin
    //         repeat
    //             TransportRequisition.Get(docNumber);
    //             if Emp.Get(VehicleDriverAllocation."Driver Code") then begin
    //                 Header := 'TRAVEL TRIP NOTIFICATION ' + docNumber + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

    //                 if SMTPSetup.Get() then begin
    //                     // SenderEmail := SMTPSetup."Email Sender Address";
    //                     // SenderName := SMTPSetup."Email Sender Name";
    //                 end;
    //                 if Emp."E-Mail" <> '' then begin
    //                     //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',true);
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('Please note that you have been assigend as the driver to the above mentioned trip.');// for the month of January 2014');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
    //                     //SMTPMail.AddBodyline('<br>');
    //                     //SMTPMail.AddBodyline('Trip requested by : '+TransportRequisition."Employee Name");
    //                     //SMTPMail.AddBodyline('<br>');
    //                     //SMTPMail.AddBodyline('Trip From: '+TransportRequisition.Commencement+' To '+TransportRequisition.Destination+' on '+Format(TransportRequisition."Date of Trip")+' return date will be on '+Format(TransportRequisition."Trip End Date"));
    //                     //SMTPMail.AddBodyline('<br>');
    //                     //SMTPMail.AddBodyline('<br>');
    //                     //SMTPMail.AddBodyline('Vehicle Reg Number: '+VehicleDriverAllocation."Requisition Number" +' '+VehicleDriverAllocation."Vehicle Description");
    //                     //SMTPMail.AddBodyline('<br>');
    //                     //SMTPMail.AddBodyline('Kindly prepare adequately');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('Thanks & Regards');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline(SenderName);
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('<HR>');
    //                     //SMTPMail.AddBodyline('This is a system generated mail.');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HRKERRA.go.ke');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.Send;
    //                 end;
    //             end;
    //             if Emp.Get(TransportRequisition."Employee No") then begin
    //                 Header := 'TRAVEL TRIP NOTIFICATION ' + VehicleDriverAllocation."Requisition Number" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

    //                 if SMTPSetup.Get() then begin
    //                     // SenderEmail := SMTPSetup."Email Sender Address";
    //                     // SenderName := SMTPSetup."Email Sender Name";
    //                 end;
    //                 if Emp."E-Mail" <> '' then begin
    //                     //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',true);
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('Please note that you have been assigend driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
    //                     //SMTPMail.AddBodyline('<br>');
    //                     //SMTPMail.AddBodyline('Driver Name : '+VehicleDriverAllocation."Driver Name");
    //                     //SMTPMail.AddBodyline('<br>');
    //                     //SMTPMail.AddBodyline('Vehicle Reg Number: '+VehicleDriverAllocation."Registration Number" +' '+VehicleDriverAllocation."Vehicle Description");
    //                     //SMTPMail.AddBodyline('<br>');
    //                     VehicleDrivers11.Reset;
    //                     VehicleDrivers11.SetRange(VehicleDrivers11.Driver, VehicleDriverAllocation."Driver Code");
    //                     if VehicleDrivers11.FindSet then begin
    //                         //SMTPMail.AddBodyline('Driver Phone Number : '+VehicleDrivers11."Phone Number");
    //                         //SMTPMail.AddBodyline('<br>');
    //                     end;
    //                     //SMTPMail.AddBodyline('Trip From: '+TransportRequisition.Commencement+' To '+TransportRequisition.Destination+' on '+Format(TransportRequisition."Date of Trip"));
    //                     //SMTPMail.AddBodyline('<br>');
    //                     //SMTPMail.AddBodyline('<br>');
    //                     //SMTPMail.AddBodyline('Kindly prepare adequately');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('Thanks & Regards');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline(SenderName);
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('<HR>');
    //                     //SMTPMail.AddBodyline('This is a system generated mail.');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
    //                     //SMTPMail.AddBodyline('<br><br>');
    //                     //SMTPMail.Send;
    //                     Message('Mail sent to %1', Emp."E-Mail");
    //                 end;
    //                 //End email
    //             end;
    //         until VehicleDriverAllocation.Next = 0;
    //         status := 'success*Email notifications has been sent';
    //     end;
    // end;

    procedure generateFleetRequisition(transportRequisitionNo: Code[20]) status: Text
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";

        /*Employee.RESET;
        Employee.SETRANGE(Employee."No.", employeeNumber);
        IF Employee.FINDSET THEN BEGIN*/
        TransportRequisition.Reset;
        //ImprestMemo.SETRANGE(Requestor,employeeNumber);
        TransportRequisition.SetRange("Transport Requisition No", transportRequisitionNo);
        if TransportRequisition.FindSet then begin
            // if FILE.Exists(FILESPATH4 + transportRequisitionNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH4 + transportRequisitionNo + '.pdf');
            //     Report.SaveAsPdf(59018, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(59018, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The Fleet Requisition with the given number does not exist or your are not the requestor';
        end;
        /*END ELSE BEGIN
          status:='danger*The Employee with the give number does not exist';
          END;*/

    end;

    procedure reassignDriver(TransportNo: Code[10]; DriverCode: Code[10]; newTrip: Code[10]; date: Date) status: Text
    var
        TransportReq: Record "Transport Requisition";
    begin

        status := 'danger*The Customer could not be edited';
        TransportReq.Reset;
        TransportReq.SetRange("Transport Requisition No", TransportNo);
        if TransportReq.FindSet then begin
            TransportReq."Driver Allocated" := DriverCode;
            TransportReq.Validate("Driver Allocated");
            TransportReq."Transport Requisition No" := newTrip;
            TransportReq.Validate("Transport Requisition No");
            TransportReq."Date of Trip" := date;
            TransportReq.Validate("Date of Trip");

            if TransportReq.Modify(true) then begin
                status := 'success*The Customer was successfully edited';
            end else begin
                status := 'danger*The Customer could not be edited';
            end;
        end;
    end;

    procedure GenerateFuelRequisition(transportRequisitionNo: Code[20]) status: Text
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";

        /*Employee.RESET;
        Employee.SETRANGE(Employee."No.", employeeNumber);
        IF Employee.FINDSET THEN BEGIN*/
        TransportRequisition.Reset;
        //ImprestMemo.SETRANGE(Requestor,employeeNumber);
        TransportRequisition.SetRange("Transport Requisition No", transportRequisitionNo);
        if TransportRequisition.FindSet then begin
            // if FILE.Exists(FILESPATH4 + transportRequisitionNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH4 + transportRequisitionNo + '.pdf');
            //     Report.SaveAsPdf(59019, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(59019, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The Fleet Requisition with the given number does not exist or your are not the requestor';
        end;
        /*END ELSE BEGIN
          status:='danger*The Employee with the give number does not exist';
          END;*/

    end;

    procedure GenerateMaintenanceRequisition(transportRequisitionNo: Code[20]) status: Text
    begin

        /*Employee.RESET;
        Employee.SETRANGE(Employee."No.", employeeNumber);
        IF Employee.FINDSET THEN BEGIN*/
        TransportRequisition.Reset;
        //ImprestMemo.SETRANGE(Requestor,employeeNumber);
        TransportRequisition.SetRange("Transport Requisition No", transportRequisitionNo);
        if TransportRequisition.FindSet then begin
            // if FILE.Exists(FILESPATH4 + transportRequisitionNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH4 + transportRequisitionNo + '.pdf');
            //     Report.SaveAsPdf(59020, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(59020, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The Fleet Requisition with the given number does not exist or your are not the requestor';
        end;
        /*END ELSE BEGIN
          status:='danger*The Employee with the give number does not exist';
          END;*/

    end;

    procedure EscalatedHelpdeskRequestDynasoft(jobNo: Text[100]; assignee: Text[100]; description: Text[300]) status: Text
    var
        // ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SMTP: Codeunit Mail;
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        CompInfo: Record "Company Information";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        /*IF CONFIRM('Are you sure you want to escalate the ICT helpdesk issue?'+' '+"Job No.") =TRUE THEN
         BEGIN
          "Escalated By":=UPPERCASE(USERID);
          "Escalated Date":=TODAY;
          "Escalated Time":=TIME;
           "Assigned To":="Escalated To";
           Status:=Status::"Escalated To Vendor";
          MODIFY(TRUE);
         END;

        //Notify the requester that the issue has been escalated
         ObjComInfo.GET;
         SenderEmailAddress:=ObjComInfo."Administrator Email";
         SenderName:=COMPANYNAME;
         //IF UserSetup.GET("Requesting Officer") THEN
         //Dynasoft Email
         ObjComInfo.TESTFIELD("Vendor  Email");
         Recipient:=ObjComInfo."Vendor  Email";
         Subject:='ICT ISSUE ESCALATION'+ ' '+"Job No."+' '+"Description of the issue";
         Body:='Please note that the issue on the subject above has been escalatd to dynasoft for further action.';
         ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);

        //Notify the 'Escalted To' that the issue has been escalated to them
         ObjComInfo.GET;
         SenderEmailAddress:=ObjComInfo."Administrator Email";
         SenderName:=COMPANYNAME;
         //IF UserSetup.GET("Escalated To") THEN
         ObjComInfo.TESTFIELD("ICT Email");
         Recipient:=ObjComInfo."ICT Email";
         Subject:='ICT ISSUE ESCALATION'+ ' '+"Job No."+' '+"Description of the issue";
         Body:='Please note that the issue on the subject above has been escalatd to Dyansoft Business Solutions Limited for further action';
         ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);*/

        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            CompInfo.Reset;
            // CompInfo.SetRange("ICT Email", assignee);


            helpdesk."Escalated To" := assignee;
            helpdesk."Escalated Date" := Today();
            helpdesk."Escalated Time" := Time;
            // helpdesk.Status := helpdesk.Status::"Escalated To Vendor";
            helpdesk."Escalated By" := helpdesk."Assigned To";
            helpdesk."Ascalation Details" := description;
            //helpdesk.Escalated T:= UserSetup."Employee No.";
            if helpdesk.Modify(true) then begin
                //Notify the requester that the issue has been escalated

                ObjComInfo.Get;
                SenderEmailAddress := ObjComInfo."Administrator Email";
                SenderName := COMPANYNAME;
                //IF UserSetup.GET("Requesting Officer") THEN
                //Dynasoft Email
                //ObjComInfo.TestField("Vendor  Email");
                //Recipient := ObjComInfo."Vendor  Email";
                Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo + '' + description;
                Body := 'Please note that the issue on the subject above has been escalatd to dynasoft for further action.';
                SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                //Notify the Escalted To that the issue has been escalated
                ObjComInfo.Get;
                SenderEmailAddress := ObjComInfo."Administrator Email";
                SenderName := COMPANYNAME;
                //IF UserSetup.GET("Escalated To") THEN
                // ObjComInfo.TestField("ICT Email");
                // Recipient := ObjComInfo."ICT Email";
                Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo + '' + description;
                Body := 'Please note that the issue on the subject above has been escalatd to Dyansoft Business Solutions Limited for further action';
                SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                status := 'success*Request assigned successfully';

            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end

    end;

    procedure Generateictreport(requestdate: Date) status: Text
    var
        icthelpdesk: Record "ICT Helpdesk";
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        icthelpdesk.Reset;
        icthelpdesk.SetFilter("Request Date", '%1..%2', 0D, requestdate);

        // if FILE.Exists(FILESPATH1 + '.pdf') then begin
        //     FILE.Erase(FILESPATH1 + '.pdf');
        //     Report.SaveAsPdf(56241, FILESPATH1 + '.pdf');
        //     status := 'success*Generated*Downloads\allissues\' + '.pdf';
        // end else begin
        //     Report.SaveAsPdf(56241, FILESPATH1 + '.pdf');
        //     status := 'success*Generated*Downloads\allissues\' + '.pdf';

        // end;
    end;

    procedure GenerateReopenreport() status: Text
    begin

        // if FILE.Exists(FILESPATH2 + '.pdf') then begin
        //     FILE.Erase(FILESPATH2 + '.pdf');
        //     Report.SaveAsPdf(56239, FILESPATH2 + '.pdf');
        //     status := 'success*Generated*Downloads\reopen\' + '.pdf';
        // end else begin
        //     Report.SaveAsPdf(56239, FILESPATH2 + '.pdf');
        //     status := 'success*Generated*Downloads\reopen\' + '.pdf';
        // end;
    end;

    procedure GenerateRMReport() status: Text
    begin

        // if FILE.Exists(FILESPATH3 + '.pdf') then begin
        //     FILE.Erase(FILESPATH3 + '.pdf');
        //     Report.SaveAsPdf(95000, FILESPATH3 + '.pdf');
        //     status := 'success*Generated*Downloads\RiskReport\' + '.pdf';
        // end else begin
        //     Report.SaveAsPdf(95000, FILESPATH3 + '.pdf');
        //     status := 'success*Generated*Downloads\RiskReport\' + '.pdf';
        // end;
    end;

    procedure GetAllItems(itemcategory: Code[100]; location: Code[100]) AllData: Text
    var
        Items: Record Item;
    begin
        Items.Reset;
        Items.SetRange("Item Category Code", itemcategory);
        Items.SetRange("Global Dimension 1 Code", location);
        if Items.FindSet then begin
            repeat
                AllData := AllData + Format(Items."No.") + '*' + Format(Items.Description) + ':';
            until Items.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnNewStaffPerformanceContract(contractNo: Code[100]; employeeNo: Code[100]; description: Text; seniorOfficerPC: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerfomanceContractHeader1: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange("Responsible Employee No.", employeeNo);
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Open);
        PerfomanceContractHeader.SetRange("Score Card Type", PerfomanceContractHeader."score card type"::Staff);
        PerfomanceContractHeader.SetRange("Document Type", PerfomanceContractHeader."document type"::"Individual Scorecard");
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader.Description := description;
            // if type = 'HQ' then begin
            //     PerfomanceContractHeader."Senior Officer PC ID" := seniorOfficerPC;
            // end else begin
            //     PerfomanceContractHeader."Regional PC ID" := seniorOfficerPC;
            // end;
            PerfomanceContractHeader1.Reset;
            PerfomanceContractHeader1.SetRange(No, seniorOfficerPC);
            if PerfomanceContractHeader1.FindSet then begin
                PerfomanceContractHeader."Strategy Plan ID" := PerfomanceContractHeader1."Strategy Plan ID";
                PerfomanceContractHeader."Annual Workplan" := PerfomanceContractHeader1."Annual Workplan";
                PerfomanceContractHeader."Start Date" := PerfomanceContractHeader1."Start Date";
                PerfomanceContractHeader."End Date" := PerfomanceContractHeader1."End Date";
                PerfomanceContractHeader."Annual Reporting Code" := PerfomanceContractHeader1."Annual Reporting Code";
                PerfomanceContractHeader."Functional WorkPlan" := PerfomanceContractHeader1."Functional WorkPlan";
                PerfomanceContractHeader."Directors PC ID" := PerfomanceContractHeader1."Directors PC ID";
                PerfomanceContractHeader."CEO WorkPlan" := PerfomanceContractHeader1."CEO WorkPlan";
            end;
            if PerfomanceContractHeader.Modify(true) then begin
                //FnSuggestJD(PerfomanceContractHeader.No);
                status := 'success*Your staff perfomance contract was successfully created*' + PerfomanceContractHeader.No + '*' + PerfomanceContractHeader."Strategy Plan ID" + '*' + seniorOfficerPC + '*' + PerfomanceContractHeader."Annual Reporting Code";
            end else begin
                status := 'danger*Your staff perfomance contract was not created, kindly try again!';
            end;
        end else begin
            //  PerfomanceContractHeader.RESET;
            //  PerfomanceContractHeader.SETRANGE("Responsible Employee No.",employeeNo);
            //  PerfomanceContractHeader.SETRANGE("Approval Status",PerfomanceContractHeader."Approval Status"::Open);
            //  IF PerfomanceContractHeader.FINDSET THEN BEGIN
            //    ERROR:='You have an open individual performance contract, kindly re-use it!';
            //  END;
            PerfomanceContractHeader.Init;
            PerfomanceContractHeader."Document Type" := PerfomanceContractHeader."document type"::"Individual Scorecard";
            PerfomanceContractHeader."Evaluation Type" := PerfomanceContractHeader."evaluation type"::"Standard Appraisal/Supervisor Score Only";
            PerfomanceContractHeader."Score Card Type" := PerfomanceContractHeader."score card type"::Staff;
            PerfomanceContractHeader."Responsible Employee No." := employeeNo;
            PerfomanceContractHeader.Validate("Responsible Employee No.");
            PerfomanceContractHeader.Description := description;
            // if type = 'HQ' then begin
            //     PerfomanceContractHeader."Senior Officer PC ID" := seniorOfficerPC;
            // end else begin
            //     PerfomanceContractHeader."Regional PC ID" := seniorOfficerPC;
            // end;
            PerfomanceContractHeader1.Reset;
            PerfomanceContractHeader1.SetRange(No, seniorOfficerPC);
            if PerfomanceContractHeader1.FindSet then begin
                PerfomanceContractHeader."Strategy Plan ID" := PerfomanceContractHeader1."Strategy Plan ID";
                PerfomanceContractHeader."Annual Workplan" := PerfomanceContractHeader1."Annual Workplan";
                PerfomanceContractHeader."Start Date" := PerfomanceContractHeader1."Start Date";
                PerfomanceContractHeader."End Date" := PerfomanceContractHeader1."End Date";
                PerfomanceContractHeader."Annual Reporting Code" := PerfomanceContractHeader1."Annual Reporting Code";
                PerfomanceContractHeader."Functional WorkPlan" := PerfomanceContractHeader1."Functional WorkPlan";
                PerfomanceContractHeader."Directors PC ID" := PerfomanceContractHeader1."Directors PC ID";
                PerfomanceContractHeader."CEO WorkPlan" := PerfomanceContractHeader1."CEO WorkPlan";
            end;
            if PerfomanceContractHeader.Insert(true) then begin
                FnSuggestJD(PerfomanceContractHeader.No);
                status := 'success*Your staff perfomance contract was successfully created*' + PerfomanceContractHeader.No + '*' + PerfomanceContractHeader."Strategy Plan ID" + '*' + seniorOfficerPC + '*' + PerfomanceContractHeader."Annual Reporting Code";
            end else begin
                status := 'danger*Your staff perfomance contract was not created, kindly try again!';
            end;
        end;
    end;

    procedure FnSubmitSelectedCoreInitiatives(strategyid: Code[100]; personalscorecardid: Code[100]; workplanNumber: Code[50]; initiativeNumber: Code[50]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PerformanceContract: Record "Perfomance Contract Header";
        PcObjective1: Record "PC Objective";
        OriginalSubActivities: Record "Sub PC Objective";
        PCSubActivities: Record "Sub PC Objective";
    begin
        PerformanceContract.Reset;
        PerformanceContract.SetRange(No, personalscorecardid);
        if PerformanceContract.FindSet then begin
            PcObjective1.Reset;
            PcObjective1.SetRange("Strategy Plan ID", strategyid);
            PcObjective1.SetRange("Workplan No.", workplanNumber);
            PcObjective1.SetRange("Initiative No.", initiativeNumber);
            if PcObjective1.FindSet then begin
                PCObjective.Reset;
                PCObjective.SetRange("Strategy Plan ID", strategyid);
                PCObjective.SetRange("Workplan No.", personalscorecardid);
                PCObjective.SetRange("Initiative No.", initiativeNumber);
                if PCObjective.FindSet then begin
                    status := 'The selected activity already exists, kindly select another activity!';
                end;
                repeat
                    PCObjective.Init;
                    PCObjective."Workplan No." := personalscorecardid;
                    PCObjective."Strategy Plan ID" := PcObjective1."Strategy Plan ID";
                    PCObjective."Initiative Type" := PcObjective1."Initiative Type";
                    PCObjective."Initiative No." := initiativeNumber;
                    PCObjective.Validate("Initiative No.");
                    PCObjective."Goal Template ID" := PcObjective1."Goal Template ID";
                    PCObjective."Objective/Initiative" := PcObjective1."Objective/Initiative";
                    PCObjective."Year Reporting Code" := PcObjective1."Year Reporting Code";
                    PCObjective."Primary Directorate" := PcObjective1."Primary Directorate";
                    PCObjective."Primary Department" := PcObjective1."Primary Department";
                    PCObjective."Outcome Perfomance Indicator" := PcObjective1."Outcome Perfomance Indicator";
                    PCObjective."Unit of Measure" := PcObjective1."Unit of Measure";
                    PCObjective."Imported Annual Target Qty" := PcObjective1."Imported Annual Target Qty";
                    PCObjective."Q1 Target Qty" := PcObjective1."Q1 Target Qty";
                    PCObjective."Q2 Target Qty" := PcObjective1."Q2 Target Qty";
                    PCObjective."Q3 Target Qty" := PcObjective1."Q3 Target Qty";
                    PCObjective."Q4 Target Qty" := PcObjective1."Q4 Target Qty";
                    PCObjective."Start Date" := PerformanceContract."Start Date";
                    PCObjective."Due Date" := PerformanceContract."End Date";
                    if PCObjective.Insert(true) then begin
                        Fnsuggestsubindicators(PcObjective1."Strategy Plan ID", PcObjective1."Workplan No.", PcObjective1."Initiative No.", personalscorecardid);
                        status := 'success*success';
                    end else begin
                        status := 'danger*failed';
                    end;
                until PcObjective1.Next = 0;
            end;
        end;
    end;

    procedure Fnsuggestsubindicators(strategyid: Code[100]; docNo: Code[100]; initiativeNumber: Code[50]; No: Code[100]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PerformanceContract: Record "Perfomance Contract Header";
        PcObjective1: Record "PC Objective";
        OriginalSubActivities: Record "Sub PC Objective";
        PCSubActivities: Record "Sub PC Objective";
    begin
        OriginalSubActivities.Reset;
        OriginalSubActivities.SetRange("Workplan No.", docNo);
        OriginalSubActivities.SetRange("Initiative No.", initiativeNumber);
        OriginalSubActivities.SetRange("Strategy Plan ID", strategyid);
        if OriginalSubActivities.FindSet then begin
            Message(strategyid, docNo, initiativeNumber);
            repeat
                PCSubActivities.Init;
                PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                PCSubActivities."Workplan No." := No;
                PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                PCSubActivities.TransferFields(OriginalSubActivities, false);
                if PCSubActivities.Insert(true) then begin
                    status := 'success*success';
                end else begin
                    status := 'danger*failed';
                end;
            until OriginalSubActivities.Next = 0;
        end;
    end;

    procedure FnSaveCoreInitiatives(entryNumber: Integer; startdate: Date; enddate: Date; agreedTarget: Decimal; assignedweight: Decimal; comments: Text) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
    begin
        PCObjective.Reset;
        PCObjective.SetRange(EntryNo, entryNumber);
        if PCObjective.FindSet then begin
            repeat
                PCObjective."Start Date" := startdate;
                PCObjective."Due Date" := enddate;
                PCObjective."Imported Annual Target Qty" := agreedTarget;
                PCObjective."Assigned Weight (%)" := assignedweight;
                PCObjective."Additional Comments" := comments;
                if PCObjective.Modify(true) then begin
                    status := 'success*Core Initiatives Details was successfully saved';
                end else begin
                    status := 'danger*Core Initiatives Details Was not successfully saved';
                end;
            until PCObjective.Next = 0;
        end;
    end;

    procedure FnRemoveCoreInitiatives(docNo: Code[100]; entryNumber: Integer) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
    begin
        PCObjective.Reset;
        PCObjective.SetRange("Workplan No.", docNo);
        PCObjective.SetRange(EntryNo, entryNumber);
        if PCObjective.FindSet then begin
            if PCObjective.Delete(true) then begin
                status := 'success*Core Initiative was successfully removed';
            end else begin
                status := 'danger*Core Initiative could not be removed, kindly try again!';
            end;
        end;
    end;

    procedure fnSaveAditionalInitiatives(entryno: Integer; agreedtarget: Decimal; annualtarget: Decimal; startdate: Date; enddate: Date; comments: Text) status: Text
    var
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        SecondaryPCObjective.Reset;
        SecondaryPCObjective.SetRange(EntryNo, entryno);
        if SecondaryPCObjective.FindSet then begin
            repeat
                SecondaryPCObjective."Imported Annual Target Qty" := agreedtarget;
                SecondaryPCObjective."Assigned Weight (%)" := annualtarget;
                SecondaryPCObjective."Start Date" := startdate;
                SecondaryPCObjective."Due Date" := enddate;
                //SecondaryPCObjective.Comments := comments;
                if SecondaryPCObjective.Modify(true) then begin
                    status := 'success*Additional Initiatives were successfully  submitted';
                end else begin
                    status := 'danger*Additional Initiatives were not successfully  submitted';
                end;
            until SecondaryPCObjective.Next = 0;
        end;
    end;

    procedure fnRemoveAditionalInitiative(docNo: Code[100]; entryno: Integer) status: Text
    var
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        SecondaryPCObjective.Reset;
        SecondaryPCObjective.SetRange("Workplan No.", docNo);
        SecondaryPCObjective.SetRange(EntryNo, entryno);
        if SecondaryPCObjective.FindSet then begin
            if SecondaryPCObjective.Delete(true) then begin
                status := 'success*Additional Initiative was successfully removed';
            end else begin
                status := 'danger*Additional Initiative could not be removed, kindly try again!';
            end;
        end;
    end;

    procedure FnDeleteIndividualCardSubActivities(empNo: Text[30]; scorecardNumber: Code[100]; ActivityNo: Text; EntryNumber: Integer) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SubPCObjective: Record "Sub PC Objective";
    begin
        SubPCObjective.Reset;
        SubPCObjective.SetRange("Workplan No.", scorecardNumber);
        SubPCObjective.SetRange("Initiative No.", ActivityNo);
        SubPCObjective.SetRange("Entry Number", EntryNumber);
        if SubPCObjective.FindSet then begin
            if SubPCObjective.Delete(true) then begin
                status := 'success* Individual Score Card Sub Activities was successfully Removed';
            end else begin
                status := 'danger* Individual Score Card Sub Activities was not  Removed';
            end;
        end;
    end;

    procedure FnNewIndividualCardSubActivities(scorecardNumber: Code[100]; ActivityNo: Text; subinitiative: Text; subindicator: Text; uom: Text; targets: Integer; completiondate: Date; assweight: Decimal) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SubPCObjective: Record "Sub PC Objective";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, scorecardNumber);
        if PerfomanceContractHeader.FindSet then begin
            SubPCObjective.Init;
            SubPCObjective."Workplan No." := scorecardNumber;
            SubPCObjective."Initiative No." := ActivityNo;
            SubPCObjective."Objective/Initiative" := subinitiative;
            SubPCObjective."Outcome Perfomance Indicator" := subindicator;
            SubPCObjective."Unit of Measure" := uom;
            SubPCObjective."Imported Annual Target Qty" := targets;
            SubPCObjective."Due Date" := completiondate;
            // SubPCObjective."Assigned Weight (%)" := assweight;
            SubPCObjective."Strategy Plan ID" := PerfomanceContractHeader."Strategy Plan ID";
            SubPCObjective."Year Reporting Code" := PerfomanceContractHeader."Annual Reporting Code";
            if SubPCObjective.Insert(true) then begin
                status := 'success* Individual Score Card Sub Activities was successfully  submitted';
            end else begin
                status := 'danger* Individual Score Card Sub Activities was not  submitted';
            end;
        end;
    end;

    procedure FnEditIndividualCardSubActivities(scorecardNumber: Code[100]; ActivityNo: Text; lineno: Integer; subinitiative: Text; subindicator: Text; uom: Text; targets: Integer; completiondate: Date; agreedweight: Decimal) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SubPCObjective: Record "Sub PC Objective";
    begin
        SubPCObjective.Reset;
        SubPCObjective.SetRange("Workplan No.", scorecardNumber);
        SubPCObjective.SetRange("Initiative No.", ActivityNo);
        SubPCObjective.SetRange("Entry Number", lineno);
        if SubPCObjective.FindSet then begin
            SubPCObjective."Objective/Initiative" := subinitiative;
            SubPCObjective."Outcome Perfomance Indicator" := subindicator;
            SubPCObjective."Unit of Measure" := uom;
            SubPCObjective."Imported Annual Target Qty" := targets;
            SubPCObjective."Due Date" := completiondate;
            // SubPCObjective."Assigned Weight (%)" := agreedweight;
            if SubPCObjective.Modify(true) then begin
                status := 'success* Individual Score Card Sub Activities was successfully updated';
            end else begin
                status := 'danger* Individual Score Card Sub Activities was not updated';
            end;
        end;
    end;

    procedure fnSendStaffPerformanceContractApproval(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Open);
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader."Approval Status" := PerfomanceContractHeader."approval status"::"Pending Approval";
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*Your staff perfomance contract was successfully send for approval*';
            end else begin
                status := 'danger*Your staff perfomance contract was not send for approval, kindly try again!';
            end;
        end;
    end;

    procedure fnCancelStaffPerformanceContract(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::"Pending Approval");
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader."Approval Status" := PerfomanceContractHeader."approval status"::Open;
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*Approval for staff perfomance contract was successfully cancelled*';
            end else begin
                status := 'danger*Approval for staff perfomance contract was not cancelled, kindly try again!';
            end;
        end;
    end;

    procedure fnLockStaffPerformanceContract(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Released);
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader."Change Status" := PerfomanceContractHeader."change status"::Locked;
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*The perfomance contract was successfully locked, kindy proceed to sign*';
            end else begin
                status := 'danger*The perfomance contract was not locked, kindly try again!';
            end;
        end;
    end;

    procedure fnSignStaffPerformanceContract(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Released);
        PerfomanceContractHeader.SetRange("Change Status", PerfomanceContractHeader."change status"::Locked);
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader.Status := PerfomanceContractHeader.Status::Signed;
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*The perfomance contract was successfully signed*';
            end else begin
                status := 'danger*The perfomance contract was not signed, kindly try again!';
            end;
        end else begin
            status := 'danger*You must lock the performance contract before signing!!';
        end;
        exit(status)
    end;

    procedure FnSubmitSelectedPLogCategories(strategyid: Code[100]; personalscorecardid: Code[100]; plogNumber: Code[50]; initiativeNumber: Code[50]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, plogNumber);
        if PerformanceDiaryLog.FindSet then begin
            PCObjective.Reset;
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Initiative No.", initiativeNumber);
            if PCObjective.FindSet then begin
                repeat
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := PCObjective."Initiative No.";
                    PlogLines.Validate("Initiative No.");
                    PlogLines."Sub Intiative No" := PCObjective."Objective/Initiative";
                    PlogLines.Description := PCObjective."Objective/Initiative";
                    if PlogLines.Insert(true) then begin
                        status := 'success*The PlogLines was successfully submitted';
                    end else begin
                        status := 'danger*The PlogLines was successfully submitted';
                    end;
                until PCObjective.Next = 0;
            end;
        end;
    end;

    procedure FnNewPerformanceLogEntry(docNo: Code[100]; empNo: Text[30]; scorecardNumber: Code[100]; description: Text) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange("Employee No.", empNo);
        PerformanceDiaryLog.SetRange(No, docNo);
        PerformanceDiaryLog.SetRange("Approval Status", PerformanceDiaryLog."approval status"::Open);
        PerformanceDiaryLog.SetRange(Posted, false);
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog."Personal Scorecard ID" := scorecardNumber;
            PerformanceDiaryLog.Validate("Personal Scorecard ID");
            PerformanceDiaryLog.Description := description;
            if PerformanceDiaryLog.Modify(true) then begin
                ;
                //FnSuggestPlogLines(PerformanceDiaryLog.No,PerformanceDiaryLog."CSP ID",scorecardNumber,empNo);
                //fnSuggestPlogandSubPlogData(PerformanceDiaryLog.No);
                status := 'success* Performance Diary Logs was successfully updated*' + PerformanceDiaryLog.No + '*' + PerformanceDiaryLog."CSP ID" + '*' + PerformanceDiaryLog."Personal Scorecard ID";
            end else begin
                status := 'danger* Performance Diary Logs Was not successfully updated*' + PerformanceDiaryLog.No;
            end;
        end else begin
            //---//
            //  PerformanceDiaryLog.RESET;
            //  PerformanceDiaryLog.SETRANGE("Employee No.",empNo);
            //  PerformanceDiaryLog.SETRANGE("Approval Status",PerformanceDiaryLog."Approval Status"::Open);
            //  IF PerformanceDiaryLog.FINDSET THEN BEGIN
            //    ERROR:='You have an open performance log, kindly re-use it!';
            //  END;
            PerformanceDiaryLog.Init;
            PerformanceDiaryLog."Employee No." := empNo;
            PerformanceDiaryLog.Validate("Employee No.");
            PerformanceDiaryLog."Personal Scorecard ID" := scorecardNumber;
            PerformanceDiaryLog.Validate("Personal Scorecard ID");
            PerformanceDiaryLog.Description := description;
            PerformanceDiaryLog."Approval Status" := PerformanceDiaryLog."approval status"::Open;
            if PerformanceDiaryLog.Insert(true) then begin
                fnSuggestPlogandSubPlogData(PerformanceDiaryLog.No);
                status := 'success* Performance Diary Logs was successfully submitted*' + PerformanceDiaryLog.No;
            end else begin
                status := 'danger* Performance Diary Logs was not successfully submitted*';
            end;
        end;
    end;

    procedure fnGetPlogLines(docNo: Code[100]; empNo: Code[100]) PlogData: Text
    var
        PlogLines: Record "Plog Lines";
    begin
        PlogLines.Reset;
        PlogLines.SetRange("PLog No.", docNo);
        PlogLines.SetRange("Employee No.", empNo);
        if PlogLines.FindSet then begin
            repeat
                PlogData := PlogData + Format(PlogLines.EntryNo) + '*' + Format(PlogLines."PLog No.") + '*' + Format(PlogLines."Initiative No.") + '*' + Format(PlogLines."Personal Scorecard ID") + '*' + Format(PlogLines."Sub Intiative No") + '*' +
                Format(PlogLines."Weight %") + '*' + Format(PlogLines."Achieved Date") + '*' + Format(PlogLines."Target Qty") + '*' + Format(PlogLines."Q1 Achieved Target") + '*' + Format(PlogLines."Q2 Achieved Target") + '*' +
                Format(PlogLines."Q3 AchievedTarget") + '*' + Format(PlogLines."Q4 Achieved Target") + '*' + Format(PlogLines."Achieved Target") + '*' + Format(PlogLines.Comments) + '*' + Format(PlogLines."Achieved Weight(%)") + ':';
            until PlogLines.Next = 0;
        end;
        exit(PlogData)
    end;

    procedure fnGetSubPlogLines(plogNo: Code[100]; initiativeNo: Code[100]; pcNo: Code[100]) PlogData: Text
    var
        SubPlogLines: Record "Sub Plog Lines";
    begin
        SubPlogLines.Reset;
        SubPlogLines.SetRange("PLog No.", plogNo);
        SubPlogLines.SetRange("Initiative No.", initiativeNo);
        SubPlogLines.SetRange("Personal Scorecard ID", pcNo);
        if SubPlogLines.FindSet then begin
            repeat
                PlogData := PlogData + Format(SubPlogLines.EntryNo) + '*' + Format(SubPlogLines.Description) + '*' + Format(SubPlogLines."Achieved Date") + '*' + Format(SubPlogLines."Target Qty") + '*' + Format(SubPlogLines."Achieved Target") + '*' +
                Format(SubPlogLines.Comments) + '*' + Format(SubPlogLines."Weight %") + ':';
            until SubPlogLines.Next = 0;
        end;
        exit(PlogData)
    end;

    procedure FnSuggestPlogLines(docNo: Code[100]; strategyid: Code[100]; personalscorecardid: Code[100]; empNumber: Code[100]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        StrategicInitiative: Record "PC Objective";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetFilter(No, '<>%1', '');
        PerformanceDiaryLog.SetRange(No, docNo);
        PerformanceDiaryLog.SetRange("Employee No.", empNumber);
        PerformanceDiaryLog.SetRange("Personal Scorecard ID", personalscorecardid);
        PerformanceDiaryLog.SetRange("CSP ID", strategyid);
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog.TestField("Employee No.");
            PerformanceDiaryLog.TestField("Personal Scorecard ID");
            PerformanceDiaryLog.TestField("Activity Start Date");
            PerformanceDiaryLog.TestField("Activity End Date");
            PCObjective.Reset;
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            if PCObjective.FindSet then begin
                repeat
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Initiative No." := PCObjective."Initiative No.";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                    PlogLines.Validate("Initiative No.");
                    if PlogLines.Insert(true) then begin
                        status := 'success*The PlogLines was successfully submitted';
                    end else begin
                        status := 'danger*The PlogLines was not successfully submitted';
                    end;
                until PCObjective.Next = 0;
            end;
        end;
        SecondaryPCObjective.Reset;
        SecondaryPCObjective.SetRange("Strategy Plan ID", strategyid);
        SecondaryPCObjective.SetRange("Workplan No.", personalscorecardid);
        if SecondaryPCObjective.FindFirst then begin
            repeat
                PlogLines.Init;
                PlogLines."PLog No." := PerformanceDiaryLog.No;
                PlogLines."Activity Type" := PlogLines."activity type"::"Secondary Activity";
                PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                PlogLines."Initiative No." := SecondaryPCObjective."Initiative No.";
                PlogLines.Validate("Initiative No.");
                if PlogLines.Insert(true) then begin
                    status := 'success*The PlogLines was successfully submitted';
                end else begin
                    status := 'danger*The PlogLines was not successfully submitted';
                end;
            until SecondaryPCObjective.Next = 0;
        end;
    end;

    procedure fnSuggestPlogandSubPlogData(docNo: Code[100])
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
        PlogLines: Record "Plog Lines";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        SubPlogLines: Record "Sub Plog Lines";
        SubPCObjective: Record "Sub PC Objective";
        SPMGeneralSetup: Record "SPM General Setup";
        PCJobDescription: Record "PC Job Description";
        SubJDObjective: Record "Sub JD Objective";
    begin
        // PerformanceDiaryLog.TESTFIELD("Employee No.");
        // PerformanceDiaryLog.TESTFIELD("Personal Scorecard ID");
        // PerformanceDiaryLog.TESTFIELD("Activity Start Date");
        // PerformanceDiaryLog.TESTFIELD("Activity End Date");
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, docNo);
        if PerformanceDiaryLog.FindSet then begin
            SPMGeneralSetup.Get();
            if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                PCObjective.Reset;
                PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
                PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                PCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
                if PCObjective.FindSet then begin
                    repeat
                        PCObjective.CalcFields("Individual Achieved Targets");
                        PCObjective.TestField("Due Date");
                        //PCObjective.TESTFIELD("Imported Annual Target Qty");
                        PlogLines.Init;
                        PlogLines."PLog No." := PerformanceDiaryLog.No;
                        PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                        PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                        PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                        PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                        //PlogLines."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                        //PlogLines."Key Performance Indicator":=PCObjective."Outcome Perfomance Indicator";
                        PlogLines."Initiative No." := PCObjective."Initiative No.";
                        PlogLines."Unit of Measure" := PCObjective."Unit of Measure";
                        //MESSAGE('PCObjective."Assigned Weight (%)" is %1',PCObjective."Assigned Weight (%)");
                        PlogLines."Weight %" := PCObjective."Assigned Weight (%)";
                        PlogLines.Validate("Initiative No.");
                        PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                        PlogLines.Insert;

                        //Sub Activities
                        SubPCObjective.Reset;
                        SubPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                        SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                        if SubPCObjective.FindSet then begin
                            repeat
                                SubPlogLines.Init;
                                SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                                SubPlogLines."Activity Type" := SubPlogLines."activity type"::"Primary Activity";
                                SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                                SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                                SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                                SubPlogLines."Initiative No." := SubPCObjective."Initiative No.";
                                //SubPlogLines."Sub Activity No." := SubPCObjective."Outcome Perfomance Indicator";
                                SubPlogLines.Description := SubPCObjective."Objective/Initiative";
                                //SubPlogLines."Sub Activity No." := SubPCObjective."Sub Initiative No.";
                                SubPlogLines."Unit of Measure" := SubPCObjective."Unit of Measure";
                                SubPlogLines."Planned Date" := SubPCObjective."Due Date";
                                SubPlogLines."Target Qty" := SubPCObjective."Imported Annual Target Qty";
                                //  SubPlogLines."Weight %" := SubPCObjective."Assigned Weight (%)";
                                //SubPlogLines.VALIDATE("Initiative No.");
                                //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                                if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                    SubPlogLines.Insert(true);
                            until SubPCObjective.Next = 0;
                        end;

                    until PCObjective.Next = 0;
                end;

                SecondaryPCObjective.Reset;
                SecondaryPCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
                SecondaryPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                SecondaryPCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
                if SecondaryPCObjective.FindFirst then begin
                    repeat
                        SecondaryPCObjective.CalcFields("Individual Achieved Targets");
                        SecondaryPCObjective.TestField("Due Date");
                        //SecondaryPCObjective.TESTFIELD("Imported Annual Target Qty");
                        PlogLines.Init;
                        PlogLines."PLog No." := PerformanceDiaryLog.No;
                        PlogLines."Activity Type" := PlogLines."activity type"::"Secondary Activity";
                        PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                        PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                        PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                        PlogLines."Initiative No." := SecondaryPCObjective."Initiative No.";
                        //MESSAGE('SecondaryPCObjective."Assigned Weight (%)" is %1',SecondaryPCObjective."Assigned Weight (%)");
                        PlogLines."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                        PlogLines.Validate("Initiative No.");
                        PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                        PlogLines.Insert;

                        //Sub Activities
                        SubPCObjective.Reset;
                        SubPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                        SubPCObjective.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                        if SubPCObjective.FindSet then begin
                            repeat
                                SubPlogLines.Init;
                                SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                                SubPlogLines."Activity Type" := SubPlogLines."activity type"::"Primary Activity";
                                SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                                SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                                SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                                SubPlogLines."Initiative No." := SubPCObjective."Initiative No.";
                                //SubPlogLines."Sub Activity No." := SubPCObjective."Outcome Perfomance Indicator";
                                SubPlogLines.Description := SubPCObjective."Objective/Initiative";
                                //SubPlogLines."Sub Activity No." := SubPCObjective."Sub Initiative No.";
                                SubPlogLines."Unit of Measure" := SubPCObjective."Unit of Measure";
                                SubPlogLines."Planned Date" := SubPCObjective."Due Date";
                                SubPlogLines."Target Qty" := SubPCObjective."Imported Annual Target Qty";
                                //SubPlogLines."Weight %" := SubPCObjective."Assigned Weight (%)";
                                //SubPlogLines.VALIDATE("Initiative No.");
                                //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                                if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                    SubPlogLines.Insert(true);
                            until SubPCObjective.Next = 0;
                        end;
                    until SecondaryPCObjective.Next = 0;
                end;
            end;

            if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                PCJobDescription.Reset;
                PCJobDescription.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                PCJobDescription.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
                if PCJobDescription.FindFirst then begin
                    repeat
                        PCJobDescription.CalcFields("Individual Achieved Targets");
                        PCJobDescription.TestField("Due Date");
                        //PCJobDescription.TESTFIELD("Imported Annual Target Qty");
                        PlogLines.Init;
                        PlogLines."PLog No." := PerformanceDiaryLog.No;
                        PlogLines."Activity Type" := PlogLines."activity type"::"JD Activity";
                        PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                        PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                        PlogLines."Initiative No." := Format(PCJobDescription."Line Number");
                        PlogLines."Sub Intiative No" := PCJobDescription.Description;
                        PlogLines."Planned Date" := PCJobDescription."Start Date";
                        PlogLines."Achieved Date" := PerformanceDiaryLog."Document Date";
                        PlogLines."Due Date" := PCJobDescription."Due Date";
                        PlogLines."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                        PlogLines."Weight %" := PCJobDescription."Assigned Weight (%)";
                        PlogLines."Remaining Targets" := PCJobDescription."Imported Annual Target Qty" - PCJobDescription."Individual Achieved Targets";
                        PlogLines.Insert;
                        //Sub JD Plog Lines
                        SubJDObjective.Reset;
                        SubJDObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                        SubJDObjective.SetRange("Line Number", PCJobDescription."Line Number");
                        if SubJDObjective.FindSet then begin
                            repeat
                                SubPlogLines.Init;
                                SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                                SubPlogLines."Activity Type" := SubPlogLines."activity type"::"JD Activity";
                                SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                                SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                                SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                                SubPlogLines."Initiative No." := SubJDObjective."Line Number";
                                //SubPlogLines."Sub Activity No." := SubJDObjective."Sub Initiative No.";
                                SubPlogLines.Description := SubJDObjective.Description;
                                SubPlogLines."Unit of Measure" := SubJDObjective."Unit of Measure";
                                SubPlogLines."Planned Date" := SubJDObjective."Due Date";
                                SubPlogLines."Target Qty" := SubJDObjective."Imported Annual Target Qty";
                                SubPlogLines."Due Date" := SubJDObjective."Due Date";
                                if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                    SubPlogLines.Insert(true);
                            until SubJDObjective.Next = 0;
                        end;
                    until PCJobDescription.Next = 0;
                end;
            end;
        end;
    end;

    procedure FnUpdatePerformanceTargetLinesDetails(docNo: Code[100]; entryNumber: Integer; agreedTarget: Decimal; comments: Text) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
        PlogLines: Record "Plog Lines";
    begin
        PlogLines.Reset;
        PlogLines.SetRange(EntryNo, entryNumber);
        PlogLines.SetRange("PLog No.", docNo);
        if PlogLines.FindSet then begin
            PlogLines."Achieved Target" := agreedTarget;
            PlogLines.Comments := comments;
            if PlogLines.Modify(true) then begin
                status := 'success*Performance Target Details was successfully updated';
            end else begin
                status := 'danger*Performance Target Details Was not successfully updated';
            end;
        end;
    end;

    procedure FnRemovePerformanceLogLine(docNo: Code[100]; entryNumber: Integer) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
        PlogLines: Record "Plog Lines";
    begin
        PlogLines.Reset;
        PlogLines.SetRange(EntryNo, entryNumber);
        PlogLines.SetRange("PLog No.", docNo);
        if PlogLines.FindSet then begin
            if PlogLines.Delete(true) then begin
                status := 'success*Performance update line was successfully removed';
            end else begin
                status := 'danger*Performance update line was not removed, kindly try again!!';
            end;
        end;
    end;

    procedure fnInsertPlogSubActivities(entryNo: Integer; plogno: Code[100]; initiativeno: Code[100]; pcid: Code[100]; achievedtarget: Decimal; comments: Text) status: Text
    var
        SubPlogLines: Record "Sub Plog Lines";
        PlogLines: Record "Plog Lines";
        SubPlogLines1: Record "Sub Plog Lines";
        TotalTarget: Decimal;
        TotalWeight: Decimal;
    begin
        SubPlogLines.Reset;
        SubPlogLines.SetRange(EntryNo, entryNo);
        SubPlogLines.SetRange("PLog No.", plogno);
        SubPlogLines.SetRange("Initiative No.", initiativeno);
        SubPlogLines.SetRange("Personal Scorecard ID", pcid);
        if SubPlogLines.FindSet then begin
            SubPlogLines."Achieved Target" := achievedtarget;
            SubPlogLines.Comments := comments;
            if SubPlogLines.Modify(true) then begin
                PlogLines.Reset;
                PlogLines.SetRange("PLog No.", plogno);
                PlogLines.SetRange("Initiative No.", initiativeno);
                if PlogLines.FindSet then begin
                    //      SubPlogLines.RESET;
                    //      SubPlogLines.SETRANGE("PLog No.",PlogLines."PLog No.");
                    //      SubPlogLines.SETRANGE("Employee No.",PlogLines."Employee No.");
                    //      SubPlogLines.SETRANGE("Personal Scorecard ID",PlogLines."Personal Scorecard ID");
                    //      SubPlogLines.SETRANGE("Strategy Plan ID",PlogLines."Strategy Plan ID");
                    //      SubPlogLines.SETRANGE("Initiative No.",PlogLines."Initiative No.");
                    //      SubPlogLines.CALCSUMS("Target Qty");
                    //      IF SubPlogLines."Target Qty">PlogLines."Target Qty" THEN
                    //         ERROR('Total Sub Activity Targets %1 should be equal to Activity Target %2 ',
                    //               SubPlogLines."Target Qty",PlogLines."Target Qty");


                    SubPlogLines.Reset;
                    SubPlogLines.SetRange("PLog No.", PlogLines."PLog No.");
                    SubPlogLines.SetRange("Employee No.", PlogLines."Employee No.");
                    SubPlogLines.SetRange("Personal Scorecard ID", PlogLines."Personal Scorecard ID");
                    SubPlogLines.SetRange("Strategy Plan ID", PlogLines."Strategy Plan ID");
                    SubPlogLines.SetRange("Initiative No.", PlogLines."Initiative No.");
                    SubPlogLines.CalcSums("Achieved Target");

                    PlogLines."Achieved Target" := SubPlogLines."Achieved Target";
                    TotalWeight := ((PlogLines."Achieved Target" / PlogLines."Target Qty") * 100) * (PlogLines."Weight %" / 100);
                    if TotalWeight > PlogLines."Weight %" then
                        TotalWeight := PlogLines."Weight %";

                    PlogLines."Achieved Weight(%)" := TotalWeight;
                    PlogLines.Modify(true);
                end;
                status := 'success*The plog sub activity has been saved successfully';
            end else begin
                status := 'danger*The plog sub activity was not saved successfully, kindly try again!';
            end;
        end;
    end;

    procedure fnSendPlogApproval(contractNo: Code[100]) status: Text
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, contractNo);
        PerformanceDiaryLog.SetRange("Approval Status", PerformanceDiaryLog."approval status"::Open);
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog."Approval Status" := PerformanceDiaryLog."approval status"::"Pending Approval";
            if PerformanceDiaryLog.Modify(true) then begin
                status := 'success*Your performance update was successfully send for approval*';
            end else begin
                status := 'danger*Your performance update was not send for approval, kindly try again!';
            end;
        end else begin
            status := 'danger*Sorry, you have already sent your performance diary for approval.';
        end;
    end;

    procedure fnCancelPlogApproval(contractNo: Code[100]) status: Text
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, contractNo);
        PerformanceDiaryLog.SetRange("Approval Status", PerformanceDiaryLog."approval status"::"Pending Approval");
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog."Approval Status" := PerformanceDiaryLog."approval status"::Open;
            if PerformanceDiaryLog.Modify(true) then begin
                status := 'success*Approval for performance update was successfully cancelled*';
            end else begin
                status := 'danger*Approval for performance update was not cancelled, kindly try again!';
            end;
        end;
    end;

    procedure FnNewStandardAppraisal(docNo: Code[100]; empNo: Code[100]; strategicPlan: Code[100]; Pmp: Code[100]; Tasks: Code[100]; supervisor: Code[100]; description: Text; personalSC: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        PerfomanceEvaluation.SetRange("Employee No.", empNo);
        PerfomanceEvaluation.SetRange("Approval Status", PerfomanceEvaluation."approval status"::Open);
        if PerfomanceEvaluation.FindSet then begin
            PerfomanceEvaluation."Strategy Plan ID" := strategicPlan;
            PerfomanceEvaluation.Validate("Strategy Plan ID");
            PerfomanceEvaluation."Performance Mgt Plan ID" := Pmp;
            PerfomanceEvaluation.Validate("Performance Mgt Plan ID");
            PerfomanceEvaluation."Performance Task ID" := Tasks;
            PerfomanceEvaluation.Validate("Performance Task ID");
            PerfomanceEvaluation."Personal Scorecard ID" := personalSC;
            PerfomanceEvaluation.Validate("Personal Scorecard ID");
            PerfomanceEvaluation."Supervisor Staff No." := supervisor;
            PerfomanceEvaluation.Validate("Supervisor Staff No.");
            PerfomanceEvaluation.Description := description;
            if PerfomanceEvaluation.Modify(true) then begin
                FnLoadCompetencies(PerfomanceEvaluation.No);
                FnAppraisalSuggestObjectivesOutcomes(PerfomanceEvaluation.No);
                status := 'success*New appraisal created*' + PerfomanceEvaluation.No;
            end else begin
                status := 'danger*New appraisal was not created*';
            end;
        end else begin
            PerfomanceEvaluation.Init;
            PerfomanceEvaluation."Employee No." := empNo;
            PerfomanceEvaluation.Validate("Employee No.");
            PerfomanceEvaluation."Strategy Plan ID" := strategicPlan;
            PerfomanceEvaluation.Validate("Strategy Plan ID");
            PerfomanceEvaluation."Performance Mgt Plan ID" := Pmp;
            PerfomanceEvaluation.Validate("Performance Mgt Plan ID");
            PerfomanceEvaluation."Performance Task ID" := Tasks;
            PerfomanceEvaluation.Validate("Performance Task ID");
            PerfomanceEvaluation."Personal Scorecard ID" := personalSC;
            PerfomanceEvaluation.Validate("Personal Scorecard ID");
            PerfomanceEvaluation."Supervisor Staff No." := supervisor;
            PerfomanceEvaluation.Validate("Supervisor Staff No.");
            PerfomanceEvaluation.Description := description;
            if PerfomanceEvaluation.Insert(true) then begin
                FnLoadCompetencies(PerfomanceEvaluation.No);
                FnAppraisalSuggestObjectivesOutcomes(PerfomanceEvaluation.No);
                status := PerfomanceEvaluation.No;
            end else begin
                status := 'danger*New appraisal was not created*';
            end;
        end;
    end;

    procedure FnLoadCompetencies(docNo: Code[100]) status: Text
    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        SPMGeneralSetup: Record "SPM General Setup";
        AchievedTarget: Decimal;
        PlogLines: Record "Plog Lines";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PCJobDescription: Record "PC Job Description";
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            CompetencyLines.Reset;
            CompetencyLines.SetRange("Competency Template ID", PerfomanceEvaluation."Competency Template ID");
            //CompetencyLines.SetRange("Job Grade", PerfomanceEvaluation."Current Grade");
            if CompetencyLines.FindSet then begin
                repeat
                    ProEvaluation.Init;
                    ProEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                    ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                    ProEvaluation."Competency Template ID" := PerfomanceEvaluation."Competency Template ID";
                    ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                    ProEvaluation.Validate("Competency Code");
                    ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                    ProEvaluation."Competency Description" := CompetencyLines."Competency Description";
                    ProEvaluation.Description := CompetencyLines.Description;
                    ProEvaluation."Profiency Rating Scale" := PerfomanceEvaluation."Proficiency Rating Scale";
                    ProEvaluation."Target Qty" := CompetencyLines."Weight %";
                    ProEvaluation."Weight %" := CompetencyLines."Weight %";
                    if ProEvaluation.Insert(true) then begin
                        status := 'success*success*';
                    end else begin
                        status := 'danger*failed*';
                    end;
                until CompetencyLines.Next = 0;
            end;
        end;
    end;

    // procedure FnAddEvaluationPIP(docNo: Code[100]; category: Code[100]; description: Text) status: Text
    // var
    //     EvaluationPIP: Record "Evaluation PIP";
    // begin
    //     EvaluationPIP.Init;
    //     EvaluationPIP."Perfomance Evaluation No" := docNo;
    //     EvaluationPIP."PIP Category" := category;
    //     EvaluationPIP.Description := description;
    //     if EvaluationPIP.Insert(true) then begin
    //         status := 'success*Evaluation PIP has been added successfully';
    //     end else begin
    //         status := 'danger*Evaluation PIP was not saved, please try again!';
    //     end;
    // end;

    procedure fnGenerateStandardAppraisalReport(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        BlobInStream: InStream;
        BlobOutStream: OutStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        RecRef: RecordRef;
        ImageEx: Boolean;
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            RecRef.GetTable(PerfomanceEvaluation);
            if ImageEx = true then begin
                // if FILE.Exists(FILESPATH + docNo + '.pdf') then begin
                //     FILE.Erase(FILESPATH + docNo + '.pdf');
                Report.SaveAs(80016, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80016, FILESPATH + docNo + '.pdf', PerfomanceEvaluation);
                status := 'success*Generated*Downloads\StandardAppraisalReport\' + docNo + '.pdf';
            end else begin
                Report.SaveAs(80016, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                status := 'success*Generated*Downloads\StandardAppraisalReport\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGeneratePlogReport(docNo: Code[100]) status: Text
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, docNo);
        if PerformanceDiaryLog.FindSet then begin
            RecRef.GetTable(PerformanceDiaryLog);
            if ImageEx = true then begin
                Report.SaveAs(80011, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80011, FILESPATH + docNo + '.pdf', PerformanceDiaryLog);
                status := 'success*Generated*finance\PlogReport\' + docNo + '.pdf';
            end else begin
                Report.SaveAs(80011, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80011, FILESPATH + docNo + '.pdf', PerformanceDiaryLog);
                status := 'success*Generated*finance\PlogReport\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateIndividualPcReport(docNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, docNo);
        if PerfomanceContractHeader.FindSet then begin
            RecRef.GetTable(PerfomanceContractHeader);
            if ImageEx = true then begin
                Report.SaveAs(80007, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80007, FILESPATH + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*finance\IndividualPCReport\' + docNo + '.pdf';
            end else begin
                Report.SaveAs(80007, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80007, FILESPATH + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*finance\IndividualPCReport\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateIndividualPcSubIndicatorReport(docNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, docNo);
        if PerfomanceContractHeader.FindSet then begin
            RecRef.GetTable(PerfomanceContractHeader);
            if ImageEx = true then begin
                Report.SaveAs(80024, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80024, FILESPATH + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\IndividualSubIndicator\' + docNo + '.pdf';
            end else begin
                Report.SaveAs(80024, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80024, FILESPATH + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\IndividualSubIndicator\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnInsertJDTargets(lineno: Code[100]; workplanno: Code[100]; annualtarget: Integer; assignedtarget: Integer) status: Text
    var
        PCJobDescription: Record "PC Job Description";
    begin
        PCJobDescription.Reset;
        PCJobDescription.SetRange("Line Number", lineno);
        PCJobDescription.SetRange("Workplan No.", workplanno);
        if PCJobDescription.FindSet then begin
            PCJobDescription."Start Date" := Today;
            PCJobDescription."Due Date" := Today;
            PCJobDescription."Imported Annual Target Qty" := annualtarget;
            PCJobDescription."Assigned Weight (%)" := assignedtarget;
            if PCJobDescription.Modify(true) then begin
                status := 'success*Your Plog target were submitted successfully!*';
            end else begin
                status := 'danger*Your Plog target were not saved successfully, kindly try again!*';
            end;
        end;
    end;

    procedure FnSuggestJD(workplan: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        SpmGeneralSetup: Record "SPM General Setup";
        JobResponsibilities: Record "Positions Responsibility";
        PCJobDescription: Record "PC Job Description";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, workplan);
        if PerfomanceContractHeader.FindSet then begin
            JobResponsibilities.Reset;
            JobResponsibilities.SetRange("Position ID", PerfomanceContractHeader.Position);
            if JobResponsibilities.Find('-') then begin
                repeat
                    PCJobDescription.Init;
                    PCJobDescription."Workplan No." := PerfomanceContractHeader.No;
                    PCJobDescription."Line Number" := Format(JobResponsibilities."Line No");
                    PCJobDescription.Validate("Line Number");
                    PCJobDescription.Description := JobResponsibilities.Description;
                    PCJobDescription."Primary Department" := PerfomanceContractHeader."Responsibility Center";
                    PCJobDescription.Validate("Primary Department");
                    PCJobDescription."Start Date" := PerfomanceContractHeader."Start Date";
                    PCJobDescription."Due Date" := PerfomanceContractHeader."End Date";
                    PCJobDescription.Insert(true);
                until JobResponsibilities.Next = 0;
            end;
        end;
    end;

    procedure fnGetAnnualWorkplanLines(csp: Code[100]; annualcode: Code[100]) AnnualLines: Text
    var
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
    begin
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange("Strategy Plan ID", csp);
        StrategyWorkplanLines.SetRange("Year Reporting Code", annualcode);
        if StrategyWorkplanLines.FindSet then begin
            repeat
                AnnualLines := AnnualLines + '*' + StrategyWorkplanLines."Activity ID" + '*' + StrategyWorkplanLines.Description;// + '*' + StrategyWorkplanLines."Primary Directorate Name" + ':';
            until StrategyWorkplanLines.Next = 0;
        end;
        exit(AnnualLines);
    end;

    procedure fnInsertSelectedAdditionalActivities(csp: Code[100]; annualcode: Code[100]; personalPc: Code[100]; activityID: Code[100]) status: Text
    var
        SecondaryPCObjective: Record "Secondary PC Objective";
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange("Activity ID", activityID);
        StrategyWorkplanLines.SetRange("Strategy Plan ID", csp);
        StrategyWorkplanLines.SetRange("Year Reporting Code", annualcode);
        if StrategyWorkplanLines.FindSet then begin
            PerfomanceContractHeader.Reset;
            PerfomanceContractHeader.SetRange(No, personalPc);
            if PerfomanceContractHeader.FindSet then begin
                SecondaryPCObjective.Init;
                SecondaryPCObjective."Workplan No." := personalPc;
                SecondaryPCObjective."Initiative No." := activityID;
                SecondaryPCObjective."Strategy Plan ID" := StrategyWorkplanLines."Strategy Plan ID";
                SecondaryPCObjective."Year Reporting Code" := StrategyWorkplanLines."Year Reporting Code";
                SecondaryPCObjective."Primary Directorate" := StrategyWorkplanLines."Primary Directorate";
                SecondaryPCObjective."Unit of Measure" := StrategyWorkplanLines."Unit of Measure";
                SecondaryPCObjective."Outcome Perfomance Indicator" := StrategyWorkplanLines."Perfomance Indicator";
                SecondaryPCObjective."Objective/Initiative" := StrategyWorkplanLines.Description;
                SecondaryPCObjective."Start Date" := PerfomanceContractHeader."Start Date";
                SecondaryPCObjective."Due Date" := PerfomanceContractHeader."End Date";
                if SecondaryPCObjective.Insert(true) then begin
                    status := 'success*Inserted';
                end else begin
                    status := 'danger*Inserted';
                end;
            end;
        end;
    end;

    procedure fnGenerateCSPReport(docNo: Code[100]) status: Text
    var
        CorporateStrategicPlans: Record "Corporate Strategic Plans";
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        CorporateStrategicPlans.Reset;
        CorporateStrategicPlans.SetRange(Code, docNo);
        if CorporateStrategicPlans.FindSet then begin
            RecRef.GetTable(CorporateStrategicPlans);
            if ImageEx = true then begin
                Report.SaveAs(80001, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80001/, FILESPATH + docNo + '.pdf', CorporateStrategicPlans);
                status := 'success*Generated*finance\CSP\' + docNo + '.pdf';
            end else begin
                Report.SaveAs(80001, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80001, FILESPATH + docNo + '.pdf', CorporateStrategicPlans);
                status := 'success*Generated*finance\CSP\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateAWPReport(docNo: Code[100]) status: Text
    var
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        AnnualStrategyWorkplan.Reset;
        AnnualStrategyWorkplan.SetRange(No, docNo);
        if AnnualStrategyWorkplan.FindSet then begin
            RecRef.GetTable(AnnualStrategyWorkplan);
            if ImageEx = true then begin
                Report.SaveAs(80002, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80002, FILESPATH + docNo + '.pdf', AnnualStrategyWorkplan);
                status := 'success*Generated*finance\AWP\' + docNo + '.pdf';
            end else begin
                Report.SaveAs(80002, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                status := 'success*Generated*finance\AWP\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateBoardPCReport(docNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        HrSetup.get;
        FILESPATH := HrSetup."Portal Reports File Path";
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, docNo);
        if PerfomanceContractHeader.FindSet then begin
            RecRef.GetTable(PerfomanceContractHeader);
            if ImageEx = true then begin
                Report.SaveAs(80019, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80019, FILESPATH + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*finance\BoardPC\' + docNo + '.pdf';
            end else begin
                Report.SaveAs(80019, '', ReportFormat::Pdf, BlobOutStream, RecRef);
                // Report.SaveAsPdf(80019, FILESPATH + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*finance\BoardPC\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnSubmitStandardAppraisal(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            PerfomanceEvaluation."Document Status" := PerfomanceEvaluation."document status"::Evaluation;
            PerfomanceEvaluation."Approval Status" := PerfomanceEvaluation."approval status"::Released;
            if PerfomanceEvaluation.Modify(true) then begin
                status := 'success*Your appraisal has been sent to your supervisor for review';
            end else begin
                status := 'danger*Your appraisal could not be sent to your supervisor for review, kindy try again!';
            end;
        end;
    end;

    procedure fnCancelSubmitofStandardAppraisal(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            PerfomanceEvaluation."Document Status" := PerfomanceEvaluation."document status"::Draft;
            PerfomanceEvaluation."Approval Status" := PerfomanceEvaluation."approval status"::Open;
            if PerfomanceEvaluation.Modify(true) then begin
                status := 'success*Your appraisal submission to your supervisor was successfully cancelled';
            end else begin
                status := 'danger*Your appraisal submission to your supervisor was not cancelled, kindy try again!';
            end;
        end;
    end;

    procedure fnSubmitStandardAppraisalObj(docNo: Code[100]; lineno: Integer; appraiserQty: Decimal; comments: Text) status: Text
    var
        ObjectiveEvaluationResult: Record "Objective Evaluation Result";
        tDoc: Code[100];
    begin
        ObjectiveEvaluationResult.Reset;
        ObjectiveEvaluationResult.SetRange("Line No", lineno);
        ObjectiveEvaluationResult.SetRange("Performance Evaluation ID", docNo);
        if ObjectiveEvaluationResult.FindSet then begin
            ObjectiveEvaluationResult."AppraiserReview Qty" := appraiserQty;
            ObjectiveEvaluationResult."Final/Actual Qty" := appraiserQty;
            //ObjectiveEvaluationResult.Comments := comments;
            if ObjectiveEvaluationResult.Modify(true) then begin
                status := 'success*Employee appraisal has been submitted successfully';
            end else begin
                status := 'danger*Employee appraisal could not be submitted, kindy try again!';
            end;
        end;
    end;

    procedure fnSubmitStandardAppraisalPE(docNo: Code[100]; lineno: Integer; appraiserQty: Decimal; comments: Text) status: Text
    var
        ProficiencyEvaluationResult: Record "Proficiency Evaluation Result";
        tDoc: Code[100];
    begin
        ProficiencyEvaluationResult.Reset;
        ProficiencyEvaluationResult.SetRange("Line No", lineno);
        ProficiencyEvaluationResult.SetRange("Performance Evaluation ID", docNo);
        if ProficiencyEvaluationResult.FindSet then begin
            ProficiencyEvaluationResult."AppraiserReview Qty" := appraiserQty;
            ProficiencyEvaluationResult."Final/Actual Qty" := appraiserQty;
            // ProficiencyEvaluationResult.Comments := comments;
            if ProficiencyEvaluationResult.Modify(true) then begin
                status := 'success*Employee appraisal has been submitted successfully';
            end else begin
                status := 'danger*Employee appraisal could not be submitted, kindy try again!';
            end;
        end;
    end;

    // procedure fnInsertStandardAppraisalPIP(docNo: Code[100]; pipcategory: Code[100]; desc: Text) status: Text
    // var
    //     EvaluationPIP: Record "Evaluation PIP";
    //     tDoc: Code[100];
    // begin
    //     EvaluationPIP.Init;
    //     EvaluationPIP."Perfomance Evaluation No" := docNo;
    //     EvaluationPIP."PIP Category" := pipcategory;
    //     EvaluationPIP.Description := desc;
    //     if EvaluationPIP.Insert(true) then begin
    //         status := 'success*Employee appraisal has been submitted successfully';
    //     end else begin
    //         status := 'danger*Employee appraisal could not be submitted, kindy try again!';
    //     end;
    // end;

    // procedure fnEditStandardAppraisalPIP(docNo: Code[100]; lineno: Integer; pipcategory: Code[100]; desc: Text) status: Text
    // var
    //     EvaluationPIP: Record "Evaluation PIP";
    //     tDoc: Code[100];
    // begin
    //     EvaluationPIP.Reset;
    //     EvaluationPIP.SetRange("PIP Number", lineno);
    //     EvaluationPIP.SetRange("Perfomance Evaluation No", docNo);
    //     if EvaluationPIP.FindSet then begin
    //         EvaluationPIP."PIP Category" := pipcategory;
    //         EvaluationPIP.Description := desc;
    //         if EvaluationPIP.Modify(true) then begin
    //             status := 'success*Employee appraisal has been submitted successfully';
    //         end else begin
    //             status := 'danger*Employee appraisal could not be submitted, kindy try again!';
    //         end;
    //     end;
    // end;

    // procedure fnRemoveStandardAppraisalPIP(docNo: Code[100]; lineno: Integer) status: Text
    // var
    //     EvaluationPIP: Record "Evaluation PIP";
    //     tDoc: Code[100];
    // begin
    //     EvaluationPIP.Reset;
    //     EvaluationPIP.SetRange("PIP Number", lineno);
    //     EvaluationPIP.SetRange("Perfomance Evaluation No", docNo);
    //     if EvaluationPIP.FindSet then begin
    //         if EvaluationPIP.Delete(true) then begin
    //             status := 'success*The line has been successfully removed';
    //         end else begin
    //             status := 'danger*The line would not be removed, kindy try again!';
    //         end;
    //     end;
    // end;

    procedure fnInsertStandardAppraisalTrainigNeeds(docNo: Code[100]; category: Code[100]; desc: Text) status: Text
    var
        EvaluationTrainingneeds: Record "Evaluation Training needs";
        tDoc: Code[100];
    begin
        EvaluationTrainingneeds.Init;
        EvaluationTrainingneeds."Perfomance Evaluation No" := docNo;
        EvaluationTrainingneeds."Training Need Category" := category;
        EvaluationTrainingneeds.Description := desc;
        if EvaluationTrainingneeds.Insert(true) then begin
            status := 'success*Employee appraisal training needs has been submitted successfully';
        end else begin
            status := 'danger*Employee appraisal could not be submitted, kindy try again!';
        end;
    end;

    procedure fnRemoveStandardAppraisalTrainigNeeds(docNo: Code[100]; lineno: Integer) status: Text
    var
        EvaluationTrainingneeds: Record "Evaluation Training needs";
        tDoc: Code[100];
    begin
        EvaluationTrainingneeds.Reset;
        EvaluationTrainingneeds.SetRange("Training Need Number", lineno);
        EvaluationTrainingneeds.SetRange("Perfomance Evaluation No", docNo);
        if EvaluationTrainingneeds.FindSet then begin
            if EvaluationTrainingneeds.Delete(true) then begin
                status := 'success*The line has been successfully removed';
            end else begin
                status := 'danger*The line would not be removed, kindy try again!';
            end;
        end;
    end;

    procedure fnEditStandardAppraisalTrainigNeeds(docNo: Code[100]; lineno: Integer; category: Code[100]; desc: Text) status: Text
    var
        EvaluationTrainingneeds: Record "Evaluation Training needs";
        tDoc: Code[100];
    begin
        EvaluationTrainingneeds.Reset;
        EvaluationTrainingneeds.SetRange("Training Need Number", lineno);
        EvaluationTrainingneeds.SetRange("Perfomance Evaluation No", docNo);
        if EvaluationTrainingneeds.FindSet then begin
            EvaluationTrainingneeds."Training Need Category" := category;
            EvaluationTrainingneeds.Description := desc;
            if EvaluationTrainingneeds.Modify(true) then begin
                status := 'success*Employee appraisal has been submitted successfully';
            end else begin
                status := 'danger*Employee appraisal could not be submitted, kindy try again!';
            end;
        end;
    end;

    procedure fnSubmitStandardAppraisalConfirmation(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        tDoc: Code[100];
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            //PerfomanceEvaluation."Employee Confirm" := true;
            //PerfomanceEvaluation."Supervisor Confirm" := true;
            PerfomanceEvaluation."Document Status" := PerfomanceEvaluation."document status"::Submitted;
            if PerfomanceEvaluation.Modify(true) then begin
                // fnSendAppraisalEmail(PerfomanceEvaluation.No);
                status := 'success*Employee appraisal has been submitted successfully';
            end else begin
                status := 'danger*Employee appraisal could not be submitted, kindy try again!';
            end;
        end;
    end;

    // procedure fnSendAppraisalEmail(docNo: Code[100]) status: Text
    // var
    //     PerfomanceEvaluation: Record "Perfomance Evaluation";
    //     SupplierReq: Record Contact;
    //     LastFieldNo: Integer;
    //     FooterPrinted: Boolean;
    //     FileDirectory: Text[100];
    //     FileName: Text[100];
    //     ReportID: Integer;
    //     ////"Object": Record "Object";
    //     Window: Dialog;
    //     RunOnceFile: Text[1000];
    //     TimeOut: Integer;
    //     Customer2: Record Customer;
    //     Cust: Record Customer;
    //     cr: Integer;
    //     lf: Integer;
    //     EmailBody: array[2] of Text[30];
    //     BodyText: Text[250];
    //     mymail: Codeunit Mail;
    //     DefaultPrinter: Text[200];
    //     WindowisOpen: Boolean;
    //     FileDialog: Codeunit Mail;
    //     SendingDate: Date;
    //     SendingTime: Time;
    //     Counter: Integer;
    //     cu400: Codeunit Mail;
    //     DocLog: Record "Document E-mail Log";
    //     BranchName: Code[80];
    //     DimValue: Record "Dimension Value";
    //     SenderAddress: Text[100];
    //     CustEmail: Text[100];
    //     UserSetup: Record "User Setup";
    //     HRSetup: Record "Company Information";
    //     Emp: Record Vendor;
    //     PayrollMonth: Date;
    //     PayrollMonthText: Text[30];
    //     PayPeriodtext: Text;
    //     PayPeriod: Record "Payroll PeriodX";
    //     CompInfo: Record "Company Information";
    //     DateFilter: Text;
    //     FromDate: Date;
    //     ToDate: Date;
    //     FromDateS: Text;
    //     ToDateS: Text;
    //     vend: Record Vendor;
    //     StartDate: Date;
    //     EndDAte: Date;
    //     EmailVerifier: Codeunit Payroll3;
    //     IsEmailValid: Boolean;
    //     PPayableSetup: Record "Procurement Setup";
    //     RequesterName: Text[100];
    //     RequesterEmail: Text[100];
    //     emailhdr: Text[100];
    //     CompanyDetails: Text[250];
    //     SupplierDetails: Text[1000];
    //     SenderMessage: Text[1000];
    //     ProcNote: Text[1000];
    //     LoginDetails: Text[1000];
    //     PortalUser: Record "Dynasoft Portal User";
    //     Password: Text[50];
    //     ActivationDetails: Text[1000];
    //     IFSCommitteMembers: Record "IFS Tender Committee Member";
    //     IFS: Record "Standard Purchase Code";
    //     CommitteType: Record "Procurement Committee Types";
    //     CommitteMembers: Record "IFS Tender Committee";
    // begin
    //     PerfomanceEvaluation.Reset;
    //     PerfomanceEvaluation.SetRange(No, docNo);
    //     if PerfomanceEvaluation.FindSet then begin
    //         HRSetup.Get;

    //         Employee.Reset;
    //         Employee.SetRange(Employee."No.", PerfomanceEvaluation."Employee No.");
    //         if Employee.FindSet then begin
    //             RequesterEmail := Employee."Company E-Mail";
    //             RequesterName := PerfomanceEvaluation."Employee Name";

    //             Counter := Counter + 1;

    //             if HRSetup."E-Mail" = '' then
    //                 Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
    //             SenderAddress := HRSetup."E-Mail";

    //             CompanyDetails := 'Dear,  ' + RequesterName;
    //             SenderMessage := '<BR>This is to notify you that your appraisal was successfully submitted: ' + PerfomanceEvaluation.No + '</BR>';
    //             LoginDetails := 'Attached herein, please find an e-copy of your aappraisal report';

    //             FileDirectory := 'C:\DOCS\';
    //             FileName := 'AppraisalReport_' + PerfomanceEvaluation.No + '.pdf';

    //             PerfomanceEvaluation.Reset;
    //             PerfomanceEvaluation.SetRange(No, PerfomanceEvaluation.No);
    //             if PerfomanceEvaluation.FindSet then begin
    //                 // Report.SaveAsPdf(80016, FileDirectory + FileName, PerfomanceEvaluation);
    //             end;

    //             //emailhdr := 'PERFORMANCE APPRAISAL ' + PerfomanceEvaluation.No;
    //             //cu400.CreateMessage(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
    //             //CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
    //             //cu400.AddAttachment(FileDirectory + FileName, FileName);
    //             //cu400.AddBodyline(ProcNote);
    //             // cu400.Send;
    //             //SendingDate := Today;
    //             // SendingTime := Time;
    //         end;
    //     end;
    // end;

    // procedure addTrainingParticipants(type: Text[100]; participantEmpno: Text[100]; Destination: Text[100]; noOfDays: Decimal; reqNo: Text[100]) status: Text
    // var
    //     TrainingParticipants: Record "Training Participants";
    //     TrainingRequests: Record "Training Requests";
    // begin
    //     TrainingRequests.Reset;
    //     TrainingRequests.SetRange(Code, reqNo);
    //     if TrainingRequests.FindSet then begin
    //         TrainingParticipants.Reset;
    //         TrainingParticipants.SetRange("Training Code", reqNo);
    //         TrainingParticipants.SetRange("Employee Code", participantEmpno);
    //         if TrainingParticipants.FindSet then begin
    //             status := 'error*The participants already exists.'
    //         end else begin
    //             TrainingParticipants.Init;
    //             TrainingParticipants.Type := type;
    //             TrainingParticipants."Employee Code" := participantEmpno;
    //             TrainingParticipants.Validate("Employee Code");
    //             TrainingParticipants.Destination := Destination;
    //             TrainingParticipants.Validate(Destination);
    //             TrainingParticipants."Training Code" := reqNo;
    //             TrainingParticipants."No. of Days" := noOfDays;
    //             TrainingParticipants.Validate("No. of Days");
    //             //TrainingParticipants.Destination:=TrainingRequests."Training Venue Region";
    //             if TrainingParticipants.Insert(true) then begin
    //                 status := 'success*Training Participant successfully added';
    //             end else begin
    //                 status := 'danger*Training Participant was not added, please try again!';
    //             end
    //         end;
    //     end;
    // end;

    // procedure editTrainingParticipants(lineno: Integer; type: Text[100]; teammember: Text[100]; noOfDays: Integer; docNo: Code[100]) status: Text
    // begin
    //     TrainingParticipants.Reset;
    //     TrainingParticipants.SetRange("Training Code", docNo);
    //     TrainingParticipants.SetRange("Line No", lineno);
    //     if TrainingParticipants.FindSet then begin
    //         TrainingParticipants.Type := type;
    //         TrainingParticipants."Employee Code" := teammember;
    //         //TrainingParticipants.VALIDATE("Employee Code");
    //         TrainingParticipants."No. of Days" := noOfDays;
    //         TrainingParticipants.Validate("No. of Days");
    //         if TrainingParticipants.Modify(true) then begin
    //             status := 'success*The training Participant was successfully updated';
    //         end else begin
    //             status := 'error*The participant could not be updated.Please try again!';
    //         end;
    //     end;
    // end;

    // procedure deleteTrainingParticipants(id: Integer; reqNo: Text[100]) status: Text
    // begin
    //     TrainingParticipants.Reset;
    //     TrainingParticipants.SetRange("Training Code", reqNo);
    //     TrainingParticipants.SetRange("Line No", id);
    //     if TrainingParticipants.FindSet then begin
    //         TrainingParticipants.Delete;
    //         status := 'success*Participant was successfully removed';
    //     end else begin
    //         status := 'error*The participant could not be removed. Please try again!';
    //     end
    // end;

    procedure addTrainingCost(docNo: Code[100]; costcategory: Integer; unitcost: Decimal; quantity: Integer; description: Text) status: Text
    var
        TrainingCost: Record "Training Cost";
        TrainingRequests: Record "Training Requests";
    begin
        TrainingRequests.Reset;
        TrainingRequests.SetRange(Code, docNo);
        if TrainingRequests.FindSet then begin
            TrainingCost.Init;
            TrainingCost."Training ID" := docNo;
            //  TrainingCost."Employee No.":=empNo;
            //  TrainingCost.VALIDATE("Employee No.");
            TrainingCost."Cost Category" := costcategory;
            TrainingCost."Unit Cost (LCY)" := unitcost;
            TrainingCost.Quantity := quantity;
            TrainingCost.Validate(Quantity);
            TrainingCost.Description := description;
            if TrainingCost.Insert(true) then begin
                status := 'success*The training cost was successfully added*';
            end else begin
                status := 'danger*The training cost was not added, please try again';
            end;
        end;
    end;

    procedure RemoveTrainingCost(docNo: Code[100]; lineno: Integer) status: Text
    var
        TrainingCost: Record "Training Cost";
        TrainingRequests: Record "Training Requests";
    begin
        TrainingCost.Reset;
        TrainingCost.SetRange("Training ID", docNo);
        //TrainingCost.SETRANGE("Line No",lineno);
        if TrainingCost.FindSet then begin
            if TrainingCost.Delete(true) then begin
                status := 'success*The training cost was successfully removed*';
            end else begin
                status := 'danger*The training cost was not removed, please try again';
            end;
        end;
    end;

    procedure FnAppraisalSuggestObjectivesOutcomes(docNo: Code[100]) status: Text
    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        SPMGeneralSetup: Record "SPM General Setup";
        AchievedTarget: Decimal;
        PlogLines: Record "Plog Lines";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PCJobDescription: Record "PC Job Description";
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        SubObjectiveEvaluation: Record "Sub Objective Evaluation";
        SubPCObjective: Record "Sub PC Objective";
        AchievedSubActivityTarget: Decimal;
        SubPlogLines: Record "Sub Plog Lines";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            SPMGeneralSetup.Get;
            SPMGeneralSetup.TestField("Appraisal Based On");

            if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Direct Input" then begin
                SPMGeneralSetup.Get();
                if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if PCObjective.FindFirst then begin
                        repeat
                            PCObjective.TestField("Due Date");
                        until PCObjective.Next = 0;
                    end;

                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    PCObjective.TestField("Due Date");
                    PCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCObjective.FindFirst then begin
                        repeat
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                            // ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                            //Sub Objective OutCome
                            SubPCObjective.Reset;
                            SubPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                            SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                            if SubPCObjective.FindSet then begin
                                repeat
                                    SubObjectiveEvaluation.Init;
                                    SubObjectiveEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                                    SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                    SubObjectiveEvaluation."Scorecard ID" := PCObjective."Workplan No.";
                                    SubObjectiveEvaluation."Intiative No" := PCObjective."Initiative No.";
                                    SubObjectiveEvaluation."Objective/Initiative" := PCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                    SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Primary Directorate" := PerfomanceEvaluation.Directorate;
                                    SubObjectiveEvaluation."Primary Department" := PerfomanceEvaluation.Department;
                                    SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    // SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                    SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                    SubObjectiveEvaluation."Target Qty" := PCObjective."Imported Annual Target Qty";
                                    SubObjectiveEvaluation."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                                    SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                    SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                    // SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                    SubObjectiveEvaluation.Insert(true);

                                until SubPCObjective.Next = 0;
                            end;
                        //End Sub Objective OutCome
                        until PCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                        //SecondaryPCObjective.TESTFIELD("Due Date");
                        until SecondaryPCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    SecondaryPCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                            //Insert Sub Objective Outcome
                            //Sub Objective OutCome
                            SubPCObjective.Reset;
                            SubPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                            SubPCObjective.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                            if SubPCObjective.FindSet then begin
                                repeat
                                    SubObjectiveEvaluation.Init;
                                    SubObjectiveEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                                    SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                    SubObjectiveEvaluation."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                    SubObjectiveEvaluation."Intiative No" := SecondaryPCObjective."Initiative No.";
                                    SubObjectiveEvaluation."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                    SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Primary Directorate" := PerfomanceEvaluation.Directorate;
                                    SubObjectiveEvaluation."Primary Department" := PerfomanceEvaluation.Department;
                                    SubObjectiveEvaluation."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    SubObjectiveEvaluation."Key Performance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                    SubObjectiveEvaluation."Target Qty" := PCObjective."Imported Annual Target Qty";
                                    SubObjectiveEvaluation."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                                    SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                    SubObjectiveEvaluation."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                                    // SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                    SubObjectiveEvaluation.Insert(true);

                                until SubPCObjective.Next = 0;
                            end;
                        //End Sub Objective OutCome
                        //End Insert Sub Objective Outcome

                        until SecondaryPCObjective.Next = 0;
                    end;
                end;

                if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                    PCJobDescription.Reset;
                    PCJobDescription.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    PCJobDescription.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCJobDescription.FindFirst then begin
                        repeat
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                            ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                            ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Key Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                        until PCJobDescription.Next = 0;
                    end;
                end;
            end;

            if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Plog Input" then begin
                SPMGeneralSetup.Get();
                if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if PCObjective.FindFirst then begin
                        repeat
                            PCObjective.TestField("Due Date");
                        until PCObjective.Next = 0;
                    end;

                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    //PCObjective.TESTFIELD("Due Date");
                    PCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCObjective.FindFirst then begin
                        repeat

                            AchievedTarget := 0;
                            PlogLines.Reset;
                            PlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                            PlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                            PlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            PlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            /* IF AchievedTarget=0 THEN
                                ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date");*/

                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                            ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                            ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                            ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                            ObjectiveOutcome.Validate("Final/Actual Qty");
                            ObjectiveOutcome.Insert;

                            //Sub Objective OutCome
                            AchievedSubActivityTarget := 0;
                            SubPlogLines.Reset;
                            SubPlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                            SubPlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                            SubPlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            SubPlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            SubPCObjective.Reset;
                            SubPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                            SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                            if SubPCObjective.FindSet then begin
                                repeat
                                    SubObjectiveEvaluation.Init;
                                    SubObjectiveEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                                    SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                    SubObjectiveEvaluation."Scorecard ID" := SubPCObjective."Workplan No.";
                                    SubObjectiveEvaluation."Intiative No" := SubPCObjective."Initiative No.";
                                    SubObjectiveEvaluation."Objective/Initiative" := SubPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                    SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Primary Directorate" := PerfomanceEvaluation.Directorate;
                                    SubObjectiveEvaluation."Primary Department" := PerfomanceEvaluation.Department;
                                    SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    //SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                    SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                    SubObjectiveEvaluation."Target Qty" := SubPCObjective."Sub Targets";
                                    SubObjectiveEvaluation."Self-Review Qty" := AchievedSubActivityTarget;
                                    SubObjectiveEvaluation."AppraiserReview Qty" := AchievedSubActivityTarget;
                                    SubObjectiveEvaluation."Final/Actual Qty" := AchievedSubActivityTarget;
                                    SubObjectiveEvaluation.Validate("Final/Actual Qty");
                                    SubObjectiveEvaluation."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                                    SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                    SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                    //SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                    SubObjectiveEvaluation.Insert(true);

                                until SubPCObjective.Next = 0;
                            end;
                        //End Sub Objective OutCome


                        until PCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                        //SecondaryPCObjective.TESTFIELD("Due Date");
                        until SecondaryPCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    SecondaryPCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                            AchievedTarget := 0;
                            PlogLines.Reset;
                            PlogLines.SetRange("Personal Scorecard ID", SecondaryPCObjective."Workplan No.");
                            PlogLines.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                            PlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            PlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            /* IF AchievedTarget=0 THEN
                                ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date"); */


                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                            ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                            ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                            ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                        until SecondaryPCObjective.Next = 0;
                    end;
                end;
                if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                    PCJobDescription.Reset;
                    PCJobDescription.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    PCJobDescription.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCJobDescription.FindFirst then begin
                        repeat
                            AchievedTarget := 0;
                            PlogLines.Reset;
                            PlogLines.SetRange("Personal Scorecard ID", PCJobDescription."Workplan No.");
                            PlogLines.SetRange("Initiative No.", Format(PCJobDescription."Line Number"));
                            PlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            PlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            /*IF AchievedTarget=0 THEN
                               ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date"); */
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                            ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                            ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Key Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                            ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                            ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                            ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                            ObjectiveOutcome.Validate("Final/Actual Qty");
                            ObjectiveOutcome.Insert(true);
                        until PCJobDescription.Next = 0;
                    end;
                end;
            end;
        end;

    end;

    local procedure FnGetLastLineNo() LineNumber: Integer
    var
        Billable: Record "Objective Evaluation Result";
    begin
        Billable.Reset;
        if Billable.Find('+') then
            LineNumber := Billable."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoB() LineNumber: Integer
    var
        ProEvalution: Record "Proficiency Evaluation Result";
    begin
        ProEvalution.Reset;
        if ProEvalution.Find('+') then
            LineNumber := ProEvalution."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    procedure FnInsertSubObjectiveEvaluation(lineno: Integer; docNo: Code[100]; initiativeNo: Code[100]; finalTarget: Decimal) status: Text
    var
        SubObjectiveEvaluation: Record "Sub Objective Evaluation";
    begin
        SubObjectiveEvaluation.Reset;
        SubObjectiveEvaluation.SetRange("Line No", lineno);
        SubObjectiveEvaluation.SetRange("Intiative No", initiativeNo);
        SubObjectiveEvaluation.SetRange("Performance Evaluation ID", docNo);
        if SubObjectiveEvaluation.FindSet then begin
            SubObjectiveEvaluation."Final/Actual Qty" := finalTarget;
            if SubObjectiveEvaluation.Modify(true) then begin
                status := 'success*The sub objectives outcome final quantity has been saved successfully';
            end else begin
                status := 'danger*The sub objectives outcome final quantity could not be saved, kindly try again!';
            end;
        end;
    end;

    procedure FnGetLastSubPcLineNo() LineNumber: Integer
    var
        Billable: Record "Sub Objective Evaluation";
    begin
    end;

    procedure fnMergePdfs(tenderNo: Text; finalDocument: Text) status: Text
    var
        isSuccess: Text;
        BaseUrl: Text;
        Method: Text;
        RestMethod: Text;
    // HttpContent: dotnet HttpContent;
    // HttpResponseMessage: dotnet HttpResponseMessage;
    // HttpClient: dotnet HttpClient;
    // Uri: dotnet Uri;
    begin

        // HttpClient := HttpClient.HttpClient();
        // HttpClient.BaseAddress := Uri.Uri(mergePdfsapiPath + tenderNo + '&&finalFile=' + finalDocument);
        // HttpResponseMessage := HttpClient.GetAsync(Method).Result;

        // exit(HttpResponseMessage.Content.ReadAsStringAsync().Result);
        // HttpResponseMessage.EnsureSuccessStatusCode();
    end;

    procedure fnCreateFolder(tenderNo: Text) status: Text
    var
        isSuccess: Text;
        BaseUrl: Text;
        Method: Text;
        RestMethod: Text;
    //HttpContent: dotnet HttpContent;
    // HttpResponseMessage: dotnet HttpResponseMessage;
    // HttpClient: dotnet HttpClient;
    //Uri: dotnet Uri;
    begin

        //  HttpClient := HttpClient.HttpClient();
        //  HttpClient.BaseAddress := Uri.Uri(createFolderapiPath + tenderNo);
        //HttpResponseMessage := HttpClient.GetAsync(Method).Result;

        // exit(HttpResponseMessage.Content.ReadAsStringAsync().Result);
        //HttpResponseMessage.EnsureSuccessStatusCode();
    end;

    local procedure fnCreateF() status: Text
    begin
        status := fnMergePdfs('IFS0061', 'FiNALdOC.pdf');
        exit(status);
    end;

    procedure FnCreateLeaveApplication(leaveNo: Code[20]; employeeNo: Code[20]; leaveType: Code[20]; annualLeaveType: Integer; days: Integer; startDate: Date; reliever: Code[20]; phone: Text; email: Text; examDetails: Text; examDate: Date; Comments: Text) status: Text
    var
        tbl_leaveApplications: Record "HR Leave Application";
    begin
        if leaveNo = '' then begin
            // tbl_leaveApplications.Reset();
            // tbl_leaveApplications.SetRange(Status, tbl_leaveApplications.Status::Open);
            // tbl_leaveApplications.SetRange("Employee No", employeeNo);
            // if tbl_leaveApplications.FindSet(true) then begin
            //     error('You have open leave application number: %1. Kindly use it.', leaveNo);
            //     status := 'Sorry, you already have an open leave application. Kindly use it.';
            // end;
            tbl_leaveApplications.Init;
            tbl_leaveApplications."Employee No" := employeeNo;
            tbl_leaveApplications.VALIDATE("Employee No");
            tbl_leaveApplications."Leave Type" := leaveType;
            HREmp.Reset;
            HREmp.SetRange(HREmp."No.", employeeNo);
            if HREmp.Find('-') then begin

                tbl_leaveApplications.Designation := HREmp."Job Title2";
                tbl_leaveApplications."Employee No" := HREmp."No.";
                tbl_leaveApplications."Employee Name" := HREmp.FullName();
                tbl_leaveApplications."Directorate Code" := HREmp."Directorate Code";
                tbl_leaveApplications."Directorate Name" := HREmp."Department Name";
                tbl_leaveApplications."Department Code" := HREmp."Department Code";
                tbl_leaveApplications.Division := HREmp.Division;
                tbl_leaveApplications."Shortcut Dimension 1 Code" := HREmp."Global Dimension 1 Code";
                tbl_leaveApplications."Shortcut Dimension 2 Code" := HREmp."Global Dimension 2 Code";
                tbl_leaveApplications."User ID" := HREmp."User ID";
            end;
            // tbl_leaveApplications.VALIDATE("Leave Type");
            tbl_leaveApplications."Annual Leave Type" := annualLeaveType;
            tbl_leaveApplications."Days Applied" := days;
            tbl_leaveApplications."Application Date" := Today;
            tbl_leaveApplications."Start Date" := startDate;
            tbl_leaveApplications.VALIDATE("Start Date");
            tbl_leaveApplications.Reliever := reliever;
            tbl_leaveApplications.VALIDATE(Reliever);
            tbl_leaveApplications."Cell Phone Number" := phone;
            tbl_leaveApplications."Applicant Comments" := Comments;
            tbl_leaveApplications."E-mail Address" := email;
            tbl_leaveApplications."Date of Exam" := examDate;
            tbl_leaveApplications."Details of Examination" := examDetails;
            // MESSAGE('%1', days);
            If tbl_leaveApplications.INSERT(false) then begin
                status := 'success*The leave application was successfull*' + tbl_leaveApplications."Application Code" + '*' + FORMAT(tbl_leaveApplications."Return Date");
            end ELSE BEGIN
                status := 'danger*The leave applicat was unsuccessful. Kindly try again later';
            END;
        end ELSE BEGIN
            tbl_leaveApplications.RESET;
            tbl_leaveApplications.SETRANGE("Application Code", leaveNo);
            tbl_leaveApplications.SETRANGE("Employee No", employeeNo);
            IF tbl_leaveApplications.FINDSET THEN BEGIN
                tbl_leaveApplications."Employee No" := employeeNo;
                tbl_leaveApplications.VALIDATE("Employee No");
                tbl_leaveApplications."Leave Type" := leaveType;
                //tbl_leaveApplications.VALIDATE("Leave Type");
                tbl_leaveApplications."Annual Leave Type" := annualLeaveType;
                tbl_leaveApplications."Days Applied" := days;
                tbl_leaveApplications."Start Date" := startDate;
                tbl_leaveApplications.VALIDATE("Start Date");
                tbl_leaveApplications.Reliever := reliever;
                tbl_leaveApplications.VALIDATE(Reliever);
                tbl_leaveApplications."Cell Phone Number" := phone;
                tbl_leaveApplications."E-mail Address" := email;
                tbl_leaveApplications."Date of Exam" := examDate;
                tbl_leaveApplications."Applicant Comments" := Comments;
                tbl_leaveApplications."Details of Examination" := examDetails;
                IF tbl_leaveApplications.MODIFY(false) THEN BEGIN
                    status := 'success*The leave application was successfull*' + tbl_leaveApplications."Application Code" + '*' + FORMAT(tbl_leaveApplications."Return Date");
                END ELSE BEGIN
                    status := 'danger*The leave application was unsuccessfull. Kindly try again later';
                END;
            end;
        end;
    end;

    procedure CreateLeaveApplication(employeeNo: Code[20]; leaveType: Code[20]; annualLeaveType: Integer; days: Integer; startDate: Date; reliever: Code[20]; phone: Text; email: Text; examDetails: Text; examDate: Date; Comments: Text) leaveNo: Text
    var
        tbl_leaveApplications: Record "HR Leave Application";
    begin
        if HrSetup.Get() then
            HrSetup.Testfield("Leave Application Nos.");


        tbl_leaveApplications.Reset();
        tbl_leaveApplications.SetRange(Status, tbl_leaveApplications.Status::Open);
        tbl_leaveApplications.SetRange("Employee No", employeeNo);
        tbl_leaveApplications.SetFilter("Application Code", '<>%1', '');
        if tbl_leaveApplications.FindSet(true) then begin
            error('You have open leave application number: %1. Kindly use it.', leaveNo);
            // status := 'Sorry, you already have an open leave application. Kindly use it.';
        end;
        leaveNo := NoSeriesMgt.GetNextNo(HrSetup."Leave Application Nos.", 0D, true);
        tbl_leaveApplications.Init;
        tbl_leaveApplications."Application Code" := leaveNo;
        tbl_leaveApplications."Employee No" := employeeNo;
        HREmp.Reset;
        HREmp.SetRange(HREmp."No.", employeeNo);
        if HREmp.Find('-') then begin

            tbl_leaveApplications.Designation := HREmp."Job Title2";
            tbl_leaveApplications."Employee No" := HREmp."No.";
            tbl_leaveApplications."Employee Name" := HREmp.FullName();
            tbl_leaveApplications."Directorate Code" := HREmp."Directorate Code";
            tbl_leaveApplications."Directorate Name" := HREmp."Department Name";
            tbl_leaveApplications."Department Code" := HREmp."Department Code";
            tbl_leaveApplications.Division := HREmp.Division;
            tbl_leaveApplications."Shortcut Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            tbl_leaveApplications."Shortcut Dimension 2 Code" := HREmp."Global Dimension 2 Code";
            tbl_leaveApplications."User ID" := HREmp."User ID";
            tbl_leaveApplications."Requester ID" := HREmp."User ID";
        end;
        tbl_leaveApplications."Application Date" := Today;
        tbl_leaveApplications."Leave Type" := leaveType;
        // tbl_leaveApplications.VALIDATE("Leave Type");
        tbl_leaveApplications."Annual Leave Type" := annualLeaveType;
        tbl_leaveApplications."Days Applied" := days;
        tbl_leaveApplications."Start Date" := startDate;
        tbl_leaveApplications.Reliever := reliever;
        tbl_leaveApplications."Cell Phone Number" := phone;
        tbl_leaveApplications."E-mail Address" := email;
        tbl_leaveApplications."Alternate Phone Number" := phone;
        tbl_leaveApplications."Date of Exam" := examDate;
        tbl_leaveApplications."Details of Examination" := examDetails;
        tbl_leaveApplications."Applicant Comments" := Comments;
        tbl_leaveApplications.INSERT(false);
        leaveNo := tbl_leaveApplications."Application Code";


        tbl_leaveApplications.RESET;
        tbl_leaveApplications.SETRANGE("Application Code", leaveNo);
        tbl_leaveApplications.SETRANGE("Employee No", employeeNo);
        IF tbl_leaveApplications.FINDSET THEN BEGIN
            tbl_leaveApplications.VALIDATE("Employee No");
            tbl_leaveApplications.VALIDATE("Start Date");
            tbl_leaveApplications.VALIDATE(Reliever);
            tbl_leaveApplications.MODIFY(false);

        end;

    end;

    procedure sendLeaveForApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text
    var
        ApprovalEntry: Record "Approval Entry";
        RecID: RecordID;
        FromRecRef: RecordRef;
        UserSet2: Record "User Setup";
    begin
        leaveApplications.RESET;
        leaveApplications.SETRANGE("Application Code", recordNo);
        leaveApplications.SETRANGE("Employee No", employeeNo);
        IF leaveApplications.FINDSET THEN BEGIN

            leaveApp := leaveApplications;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            UpdateApprovalEntrySenderID(69205, leaveApplications."Application Code", leaveApplications."Requester ID");

            IF leaveApplications.GET(leaveApplications."Application Code") THEN BEGIN
                IF leaveApplications.Status = leaveApplications.Status::Open THEN BEGIN
                    status := 'warning*Your leave application  could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your leave application was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

            FromRecRef.GETTABLE(leaveApplications);
            RecID := FromRecRef.RecordId;
            ApprovalEntry.Reset();
            //ApprovalEntry.SetRange("Record ID to Approve", RecID);
            ApprovalEntry.SetRange("Document No.", recordNo);
            ApprovalEntry.SetFilter(Status, '=%1', ApprovalEntry.Status::Open);
            if ApprovalEntry.Find('-') then begin
                repeat
                    if UserSet2.get(ApprovalEntry."Approver ID") then
                        if HREmp.Get(UserSet2."Employee No.") then
                            if HREmp."Phone No." <> '' then
                                SMS.SendSMS('254' + DelChr(HREmp."Phone No.", '<', '0'),
                                'A document has been sent to you for approval, kindly log in to approve ' + HRSetup."ESS Portal Link"
                                );
                // SendApprovalEmailAlert(recordNo, ApprovalEntry."Table ID", ApprovalEntry."Approver ID");
                until ApprovalEntry.Next() = 0;
            end;

        END ELSE BEGIN
            status := 'danger*The leave does not exist or you are not the requester';
        END;


        EXIT(status);

    end;

    procedure CanceLeaveApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text
    begin
        leaveApplications.RESET();
        leaveApplications.SETRANGE("Application Code", recordNo);
        leaveApplications.SETRANGE("Employee No", employeeNo);
        leaveApplications.SetRange(Status, leaveApplications.Status::"Pending Approval");
        IF leaveApplications.FINDSET THEN BEGIN
            leaveApp := leaveApplications;
            // IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
            CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
            IF leaveApplications.GET(leaveApplications."Application Code") THEN BEGIN
                IF leaveApplications.Status = leaveApplications.Status::"Pending Approval" THEN BEGIN
                    status := 'warning*Your leave application  could not be cancelled. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your leave application was successfully  cancelled';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;
        END ELSE BEGIN
            status := 'danger*The leave does not exist as pending approval or you are not the requester';
        END;
        EXIT(status);
    end;

    procedure FnInsertVehicleMaitenanceDetails(docNo: Code[100]; vehicleRegNo: Code[100]; employeeNo: Code[100]; odometerReading: Decimal; projectNo: Code[100]; taskNo: Code[100]; maintenanceCost: Decimal; vendor: Code[100]; description: Text; serviceCode: Code[20]; repairs: Text) status: Text
    var
        tbl_fuelMaintainanceRequisition: Record "Fuel & Maintenance Requisition";
        randomN: Code[100];
    begin
        tbl_fuelMaintainanceRequisition.RESET();
        tbl_fuelMaintainanceRequisition.SETRANGE("Requisition No", docNo);
        // tbl_fuelMaintainanceRequisition.SETRANGE("Requested By",employeeNo);
        IF tbl_fuelMaintainanceRequisition.FINDSET THEN BEGIN
            tbl_fuelMaintainanceRequisition."Vehicle Reg No" := vehicleRegNo;
            tbl_fuelMaintainanceRequisition."Odometer Reading" := odometerReading;
            tbl_fuelMaintainanceRequisition.Type := tbl_fuelMaintainanceRequisition.Type::Maintenance;
            // tbl_fuelMaintainanceRequisition."Project Number":=projectNo;
            //tbl_fuelMaintainanceRequisition."Task Number":=taskNo;
            //tbl_fuelMaintainanceRequisition."Maintenance Cost":=maintenanceCost;
            tbl_fuelMaintainanceRequisition."Vendor(Dealer)" := vendor;
            tbl_fuelMaintainanceRequisition.VALIDATE("Vendor(Dealer)");
            tbl_fuelMaintainanceRequisition.Description := description;
            tbl_fuelMaintainanceRequisition."Service Code" := serviceCode;
            tbl_fuelMaintainanceRequisition.VALIDATE("Service Code");
            // tbl_fuelMaintainanceRequisition."Service/ Repairs Done":=repairs;
            IF tbl_fuelMaintainanceRequisition.MODIFY(TRUE) THEN begin
                status := 'success*You have successfully updated your vehicle maintenance request.*' + tbl_fuelMaintainanceRequisition."Requisition No";
            end ELSE begin
                status := 'danger*Your vehicle maintenance request could not be submitted, kindly try again.';
            end
        end ELSE begin
            tbl_fuelMaintainanceRequisition.INIT;
            randomN := Format(Random(9000));
            tbl_fuelMaintainanceRequisition."Requisition No" := randomN;
            tbl_fuelMaintainanceRequisition.Type := tbl_fuelMaintainanceRequisition.Type::Maintenance;
            // tbl_fuelMaintainanceRequisition."Requested By":=employeeNo;
            tbl_fuelMaintainanceRequisition."Vehicle Reg No" := vehicleRegNo;
            tbl_fuelMaintainanceRequisition."Odometer Reading" := odometerReading;
            // tbl_fuelMaintainanceRequisition."Project Number":=projectNo;
            // tbl_fuelMaintainanceRequisition."Task Number":=taskNo;
            // tbl_fuelMaintainanceRequisition."Maintenance Cost":=maintenanceCost;
            tbl_fuelMaintainanceRequisition."Vendor(Dealer)" := vendor;
            tbl_fuelMaintainanceRequisition.VALIDATE("Vendor(Dealer)");
            tbl_fuelMaintainanceRequisition.Description := description;
            tbl_fuelMaintainanceRequisition."Service Code" := serviceCode;
            tbl_fuelMaintainanceRequisition.VALIDATE("Service Code");
            //  tbl_fuelMaintainanceRequisition."Service/ Repairs Done":=repairs;
            IF tbl_fuelMaintainanceRequisition.INSERT(TRUE) THEN begin
                status := 'success*You have successfully submitted your vehicle maintenance request.*' + tbl_fuelMaintainanceRequisition."Requisition No";
            end ELSE begin
                status := 'danger*Your vehicle maintenance request could not be submitted, kindly try again.';
            end;
        end;
    end;


    procedure editHelpDeskRequest(jobno: Code[50]; empNo: Code[50]; category: Text; description: Text) status: Text
    begin
        status := 'danger*Your ICT issue request was would not be captured';
        helpdesk.RESET;
        helpdesk.SETRANGE("Job No.", jobno);
        helpdesk.SETRANGE("Employee No", empNo);
        IF helpdesk.FINDSET THEN BEGIN
            helpdesk."ICT Issue Category" := category;
            //  helpdesk.VALIDATE("ICT Issue Category");
            helpdesk."Description of the issue" := description;
            //  helpdesk.VALIDATE("Description of the issue");
            IF helpdesk.MODIFY(TRUE) THEN BEGIN
                status := 'success*Your ICT issue request was successfully edited';
            END ELSE BEGIN
                status := 'danger*Your ICT issue request could not be edited';
            END;
        END;

    end;

    // add purchase requisition file link
    procedure addFileLinks(recordType: Text[100]; recordNo: Code[50]; filename: Text; fileLink: Text; extensionType: Text) status: Text
    var
        tbl_purchaseHeader: Record "Purchase Header";
        tbl_documentAttachments: Record "Document Attachment";
    begin
        if recordType = 'Purchase Requisition' then begin
            status := fnConvertFile(fileLink, extensionType, 38, filename, recordNo, 1);
        end else
            if recordType = 'Imprest Surrender' then begin
                status := fnConvertFile(fileLink, extensionType, 57000, filename, recordNo, 2);

            end else
                if recordType = 'Imprest Memo' then begin
                    status := fnConvertFile(fileLink, extensionType, 38, filename, recordNo, 3);

                end else
                    if recordType = 'Leave' then begin
                        status := fnConvertFile(fileLink, extensionType, 69205, filename, recordNo, 3);
                    end else
                        if recordType = 'ICTHelpDesk' then begin
                            status := fnConvertFile(fileLink, extensionType, 56050, filename, recordNo, 3);

                        end
    end;


    procedure fnConvertFile(fileLink: Text; extensionType: Text; tableId: Integer; fileName: Text; recordNo: Code[30]; documentType: Integer) status: Text
    var
        tbl_documentAttachments: Record "Document Attachment";
        importFile: File;
        fileInstream: InStream;
        fileId: Guid;

    begin
        tbl_documentAttachments.Reset();
        tbl_documentAttachments.Init();
        tbl_documentAttachments."Table ID" := tableId;
        tbl_documentAttachments."File Name" := fileName;
        if documentType = 1 then begin
            tbl_documentAttachments."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition";
        end;
        //  else if documentType = 2 then begin
        //                 tbl_documentAttachments."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition"

        // end else if documentType = 3 then begin
        //                 tbl_documentAttachments."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition";

        // end
        tbl_documentAttachments."Line No." := 10000;
        tbl_documentAttachments."No." := recordNo;
        tbl_documentAttachments."File Extension" := extensionType;
        if (extensionType.ToLower() = 'pdf') then begin
            tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::PDF;
        end else
            if (extensionType.ToLower() = 'docx') then begin
                tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Word;
            end
            else
                if (extensionType.ToLower() = 'xlsx') then begin
                    tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Excel;
                end else
                    if ((extensionType.ToLower() = 'png') OR (extensionType.ToLower() = 'jpeg') OR (extensionType.ToLower() = 'jpg')) then begin
                        tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Image;
                    end;
        // importFile.Open(fileLink);
        // importFile.CreateInstream(fileInstream);
        fileId := tbl_documentAttachments."Document Reference ID".ImportStream(fileInstream, fileName);
        if tbl_documentAttachments.Insert(true) then begin
            status := 'success*The document was successfully attached';
        end else begin
            status := 'error*An error occured during the process of creating a document link. kindly contact the administrator if this error persists';
        end;
        // importFile.Close;

    end;

    //approve record
    procedure fnApproveRequest(docNo: Code[20]; username: Text) data: Text
    var
        tbl_approvalEntry: Record "Approval Entry";
        approvalManagement: Codeunit "Approvals Mgmt.";
        Payrements: record payments;
    begin
        tbl_approvalEntry.reset();
        tbl_approvalEntry.SetRange("Document No.", docNo);
        tbl_approvalEntry.Setrange("Approver ID", username);
        tbl_approvalEntry.Setrange(Status, tbl_approvalEntry.Status::Open);
        if tbl_approvalEntry.findset(true) then begin
            approvalManagement.ApproveApprovalRequests(tbl_approvalEntry);
            Payrements.Reset();
            // Payrements.SetRange("No.", tbl_approvalEntry."Document No.");
            // if Payrements.FindFirst() then begin
            //     Payrements."Created By" := username;
            //     Payrements.Modify();
            // end;
            // check whether the record has been approved successfully
            tbl_approvalEntry.reset();
            tbl_approvalEntry.SetRange("Document No.", docNo);
            tbl_approvalEntry.Setrange("Approver ID", username);
            tbl_approvalEntry.SetRange(Status, tbl_approvalEntry.Status::Approved);
            if tbl_approvalEntry.findset(true) then begin
                data += 'success*The Record has been approved successfully';
            end else begin
                data += 'danger*Sorry, you could not approve the request. Kindly try again.'
            end;

        end else begin
            data += 'danger*Sorry, the record to be approved could not be found. You may have already approved it or you are not its approver. Kindly contact the ICT team for assistance';
        end;
        exit(data);

    end;


    procedure RejectApprovalRequest(docNo: Code[20]; username: Text) data: Text
    var
        tbl_approvalEntry: Record "Approval Entry";
        approvalManagement: Codeunit "Approvals Mgmt.";
    begin
        tbl_approvalEntry.reset();
        tbl_approvalEntry.SetRange("Document No.", docNo);
        tbl_approvalEntry.Setrange("Approver ID", username);
        tbl_approvalEntry.Setrange(Status, tbl_approvalEntry.Status::Open);
        if tbl_approvalEntry.findset(true) then begin
            approvalManagement.RejectApprovalRequests(tbl_approvalEntry);
            // check whether the record has been approved successfully
            tbl_approvalEntry.reset();
            tbl_approvalEntry.SetRange("Document No.", docNo);
            tbl_approvalEntry.Setrange("Approver ID", username);
            tbl_approvalEntry.SetRange(Status, tbl_approvalEntry.Status::Approved);
            if tbl_approvalEntry.findset(true) then begin
                data += 'success*The Record has been approved successfully';
            end else begin
                data += 'danger*Sorry, you could not approve the request. Kindly try again.'
            end;

        end else begin
            data += 'danger*Sorry, the record to be approved could not be found. You may have already approved it or you are not its approver. Kindly contact the ICT team for assistance';
        end;
        exit(data);

    end;


    procedure ImportStaffProfilePicture(EmpNo: Text; FileName: BigText; ClientFileName: Text)
    var
        FileManagement: Codeunit "File Management";
        //Convert: dotnet Convert;
        //MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
    //Bytes: dotnet Array;
    begin
        if HREmp.GET(EmpNo) then
            if ClientFileName <> '' then begin
                Clear(HREmp.Image);
                // Bytes := Convert.FromBase64String(FileName);
                // MemoryStream := MemoryStream.MemoryStream(Bytes);
                // HREmp.Image.ImportStream(MemoryStream, '', ClientFileName);
                // HREmp.Image.ImportFile(FileName, ClientFileName);
                if not HREmp.Modify(true) then
                    HREmp.Insert(true);
                //if FileManagement.DeleteServerFile(FileName) then;
            end;
    end;

    procedure UploadAttachedDocument(DocNo: Code[20]; FileName: Text[2000]; Attachment: BigText; TableID: Integer): Boolean
    var
        DocAttachment: Record "Document Attachment";
        FromRecRef: RecordRef;
        FileManagement: Codeunit "File Management";
        //Bytes: dotnet Array;
        // LegalH: Record "Legal Management";
        //Convert: dotnet Convert;
        //MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        // CurrPage: Page "Document Attachments";
        tableFound: Boolean;

        HRTraining: Record "Training Requests";
        InterBank: Record "Payments";
        PV: Record "Payments";
        ImpMemo: Record "Payments";
        //  ICTReq: Record "ICT General Requisition Header";
        StaffAdvanceHeader: Record "Payments";
        EmpReq: Record "Recruitment Requisition Header";
        StaffAdvanceSurr: Record "Payments";
        //  Induction: Record "HR Induction Schedule";
        //StaffInd: Record "HR Staff  Induction";
        LeaveT: Record "HR Leave Application";
        objPurchaseHeader: Record "Purchase Header";
        EmpTransfer: Record "Employee Transfers";
        DependantChange: record "Dependants Change";
        PayChangeAdvice: record "prBasic pay PCA";
        RequestHeader: Record "Request Header1";
    begin
        tableFound := false;
        if TableID = Database::"Request Header1" then begin

            RequestHeader.RESET;
            RequestHeader.SETRANGE("No.", DocNo);
            if RequestHeader.FIND('-') then begin
                FromRecRef.GETTABLE(RequestHeader);
            end;
            tableFound := true;
        end;
        if TableID = Database::"HR Leave Application" then begin

            LeaveT.RESET;
            LeaveT.SETRANGE(LeaveT."Application Code", DocNo);
            if LeaveT.FIND('-') then begin
                FromRecRef.GETTABLE(LeaveT);
            end;
            tableFound := true;
        end;
        if TableID = Database::"Employee Transfers" then begin

            EmpTransfer.RESET;
            EmpTransfer.SETRANGE(EmpTransfer."Document No", DocNo);
            if EmpTransfer.FIND('-') then begin
                FromRecRef.GETTABLE(EmpTransfer);
            end;
            tableFound := true;
        end;
        // if TableID = Database::"HR Leave Allocation Request" then begin

        //     LeaveReq.RESET;
        //     LeaveReq.SETRANGE(LeaveReq."No.", DocNo);
        //     if LeaveReq.FIND('-') then begin
        //         FromRecRef.GETTABLE(LeaveReq);
        //     end;
        //     tableFound := true;
        // end;
        if TableID = Database::"Purchase Header" then begin
            objPurchaseHeader.RESET;
            objPurchaseHeader.SETRANGE(objPurchaseHeader."No.", DocNo);
            if objPurchaseHeader.FIND('-') then begin
                FromRecRef.GETTABLE(objPurchaseHeader);
            end;
            tableFound := true;
        end;

        // if TableID = Database::"Store Requistion Header" then begin
        //     StoreRequisition.RESET;
        //     StoreRequisition.SETRANGE(StoreRequisition."No.", DocNo);
        //     if StoreRequisition.FIND('-') then begin
        //         FromRecRef.GETTABLE(StoreRequisition);
        //     end;
        //     tableFound := true;
        // end;

        // if TableID = Database::"Imprest Header" then begin
        //     ImprestRequisition.RESET;
        //     ImprestRequisition.SETRANGE(ImprestRequisition."No.", DocNo);
        //     if ImprestRequisition.FIND('-') then begin
        //         FromRecRef.GETTABLE(ImprestRequisition);
        //     end;
        //     tableFound := true;
        // end;
        // if TableID = Database::"Imprest Surrender Header" then begin
        //     objImprestSurrender.RESET;
        //     objImprestSurrender.SETRANGE(objImprestSurrender.No, DocNo);
        //     if objImprestSurrender.FIND('-') then begin
        //         FromRecRef.GETTABLE(objImprestSurrender);
        //     end;
        //     tableFound := true;
        // end;
        if TableID = Database::"Transport Requisition" then begin
            TransportRequisition.RESET;
            TransportRequisition.SETRANGE("Transport Requisition No", DocNo);
            if TransportRequisition.FIND('-') then begin
                FromRecRef.GETTABLE(TransportRequisition);
            end;
            tableFound := true;
        end;
        // if TableID = Database::"Staff Claims Header" then begin
        //     StaffClaims.RESET;
        //     StaffClaims.SETRANGE(StaffClaims."No.", DocNo);
        //     if StaffClaims.FIND('-') then begin
        //         FromRecRef.GETTABLE(StaffClaims);
        //     end;
        //     tableFound := true;
        // end;
        if TableID = Database::"Employee" then begin
            HREmp.Reset();
            HREmp.SetRange("No.", DocNo);
            if HREmp.Find('-') then begin
                FromRecRef.GETTABLE(HREmp);
            end;
            tableFound := true;
        end;
        if TableID = Database::"Recruitment Requisition Header" then begin
            EmpReq.Reset();
            EmpReq.SetRange("Document No.", DocNo);
            if EmpReq.Find('-') then begin
                FromRecRef.GETTABLE(EmpReq);
            end;
            tableFound := true;
        end;
        // if TableID = Database::"Applicant Register" then begin
        //     AppRegister.Reset();
        //     AppRegister.SetRange(AppRegister."Account No", DocNo);
        //     if AppRegister.Find('-') then begin
        //         FromRecRef.GETTABLE(AppRegister);
        //     end;
        //     tableFound := true;
        // end;
        // if TableID = Database::"Legal Management" then begin
        //     LegalH.Reset();
        //     LegalH.SetRange(LegalH.No, DocNo);
        //     if LegalH.Find('-') then begin
        //         FromRecRef.GETTABLE(LegalH);
        //     end;
        //     tableFound := true;
        // end;
        if TableID = Database::"Training Requests" then begin
            HRTraining.Reset();
            HRTraining.SetRange("Code", DocNo);
            if HRTraining.Find('-') then begin
                FromRecRef.GETTABLE(HRTraining);
            end;
            tableFound := true;
        end;
        // if TableID = Database::"InterBank Transfers" then begin
        //     InterBank.Reset();
        //     InterBank.SetRange(No, DocNo);
        //     if InterBank.Find('-') then begin
        //         FromRecRef.GETTABLE(InterBank);
        //     end;
        //     tableFound := true;
        // end;
        // if TableID = Database::Payments then begin
        //     PV.Reset();
        //     PV.SetRange("No.", DocNo);
        //     if PV.Find('-') then begin
        //         FromRecRef.GETTABLE(PV);
        //     end;
        //     tableFound := true;
        // end;

        if TableID = Database::"Dependants Change" then begin
            dependantChange.Reset();
            dependantChange.SetRange("Document No", DocNo);
            if dependantChange.Find('-') then begin
                FromRecRef.GETTABLE(dependantChange);
            end;
            tableFound := true;
        end;
        if TableID = Database::"prBasic pay PCA" then begin
            PayChangeAdvice.Reset();
            PayChangeAdvice.SetRange("Change Advice Serial No.", DocNo);
            if PayChangeAdvice.Find('-') then begin
                FromRecRef.GETTABLE(PayChangeAdvice);
            end;
            tableFound := true;
        end;
        // if TableID = Database::"Imprest Memo Header" then begin
        //     ImpMemo.Reset();
        //     ImpMemo.SetRange(ImpMemo."No.", DocNo);
        //     if ImpMemo.Find('-') then begin
        //         FromRecRef.GETTABLE(ImpMemo);
        //     end;
        //     tableFound := true;
        // end;
        // if TableID = Database::"ICT General Requisition Header" then begin
        //     ICTReq.Reset();
        //     ICTReq.SetRange("No", DocNo);
        //     if ICTReq.Find('-') then begin
        //         FromRecRef.GETTABLE(ICTReq);
        //     end;
        //     tableFound := true;
        // end;
        // if TableID = Database::"Staff Advance Header" then begin
        //     StaffAdvanceHeader.Reset();
        //     StaffAdvanceHeader.SetRange(StaffAdvanceHeader."No.", DocNo);
        //     if StaffAdvanceHeader.Find('-') then begin
        //         FromRecRef.GETTABLE(StaffAdvanceHeader);
        //     end;
        //     tableFound := true;
        // end;
        // if TableID = Database::"Staff Advance Header" then begin
        //     StaffAdvanceSurr.Reset();
        //     StaffAdvanceSurr.SetRange(StaffAdvanceSurr.No, DocNo);
        //     if StaffAdvanceSurr.Find('-') then begin
        //         FromRecRef.GETTABLE(StaffAdvanceSurr);
        //     end;
        //     tableFound := true;
        // end;
        // if TableID = Database::"HR Induction Schedule" then begin
        //     Induction.Reset();
        //     Induction.SetRange(Induction."Induction Code", DocNo);
        //     if Induction.Find('-') then begin
        //         FromRecRef.GETTABLE(Induction);
        //     end;
        //     tableFound := true;
        // end;
        if tableFound = true then begin
            if FileName <> '' then begin
                Clear(DocAttachment);
                DocAttachment.Init();
                DocAttachment.Validate("File Extension", FileManagement.GetExtension(FileName));
                DocAttachment.Validate("File Name", CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName)));
                DocAttachment.Validate("Table ID", FromRecRef.Number);
                DocAttachment.Validate("No.", DocNo);
                // Bytes := Convert.FromBase64String(Attachment);
                // MemoryStream := MemoryStream.MemoryStream(Bytes);
                // DocAttachment."Document Reference ID".ImportStream(MemoryStream, '', FileName);
                if DocAttachment.Insert(true) then
                    exit(true);
            end;
        end;
    end;

    // procedure UploadAttachedDocument(DocNo: Code[20]; FileName: Text[2000]; Attachment: BigText; TableID: Integer)
    // var
    //     DocAttachment: Record "Document Attachment";
    //     FromRecRef: RecordRef;
    //     FileManagement: Codeunit "File Management";
    //     //Bytes: dotnet Array;
    //     // LegalH: Record "Legal Management";
    //     //Convert: dotnet Convert;
    //     //MemoryStream: dotnet MemoryStream;
    //     Ostream: OutStream;
    //     // CurrPage: Page "Document Attachments";
    //     tableFound: Boolean;

    //     HRTraining: Record "Training Requests";
    //     InterBank: Record "Payments";
    //     PV: Record "Payments";
    //     ImpMemo: Record "Payments";
    //     //  ICTReq: Record "ICT General Requisition Header";
    //     StaffAdvanceHeader: Record "Payments";
    //     EmpReq: Record "Recruitment Requisition Header";
    //     StaffAdvanceSurr: Record "Payments";
    //     //  Induction: Record "HR Induction Schedule";
    //     //StaffInd: Record "HR Staff  Induction";
    //     LeaveT: Record "HR Leave Application";
    //     objPurchaseHeader: Record "Purchase Header";
    //     EmpTransfer: Record "Employee Transfers";
    //     DependantChange: record "Dependants Change";
    //     PayChangeAdvice: record "prBasic pay PCA";
    //     LoanApplication: Record "Loan Application";

    // begin
    //     tableFound := false;
    //     if TableID = Database::"HR Leave Application" then begin

    //         LeaveT.RESET;
    //         LeaveT.SETRANGE(LeaveT."Application Code", DocNo);
    //         if LeaveT.FIND('-') then begin
    //             FromRecRef.GETTABLE(LeaveT);
    //         end;
    //         tableFound := true;
    //     end;
    //     if TableID = Database::"Employee Transfers" then begin

    //         EmpTransfer.RESET;
    //         EmpTransfer.SETRANGE(EmpTransfer."Document No", DocNo);
    //         if EmpTransfer.FIND('-') then begin
    //             FromRecRef.GETTABLE(EmpTransfer);
    //         end;
    //         tableFound := true;
    //     end;
    //     // if TableID = Database::"HR Leave Allocation Request" then begin

    //     //     LeaveReq.RESET;
    //     //     LeaveReq.SETRANGE(LeaveReq."No.", DocNo);
    //     //     if LeaveReq.FIND('-') then begin
    //     //         FromRecRef.GETTABLE(LeaveReq);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     if TableID = Database::"Purchase Header" then begin
    //         objPurchaseHeader.RESET;
    //         objPurchaseHeader.SETRANGE(objPurchaseHeader."No.", DocNo);
    //         if objPurchaseHeader.FIND('-') then begin
    //             FromRecRef.GETTABLE(objPurchaseHeader);
    //         end;
    //         tableFound := true;
    //     end;

    //     // if TableID = Database::"Store Requistion Header" then begin
    //     //     StoreRequisition.RESET;
    //     //     StoreRequisition.SETRANGE(StoreRequisition."No.", DocNo);
    //     //     if StoreRequisition.FIND('-') then begin
    //     //         FromRecRef.GETTABLE(StoreRequisition);
    //     //     end;
    //     //     tableFound := true;
    //     // end;

    //     // if TableID = Database::"Imprest Header" then begin
    //     //     ImprestRequisition.RESET;
    //     //     ImprestRequisition.SETRANGE(ImprestRequisition."No.", DocNo);
    //     //     if ImprestRequisition.FIND('-') then begin
    //     //         FromRecRef.GETTABLE(ImprestRequisition);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     // if TableID = Database::"Imprest Surrender Header" then begin
    //     //     objImprestSurrender.RESET;
    //     //     objImprestSurrender.SETRANGE(objImprestSurrender.No, DocNo);
    //     //     if objImprestSurrender.FIND('-') then begin
    //     //         FromRecRef.GETTABLE(objImprestSurrender);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     if TableID = Database::"Transport Requisition" then begin
    //         TransportRequisition.RESET;
    //         TransportRequisition.SETRANGE("Transport Requisition No", DocNo);
    //         if TransportRequisition.FIND('-') then begin
    //             FromRecRef.GETTABLE(TransportRequisition);
    //         end;
    //         tableFound := true;
    //     end;
    //     // if TableID = Database::"Staff Claims Header" then begin
    //     //     StaffClaims.RESET;
    //     //     StaffClaims.SETRANGE(StaffClaims."No.", DocNo);
    //     //     if StaffClaims.FIND('-') then begin
    //     //         FromRecRef.GETTABLE(StaffClaims);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     if TableID = Database::"Employee" then begin
    //         HREmp.Reset();
    //         HREmp.SetRange("No.", DocNo);
    //         if HREmp.Find('-') then begin
    //             FromRecRef.GETTABLE(HREmp);
    //         end;
    //         tableFound := true;
    //     end;
    //     if TableID = Database::"Recruitment Requisition Header" then begin
    //         EmpReq.Reset();
    //         EmpReq.SetRange("Document No.", DocNo);
    //         if EmpReq.Find('-') then begin
    //             FromRecRef.GETTABLE(EmpReq);
    //         end;
    //         tableFound := true;
    //     end;
    //     // if TableID = Database::"Applicant Register" then begin
    //     //     AppRegister.Reset();
    //     //     AppRegister.SetRange(AppRegister."Account No", DocNo);
    //     //     if AppRegister.Find('-') then begin
    //     //         FromRecRef.GETTABLE(AppRegister);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     // if TableID = Database::"Legal Management" then begin
    //     //     LegalH.Reset();
    //     //     LegalH.SetRange(LegalH.No, DocNo);
    //     //     if LegalH.Find('-') then begin
    //     //         FromRecRef.GETTABLE(LegalH);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     if TableID = Database::"Training Requests" then begin
    //         HRTraining.Reset();
    //         HRTraining.SetRange("Code", DocNo);
    //         if HRTraining.Find('-') then begin
    //             FromRecRef.GETTABLE(HRTraining);
    //         end;
    //         tableFound := true;
    //     end;
    //     // if TableID = Database::"InterBank Transfers" then begin
    //     //     InterBank.Reset();
    //     //     InterBank.SetRange(No, DocNo);
    //     //     if InterBank.Find('-') then begin
    //     //         FromRecRef.GETTABLE(InterBank);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     // if TableID = Database::Payments then begin
    //     //     PV.Reset();
    //     //     PV.SetRange("No.", DocNo);
    //     //     if PV.Find('-') then begin
    //     //         FromRecRef.GETTABLE(PV);
    //     //     end;
    //     //     tableFound := true;
    //     // end;

    //     if TableID = Database::"Dependants Change" then begin
    //         dependantChange.Reset();
    //         dependantChange.SetRange("Document No", DocNo);
    //         if dependantChange.Find('-') then begin
    //             FromRecRef.GETTABLE(dependantChange);
    //         end;
    //         tableFound := true;
    //     end;
    //     if TableID = Database::"prBasic pay PCA" then begin
    //         PayChangeAdvice.Reset();
    //         PayChangeAdvice.SetRange("Change Advice Serial No.", DocNo);
    //         if PayChangeAdvice.Find('-') then begin
    //             FromRecRef.GETTABLE(PayChangeAdvice);
    //         end;
    //         tableFound := true;
    //     end;
    //     if TableID = Database::"Loan Application" then begin
    //         LoanApplication.Reset();
    //         LoanApplication.SetRange("Loan No", DocNo);
    //         if PayChangeAdvice.Find('-') then begin
    //             FromRecRef.GETTABLE(PayChangeAdvice);
    //         end;
    //         tableFound := true;
    //     end;
    //     // if TableID = Database::"Imprest Memo Header" then begin
    //     //     ImpMemo.Reset();
    //     //     ImpMemo.SetRange(ImpMemo."No.", DocNo);
    //     //     if ImpMemo.Find('-') then begin
    //     //         FromRecRef.GETTABLE(ImpMemo);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     // if TableID = Database::"ICT General Requisition Header" then begin
    //     //     ICTReq.Reset();
    //     //     ICTReq.SetRange("No", DocNo);
    //     //     if ICTReq.Find('-') then begin
    //     //         FromRecRef.GETTABLE(ICTReq);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     // if TableID = Database::"Staff Advance Header" then begin
    //     //     StaffAdvanceHeader.Reset();
    //     //     StaffAdvanceHeader.SetRange(StaffAdvanceHeader."No.", DocNo);
    //     //     if StaffAdvanceHeader.Find('-') then begin
    //     //         FromRecRef.GETTABLE(StaffAdvanceHeader);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     // if TableID = Database::"Staff Advance Header" then begin
    //     //     StaffAdvanceSurr.Reset();
    //     //     StaffAdvanceSurr.SetRange(StaffAdvanceSurr.No, DocNo);
    //     //     if StaffAdvanceSurr.Find('-') then begin
    //     //         FromRecRef.GETTABLE(StaffAdvanceSurr);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     // if TableID = Database::"HR Induction Schedule" then begin
    //     //     Induction.Reset();
    //     //     Induction.SetRange(Induction."Induction Code", DocNo);
    //     //     if Induction.Find('-') then begin
    //     //         FromRecRef.GETTABLE(Induction);
    //     //     end;
    //     //     tableFound := true;
    //     // end;
    //     if tableFound = true then begin
    //         if FileName <> '' then begin
    //             Clear(DocAttachment);
    //             DocAttachment.Init();
    //             DocAttachment.Validate("File Extension", FileManagement.GetExtension(FileName));
    //             DocAttachment.Validate("File Name", CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName)));
    //             DocAttachment.Validate("Table ID", FromRecRef.Number);
    //             DocAttachment.Validate("No.", DocNo);
    //             Bytes := Convert.FromBase64String(Attachment);
    //             MemoryStream := MemoryStream.MemoryStream(Bytes);
    //             DocAttachment."Document Reference ID".ImportStream(MemoryStream, '', FileName);
    //             DocAttachment.Insert(true);
    //             if FileManagement.DeleteServerFile(FileName) then;
    //         end else
    //             Error('No file to upload');
    //     end else
    //         Error('File not uploaded. No table filter found');
    // end;


    procedure DeleteDocumentAttachment(DocNo: Code[20]; TableID: Integer; DocID: Integer)
    var
        DocAttachment: Record "Document Attachment";
    begin
        DocAttachment.Reset();
        DocAttachment.SetRange("Table ID", TableID);
        DocAttachment.SetRange("No.", DocNo);
        DocAttachment.SetRange(ID, DocID);
        if DocAttachment.Find('-') then begin
            if DocAttachment."Document Reference ID".HasValue then begin
                Clear(DocAttachment."Document Reference ID");
                DocAttachment.Modify(true);
            end;
            DocAttachment.Delete(true);
        end;
    end;


    procedure CheckAttachmentExists(DocNo: Code[20]; TableID: Integer; DocID: Integer) Exists: Boolean
    var
        DocAttachment: Record "Document Attachment";
    begin
        Exists := false;
        DocAttachment.Reset();
        DocAttachment.SetRange("Table ID", TableID);
        DocAttachment.SetRange("No.", DocNo);
        //DocAttachment.SetRange(ID, DocID);
        if DocAttachment.Find('-') then begin
            Exists := true;

        end;
    end;

    Procedure GetLeaveBalances(StaffNoFilter: Code[20]; LeavevTypeFilter: Code[20]) DaysCalculated: array[5] of Decimal
    var
        HRLeaveCal: Record "Base Calendar";
        HRLeaveAlloc: Record "HR Leave Ledger Entries";
        AllocatedDays: Decimal;
        ReimbursedDays: Decimal;
        BrF: Decimal;
        EarnedDays: Decimal;
        CurrentTotalLeaveTaken: Decimal;
        CurrentLeaveBalance: Decimal;
        NoofMonthsWorked: Decimal;
        hrcu: Codeunit "HR Codeunit";
    begin
        HREmp.reset();
        HREmp.setrange(HREmp."No.", StaffNoFilter);
        if HREmp.Find('-') then begin
            HRLeaveCal.Reset;
            // HRLeaveCal.SetRange(Current, true);
            if HRLeaveCal.FindFirst() then begin
                //More than once calendar exists
                if HRLeaveCal.Count > 1 then Error('No active calendar exists', HRLeaveCal.Count);
                //case WhatToGetFilter of
                // 1: //Allocated Leave Days
                // HREmp."Current HR Calender" := HRLeaveCal.Code;
                HREmp.Modify();
                begin
                    HRLeaveAlloc.Reset;
                    HRLeaveAlloc.SetRange("Staff No.", StaffNoFilter);
                    HRLeaveAlloc.SetRange("Leave Entry Type", HRLeaveAlloc."Leave Entry Type"::Positive);
                    HRLeaveAlloc.SetRange("Leave Type", LeavevTypeFilter);
                    // HRLeaveAlloc.SetFilter("Leave Posting Type", '%1', HRLeaveAlloc."Leave Posting type"::Annual );
                    HRLeaveAlloc.SetRange(Closed, false);
                    HRLeaveAlloc.SetRange("Leave Period", HRLeaveCal.Code);
                    //HRLeaveAlloc.SetRange(Posted, true);
                    if HRLeaveAlloc.FindSet then begin
                        HRLeaveAlloc.CalcSums("No. of days1");
                        AllocatedDays := HRLeaveAlloc."No. of days1";
                    end;
                end;
            end;

            EarnedDays := hrcu.CalculateEarnedDays(HREmp."No.");
            BrF := hrcu.CalculateBrFDays(HREmp."No.");
            CurrentTotalLeaveTaken := ABS(hrcu.CalculateTakenLeaveDays(HREmp."No."));

            HREmp.CalcFields("Leave Outstanding Bal");
            HREmp.CalcFields("Total Leave Taken");
            HREmp.CalcFields("Reimbursed Leave Days");
            // HREmp.CalcFields("Carry forward");
            //+ HREmp."Carry forward"
            CurrentLeaveBalance := (EarnedDays + HREmp."Reimbursed Leave Days") - CurrentTotalLeaveTaken;

            DaysCalculated[1] := HREmp."Leave Outstanding Bal"; //AllocatedDays + HREmp."Reimbursed Leave Days";//
            DaysCalculated[2] := BrF;
            DaysCalculated[3] := HREmp."Total Leave Taken";
            DaysCalculated[4] := EarnedDays;
            DaysCalculated[5] := HREmp."Reimbursed Leave Days";
        end;


        // //Check Calendar
        // HRLeaveCal.Reset;
        // HRLeaveCal.SetRange(Current, true);
        // if HRLeaveCal.FindFirst() then begin
        //     //More than once calendar exists
        //     if HRLeaveCal.Count > 1 then Error('No active calendar exists', HRLeaveCal.Count);
        //     //case WhatToGetFilter of
        //     // 1: //Allocated Leave Days
        //     begin
        //         HRLeaveAlloc.Reset;
        //         HRLeaveAlloc.SetRange("No.", StaffNoFilter);
        //         HRLeaveAlloc.SetRange("Entry Type", HRLeaveAlloc."entry type"::"Positive Adjustment");
        //         HRLeaveAlloc.SetRange("Leave Type", LeavevTypeFilter);
        //         HRLeaveAlloc.SetFilter("Posting Type", '%1', HRLeaveAlloc."posting type"::Normal);
        //         HRLeaveAlloc.SetRange(Closed, false);
        //         HRLeaveAlloc.SetRange("Calendar Code", HRLeaveCal.Code);
        //         if HRLeaveAlloc.FindSet then begin
        //             HRLeaveAlloc.CalcSums("No. Of days");
        //             AllocatedDays := HRLeaveAlloc."No. Of days";
        //             //exit(AllocatedDays);
        //             DaysCalculated[1] := AllocatedDays;
        //         end;
        //     end;
        //     // 2: //Reimbursed Leave Days
        //     begin
        //         HRLeaveAlloc.Reset;
        //         HRLeaveAlloc.SetRange("No.", StaffNoFilter);
        //         HRLeaveAlloc.SetRange("Entry Type", HRLeaveAlloc."entry type"::"Positive Adjustment");
        //         HRLeaveAlloc.SetRange("Leave Type", LeavevTypeFilter);
        //         HRLeaveAlloc.SetFilter("Posting Type", '%1', HRLeaveAlloc."Posting Type"::"Carry Forward");
        //         HRLeaveAlloc.SetRange(Closed, false);
        //         HRLeaveAlloc.SetRange("Calendar Code", HRLeaveCal.Code);
        //         if HRLeaveAlloc.FindSet then begin
        //             HRLeaveAlloc.CalcSums("No. Of days");
        //             ReimbursedDays := HRLeaveAlloc."No. Of days";
        //             //exit(ReimbursedDays);
        //             DaysCalculated[2] := ReimbursedDays;
        //         end;
        //     end;
        //     // 3: //Reimbursed Leave Days
        //     begin
        //         HRLeaveAlloc.Reset;
        //         HRLeaveAlloc.SetRange("No.", StaffNoFilter);
        //         HRLeaveAlloc.SetRange("Entry Type", HRLeaveAlloc."entry type"::"Negative Adjustment");
        //         HRLeaveAlloc.SetRange("Leave Type", LeavevTypeFilter);
        //         HRLeaveAlloc.SetRange("Posting Type", HRLeaveAlloc."posting type"::Normal);
        //         HRLeaveAlloc.SetRange(Closed, false);
        //         HRLeaveAlloc.SetRange("Calendar Code", HRLeaveCal.Code);
        //         if HRLeaveAlloc.FindSet then begin
        //             HRLeaveAlloc.CalcSums("No. Of days");
        //             CurrentTotalLeaveTaken := HRLeaveAlloc."No. Of days";
        //             //exit(CurrentTotalLeaveTaken);
        //             DaysCalculated[3] := CurrentTotalLeaveTaken;
        //         end;
        //     end;
        //     ////////////Earned Leave Days////////////////
        //     if HREmp.Get(StaffNoFilter) then begin
        //         if HREmp."Date Of Joining the Company" <> 0D then begin
        //             if HREmp."Date Of Joining the Company" > HRLeaveCal."Start Date" then begin
        //                 //NoofMonthsWorked := today - HREmp."Date Of Joining the Company";
        //                 NoofMonthsWorked := ABS(DATE2DMY(Today, 2) - DATE2DMY(HREmp."Date Of Joining the Company", 2));
        //                 IF DATE2DMY(Today, 3) = DATE2DMY(HREmp."Date Of Joining the Company", 3) THEN BEGIN
        //                     NoofMonthsWorked := DATE2DMY(Today, 2) - DATE2DMY(HREmp."Date Of Joining the Company", 2);
        //                 END;

        //                 IF DATE2DMY(Today, 3) <> DATE2DMY(HREmp."Date Of Joining the Company", 3) THEN BEGIN
        //                     NoofMonthsWorked := (DATE2DMY(Today, 2) + 12) - DATE2DMY(HREmp."Date Of Joining the Company", 2);
        //                 END;
        //                 NoofMonthsWorked := 30 / 12 * NoofMonthsWorked;
        //             end else begin
        //                 //NoofMonthsWorked := today - HRCalendar."Start Date";
        //                 NoofMonthsWorked := ABS(DATE2DMY(Today, 2) - DATE2DMY(HRLeaveCal."Start Date", 2));
        //                 IF DATE2DMY(Today, 3) = DATE2DMY(HRLeaveCal."Start Date", 3) THEN BEGIN
        //                     NoofMonthsWorked := DATE2DMY(Today, 2) - DATE2DMY(HRLeaveCal."Start Date", 2);
        //                 END;

        //                 IF DATE2DMY(Today, 3) <> DATE2DMY(HRLeaveCal."Start Date", 3) THEN BEGIN
        //                     NoofMonthsWorked := (DATE2DMY(Today, 2) + 12) - DATE2DMY(HRLeaveCal."Start Date", 2);
        //                 END;
        //                 NoofMonthsWorked := 30 / 12 * NoofMonthsWorked;
        //             end;
        //             DaysCalculated[4] := NoofMonthsWorked;
        //         end else
        //             Error('Date of Join is not set. Contact HR');
        //     end;
        // end
    end;

    procedure GetDocumentAttachment(tableId: Integer; No: Code[20]; RecID: Integer) BaseImage: Text
    var
        IStream: InStream;
        //Bytes: dotnet Array;
        //Convert: dotnet Convert;
        //MemoryStream: dotnet MemoryStream;
        TenantMedia: Record "Tenant Media";
        imageID: GUID;
        docAttachment: Record "Document Attachment";
    begin
        docAttachment.Reset();
        docAttachment.SetRange("Table ID", tableId);
        docAttachment.SetRange("No.", No);
        docAttachment.SetRange(ID, RecID);
        if docAttachment.find('-') then begin
            if docAttachment."Document Reference ID".Hasvalue then begin
                imageID := docAttachment."Document Reference ID".MediaId;
                IF TenantMedia.GET(imageID) THEN BEGIN
                    TenantMedia.CALCFIELDS(Content);
                    TenantMedia.Content.CreateInstream(IStream);
                    // MemoryStream := MemoryStream.MemoryStream();
                    // CopyStream(MemoryStream, IStream);
                    // Bytes := MemoryStream.GetBuffer();
                    // BaseImage := Convert.ToBase64String(Bytes);
                END;
            end;
        end;
    end;

    procedure GetEndReturnDate(SDate: Date; LDays: Decimal; "Leave Type": Code[20]) DaysCalculated: array[2] of Date
    var
        EndLeave: Boolean;
        DayCount: Integer;
        ltype: Record "HR Leave Types";
        dates: Record Date;
        eDate: Date;
        rDate: date;
        HRLeaveCal: Record "Base Calendar";
        HRLeave_Calendar: Record "Base Calendar Change";
        ERR_ACTIVE_LEAVE_CALENDAR: label 'There are currently [ %1 ] Active Leave Calendars. Please ensure one calendar is Active';
    begin
        dates.Reset;
        dates.SetRange(dates."Period Start", SDate);
        dates.SetFilter(dates."Period Type", '=%1', dates."period type"::Date);
        if dates.Find('-') then
            if ((dates."Period Name" = 'Sunday') or (dates."Period Name" = 'Saturday')) then begin
                if (dates."Period Name" = 'Sunday') then
                    Error('You can not start your leave on a Sunday')
                else
                    if (dates."Period Name" = 'Saturday') then Error('You can not start your leave on a Saturday')
            end;

        HRLeaveCal.Reset;
        //HRLeaveCal.SetRange(Current, true);
        if HRLeaveCal.FindFirst() then begin
            if HRLeaveCal.Count > 1 then Error(ERR_ACTIVE_LEAVE_CALENDAR, HRLeaveCal.Count);
            // For Annual Holidays
            HRLeave_Calendar.Reset;
            HRLeave_Calendar.SetFilter("Base Calendar Code", HRLeaveCal.Code);
            HRLeave_Calendar.SetRange(HRLeave_Calendar.Date, SDate);
            if HRLeave_Calendar.FindFirst() then begin
                if HRLeave_Calendar."NonWorking" = true then
                    if HRLeave_Calendar.Description <> '' then
                        Error('You can not start your Leave on a Non-working day -' + HRLeave_Calendar.Description + '')
                    else
                        Error('You can not start your Leave on a Non-working day');
            end;

            if (LDays <> 0) and (SDate <> 0D) then begin
                eDate := CalcEndDate(SDate, LDays, "Leave Type");
                rDate := CalcReturnDate(eDate, "Leave Type");

                DaysCalculated[1] := eDate;
                DaysCalculated[2] := rDate;
            end;
        end else
            Error('No Leave Calendar Exists');
    end;

    procedure CalcEndDate(SDate: Date; LDays: Integer; "Leave Type": Code[20]) LEndDate: Date
    var
        EndLeave: Boolean;
        DayCount: Integer;
        ltype: Record "HR Leave Types";
    begin
        SDate := SDate;
        EndLeave := false;
        DayCount := 1;
        while EndLeave = false do begin
            if not DetermineIfIsNonWorking(SDate, "Leave Type") then
                DayCount := DayCount + 1;
            SDate := SDate + 1;
            if DayCount > LDays then
                EndLeave := true;
        end;
        LEndDate := SDate - 1;

        while DetermineIfIsNonWorking(LEndDate, "Leave Type") = true do begin
            LEndDate := LEndDate + 1;
        end;
    end;

    procedure CalcReturnDate(EndDate: Date; "Leave Type": Code[20]) RDate: Date
    var
        EndLeave: Boolean;
        DayCount: Integer;
        LEndDate: Date;
        ltype: Record "HR Leave Types";
    begin
        RDate := EndDate + 1;
        while DetermineIfIsNonWorking(RDate, "Leave Type") = true do begin
            RDate := RDate + 1;
        end;
    end;

    procedure DetermineIfIsNonWorking(var bcDate: Date; var "Leave Type": Code[20]) ItsNonWorking: Boolean
    var
        dates: Record Date;
        HRLeaveCal: Record "Base Calendar";
        HRLeave_Calendar: Record "Base Calendar Change";
        GeneralOptions: record "Human Resources Setup";
        ltype: Record "HR Leave Types";
    begin
        Clear(ItsNonWorking);
        GeneralOptions.Find('-');
        HRLeaveCal.Reset;
        // HRLeaveCal.SetRange(Current, true);
        if HRLeaveCal.FindFirst() then begin
            HRLeave_Calendar.Reset;
            HRLeave_Calendar.SetFilter("Base Calendar Code", HRLeaveCal.Code);
            HRLeave_Calendar.SetRange(Date, bcDate);
            if HRLeave_Calendar.Find('-') then begin
                if HRLeave_Calendar."NonWorking" = true then
                    ItsNonWorking := true;
            end;
        end;

        if ItsNonWorking = false then begin
            // Check if its a weekend
            dates.Reset;
            dates.SetRange(dates."Period Type", dates."period type"::Date);
            dates.SetRange(dates."Period Start", bcDate);
            if dates.Find('-') then begin
                //if date is a sunday
                if dates."Period Name" = 'Sunday' then begin

                    //check if Leave includes sunday
                    ltype.Reset;
                    ltype.SetRange(ltype.Code, "Leave Type");
                    if ltype.Find('-') then begin
                        if ltype."Inclusive of Sunday" = false then ItsNonWorking := true;
                    end;
                end else
                    if dates."Period Name" = 'Saturday' then begin
                        //check if Leave includes sato
                        ltype.Reset;
                        ltype.SetRange(ltype.Code, "Leave Type");
                        if ltype.Find('-') then begin
                            if ltype."Inclusive of Saturday" = false then ItsNonWorking := true;
                        end;
                    end;
            end;
        end;
    end;

    procedure GetProfilePicture(StaffNo: Text) BaseImage: Text
    var
        ToFile: Text;
        IStream: InStream;
        //Bytes: dotnet Array;
        //Convert: dotnet Convert;
        //MemoryStream: dotnet MemoryStream;
        TenantMedia: Record "Tenant Media";
        Index: Integer;
        imageID: GUID;
        "Employee Card": Record Employee;
    begin
        "Employee Card".Reset;
        "Employee Card".SetRange("Employee Card"."No.", StaffNo);
        if "Employee Card".Find('-') then begin
            if "Employee Card".Image.Hasvalue then begin
                imageID := "Employee Card".Image.MediaId;
                IF TenantMedia.GET(imageID) THEN BEGIN
                    TenantMedia.CALCFIELDS(Content);
                    TenantMedia.Content.CreateInstream(IStream);
                    // MemoryStream := MemoryStream.MemoryStream();
                    // CopyStream(MemoryStream, IStream);
                    // Bytes := MemoryStream.GetBuffer();
                    // BaseImage := Convert.ToBase64String(Bytes);
                END;
            end;
        end;
    end;

    procedure CountApprovals(Approver: Text) CountApprovals: Integer
    begin
        CountApprovals := 0;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange("Approver ID", Approver);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        if ApprovalEntry.Find('-') then
            CountApprovals := ApprovalEntry.Count;
    end;

    // procedure TravelAdvancePerMonth(EmployeeNo: Text; StartDate: date) P: ARRAY[12] OF Decimal

    // var
    //     EndDate: date;
    // begin
    //     EndDate := StartDate + 365;
    //     ImprestRequisition.RESET;
    //     ImprestRequisition.SETFILTER(ImprestRequisition.Date, '%1..%2', StartDate, EndDate);
    //     ImprestRequisition.SetFilter(ImprestRequisition."Account No.", EmployeeNo);
    //     ImprestRequisition.SetFilter(ImprestRequisition.Status, '%1', ImprestRequisition.Status::Released);
    //     IF ImprestRequisition.FIND('-') THEN BEGIN
    //         REPEAT
    //             ImprestRequisition.CalcFields("Total Net Amount");

    //             // IF DATE2DMY(ImprestRequisition."Date", 3) = 2020 THEN BEGIN
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 1 THEN
    //                 P[1] := P[1] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 2 THEN
    //                 P[2] := P[2] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 3 THEN
    //                 P[3] := P[3] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 4 THEN
    //                 P[4] := P[4] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 5 THEN
    //                 P[5] := P[5] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 6 THEN
    //                 P[6] := P[6] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 7 THEN
    //                 P[7] := P[7] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 8 THEN
    //                 P[8] := P[8] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 9 THEN
    //                 P[9] := P[9] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 10 THEN
    //                 P[10] := P[10] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 11 THEN
    //                 P[11] := P[11] + ImprestRequisition."Total Net Amount";
    //             IF DATE2DMY(ImprestRequisition."Date", 2) = 12 THEN
    //                 P[12] := P[12] + ImprestRequisition."Total Net Amount";
    //         UNTIL ImprestRequisition.NEXT = 0;
    //     END;
    // END;

    // procedure TravelLiquidationPerMonth(EmployeeNo: Text; StartDate: date) P: ARRAY[12] OF Decimal

    // var
    //     EndDate: date;
    //     ImpsurrH: Record Payments;
    // begin
    //     EndDate := StartDate + 365;
    //     ImpsurrH.RESET;
    //     ImpsurrH.SETFILTER(ImpsurrH."Surrender Date", '%1..%2', StartDate, EndDate);
    //     ImpsurrH.SetFilter(ImpsurrH."Account No.", EmployeeNo);
    //     ImpsurrH.SetFilter(ImpsurrH.Status, '%1', ImpsurrH.Status::Released);
    //     IF ImpsurrH.FIND('-') THEN BEGIN
    //         REPEAT

    //             // IF DATE2DMY(ImpsurrH."Surrender Date", 3) = 2020 THEN BEGIN
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 1 THEN
    //                 P[1] := P[1] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 2 THEN
    //                 P[2] := P[2] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 3 THEN
    //                 P[3] := P[3] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 4 THEN
    //                 P[4] := P[4] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 5 THEN
    //                 P[5] := P[5] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 6 THEN
    //                 P[6] := P[6] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 7 THEN
    //                 P[7] := P[7] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 8 THEN
    //                 P[8] := P[8] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 9 THEN
    //                 P[9] := P[9] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 10 THEN
    //                 P[10] := P[10] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 11 THEN
    //                 P[11] := P[11] + ImpsurrH."Total Net Amount";
    //             IF DATE2DMY(ImpsurrH."Surrender Date", 2) = 12 THEN
    //                 P[12] := P[12] + ImpsurrH."Total Net Amount";
    //         UNTIL ImpsurrH.NEXT = 0;
    //     END;
    // END;

    // procedure WorkshopAdvancePerMonth(EmployeeNo: Text; StartDate: date) P: ARRAY[12] OF Decimal

    // var
    //     EndDate: date;
    //     Workshop: Record Payments;
    // begin
    //     EndDate := StartDate + 365;
    //     Workshop.RESET;
    //     Workshop.SETFILTER(Workshop.Date, '%1..%2', StartDate, EndDate);
    //     Workshop.SetFilter(Workshop."Account No.", EmployeeNo);
    //     Workshop.SetFilter(Workshop.Status, '%1', Workshop.Status::Released);
    //     IF Workshop.FIND('-') THEN BEGIN
    //         REPEAT
    //             Workshop.CalcFields(Workshop."Total Net Amount");

    //             // IF DATE2DMY(Workshop."Date", 3) = 2020 THEN BEGIN
    //             IF DATE2DMY(Workshop."Date", 2) = 1 THEN
    //                 P[1] := P[1] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 2 THEN
    //                 P[2] := P[2] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 3 THEN
    //                 P[3] := P[3] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 4 THEN
    //                 P[4] := P[4] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 5 THEN
    //                 P[5] := P[5] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 6 THEN
    //                 P[6] := P[6] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 7 THEN
    //                 P[7] := P[7] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 8 THEN
    //                 P[8] := P[8] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 9 THEN
    //                 P[9] := P[9] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 10 THEN
    //                 P[10] := P[10] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 11 THEN
    //                 P[11] := P[11] + Workshop."Total Net Amount";
    //             IF DATE2DMY(Workshop."Date", 2) = 12 THEN
    //                 P[12] := P[12] + Workshop."Total Net Amount";
    //         UNTIL Workshop.NEXT = 0;
    //     END;
    // END;

    // procedure StaffClaimPerMonth(EmployeeNo: Text; StartDate: date) P: ARRAY[12] OF Decimal

    // var
    //     EndDate: date;
    // begin
    //     EndDate := StartDate + 365;
    //     StaffClaims.RESET;
    //     StaffClaims.SETFILTER(StaffClaims.Date, '%1..%2', StartDate, EndDate);
    //     StaffClaims.SetFilter(StaffClaims."Account No.", EmployeeNo);
    //     StaffClaims.SetFilter(StaffClaims.Status, '%1', StaffClaims.Status::Released);
    //     IF StaffClaims.FIND('-') THEN BEGIN
    //         REPEAT
    //             StaffClaims.CalcFields(StaffClaims."Total Net Amount");
    //             // IF DATE2DMY(StaffClaims."Date", 3) = 2020 THEN BEGIN
    //             IF DATE2DMY(StaffClaims."Date", 2) = 1 THEN
    //                 P[1] := P[1] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 2 THEN
    //                 P[2] := P[2] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 3 THEN
    //                 P[3] := P[3] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 4 THEN
    //                 P[4] := P[4] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 5 THEN
    //                 P[5] := P[5] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 6 THEN
    //                 P[6] := P[6] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 7 THEN
    //                 P[7] := P[7] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 8 THEN
    //                 P[8] := P[8] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 9 THEN
    //                 P[9] := P[9] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 10 THEN
    //                 P[10] := P[10] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 11 THEN
    //                 P[11] := P[11] + StaffClaims."Total Net Amount";
    //             IF DATE2DMY(StaffClaims."Date", 2) = 12 THEN
    //                 P[12] := P[12] + StaffClaims."Total Net Amount";
    //         UNTIL StaffClaims.NEXT = 0;
    //     END;
    // END;

    procedure CountUnfilledTimesheets(Approver: Text) CountTimesheets: Integer
    var
    // Timesheet: Record "HR Timesheet Header";
    // PrPayroll: Record "HR Employee Timesheet Periods";
    begin
        // CountTimesheets := 0;
        // PrPayroll.Reset();
        // PrPayroll.SetRange("Employee No", Approver);
        // PrPayroll.SetRange(Submitted, false);
        // if PrPayroll.Find('-') then begin
        //     CountTimesheets := PrPayroll.Count;
        //     //repeat
        //     /* Timesheet.Reset;
        //     Timesheet.SetRange(Timesheet."Employee No", Approver);
        //     Timesheet.SetRange(Timesheet.Period, PrPayroll."Date Opened");
        //     if not Timesheet.Find('-') then begin
        //         CountTimesheets := CountTimesheets + 1;
        //     end; */
        //     // until PrPayroll.Next() = 0;
        // end;
    end;

    procedure PurchasesPerEmployee(EmployeeNo: Text) P: ARRAY[3] OF Decimal
    begin
        objPurchaseHeader.RESET;
        // objPurchaseHeader.SetRange(objPurchaseHeader."Requisition Type", objPurchaseHeader."Requisition Type"::General);
        objPurchaseHeader.SetFilter(objPurchaseHeader."Request-By No.", EmployeeNo);
        objPurchaseHeader.SetFilter(objPurchaseHeader.Status, '%1|%2', objPurchaseHeader.Status::Released);
        IF objPurchaseHeader.FIND('-') THEN BEGIN
            REPEAT
                objPurchaseHeader.CalcFields(Amount);
                P[1] := P[1] + objPurchaseHeader.Amount;
            UNTIL objPurchaseHeader.NEXT = 0;
        END;
        objPurchaseHeader.RESET;
        //objPurchaseHeader.SetRange(objPurchaseHeader."Requisition Type", objPurchaseHeader."Requisition Type"::Operations);
        objPurchaseHeader.SetFilter(objPurchaseHeader."Request-By No.", EmployeeNo);
        objPurchaseHeader.SetFilter(objPurchaseHeader.Status, '%1|%2', objPurchaseHeader.Status::Released, objPurchaseHeader.Status::"Pending Prepayment");
        IF objPurchaseHeader.FIND('-') THEN BEGIN
            REPEAT
                objPurchaseHeader.CalcFields(Amount);
                P[2] := P[2] + objPurchaseHeader.Amount;
            UNTIL objPurchaseHeader.NEXT = 0;
        END;
        objPurchaseHeader.RESET;
        // objPurchaseHeader.SetRange(objPurchaseHeader."Requisition Type", objPurchaseHeader."Requisition Type"::"Printing and Branding");
        objPurchaseHeader.SetFilter(objPurchaseHeader."Request-By No.", EmployeeNo);
        objPurchaseHeader.SetFilter(objPurchaseHeader.Status, '%1|%2', objPurchaseHeader.Status::Released, objPurchaseHeader.Status::"Pending Prepayment");
        IF objPurchaseHeader.FIND('-') THEN BEGIN
            REPEAT
                objPurchaseHeader.CalcFields(Amount);
                P[3] := P[3] + objPurchaseHeader.Amount;
            UNTIL objPurchaseHeader.NEXT = 0;
        END;
    END;

    procedure HRLeaveReimbursement(EmployeeNo: Code[20]; LeaveNo: Code[20]; AppliedDays: Decimal; SenderComments: Text; ResponsibilityCenter: Code[20]; UserID: Text) DocNo: Code[20]
    var
        GenLedgerSetup: Record "General Ledger Setup";
        TheTable: Record "HR Leave Allocation Request";
        LeaveReq: Record "HR Leave Allocation Request";
    begin

        HRSetup.Get;
        //  if HRSetup."Used For Approval" = HRSetup."Used For Approval"::" " then
        //  Error('Select what to use for approval in HR Setup');

        // if HRSetup."Close Leave Application" = true then Error('Please note that the leave application is currently closed, Kindly contact your leave Administrator');
        LeaveReq.Init();
        IF LeaveReq."No." = '' THEN BEGIN
            TheTable.RESET;
            IF TheTable.FINDLAST THEN BEGIN
                LeaveReq."No." := INCSTR(TheTable."No.")
            END ELSE BEGIN
                LeaveReq."No." := 'Appl0001';
            END;
        END;
        NextNo := LeaveReq."No.";
        if LeaveT.Get(LeaveNo) then
            LeaveReq."Leave Type" := LeaveT."Leave Type";
        LeaveReq."Applied Days" := AppliedDays;
        LeaveReq."User ID" := UserID;
        LeaveReq."Leave Number" := LeaveNo;
        LeaveReq."Employee No" := EmployeeNo;
        LeaveReq."Application Type" := LeaveReq."Application Type"::"Re-Imbursement";
        LeaveReq."Adjustment Type" := LeaveReq."Adjustment Type"::"Positive Adjustment";
        if HREmp.Get(EmployeeNo) then begin
            //HREmp.TestField(Gender);
            //HREmp.TestField("Global Dimension 2 Code");
            LeaveReq."Employee Name" := HREmp.FullName();
            LeaveReq."Approver ID" := HREmp."Supervisor";
            LeaveReq."Responsibility Center" := HREmp."Responsibility Center";
            //  if ((HRSetup."Used For Approval" = HRSetup."Used For Approval"::" ") and (LeaveReq."Responsibility Center" = '')) then
            //  Error('Employee responsibility not Set in HR');

            // LeaveReq."Department Code" := HREmp."Global Dimension 2 Code";
            //LeaveReq.Validate("Department Code");
            // LeaveReq."Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            // LeaveReq.Validate("Global Dimension 1 Code");

        end;

        LeaveReq."Date" := Today;
        LeaveReq."Starting Date" := LeaveT."Start Date";
        LeaveReq."End Date" := LeaveT."End Date";
        LeaveReq."Return Date" := LeaveT."Return Date";
        LeaveReq.Purpose := SenderComments;
        LeaveReq."Reliever No." := LeaveT."Reliever";
        LeaveReq.Validate("Reliever No.");
        LeaveReq.Status := LeaveReq.Status::Open;
        LeaveReq.Insert(false);

        LeaveReq.Reset();
        LeaveReq.SetRange("No.", NextNo);
        if LeaveReq.Find('-') then begin
            // LeaveReq.Validate("Applied Days");
            // LeaveReq.Validate("Reliever No.");
        end;
        LeaveRequisitionsApprovalRequest(NextNo);
        DocNo := NextNo;
    end;

    procedure LeaveRequisitionsApprovalRequest(ReqNo: Text)
    var
        ApprovalEntry: Record "Approval Entry";
        RecID: RecordID;
        FromRecRef: RecordRef;
        msg: Text;
        EmpName: Text;
        ReliverEmail: Text;
        LeaveAllR: Record "HR Leave Allocation Request";
    begin
        LeaveReq.Reset;
        LeaveReq.SetRange(LeaveReq."No.", ReqNo);
        LeaveReq.SetRange(LeaveReq.Status, LeaveReq.Status::Open);
        if LeaveReq.Find('-')
        then begin
            VarVariant := LeaveReq;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);

                ApprovalEntry.Reset();
                ApprovalEntry.SetRange("Document No.", ReqNo);
                if ApprovalEntry.Find('-') then begin
                    repeat
                        // CustApprovals.ApprovalsHouseCleaning(ApprovalEntry);
                        if HREmp.get(LeaveReq."Employee No") then begin
                            //  ApprovalEntry.Description := LeaveReq.Purpose;
                            ApprovalEntry."Salespers./Purch. Code" := LeaveReq."Employee No";
                            if HREmp."User ID" <> '' then begin
                                ApprovalEntry."Sender ID" := HREmp."User ID";
                                HREmp.TestField("Supervisor");
                                ApprovalEntry."Approver ID" := HREmp."Supervisor";
                                ApprovalEntry.Status := ApprovalEntry.Status::Open;
                                ApprovalEntry.Modify();
                            end;
                        end;
                    until ApprovalEntry.Next() = 0;
                end;
                //end;

                FromRecRef.GETTABLE(LeaveReq);
                RecID := FromRecRef.RecordId;
                ApprovalEntry.Reset();
                ApprovalEntry.SetRange("Record ID to Approve", RecID);
                ApprovalEntry.SetFilter(Status, '=%1', ApprovalEntry.Status::Open);
                if ApprovalEntry.Find('-') then begin
                    repeat
                        SendApprovalEmailAlert(ReqNo, ApprovalEntry."Table ID", ApprovalEntry."Approver ID");
                    until ApprovalEntry.Next() = 0;
                end;
                HREmp.Reset();
                HREmp.SetRange("No.", LeaveReq."Employee No");
                if HREmp.Find('-') then begin
                    if HREmp."Company E-Mail" <> '' then begin
                        msg := '';
                        msg := 'Dear ' + HREmp.Title + ' ' + HREmp."Last Name" + ',<br /><br />';
                        msg := msg + 'Your' + Format(LeaveReq."Application Type") + ' leave allocation Request has been submitted Successfully for approval.<br /><br />';

                        SendEmail(HREmp."Company E-Mail", 'Confirmation of Receipt: ' + ReqNo + '(' + Format(LeaveReq."Application Type") + ' Leave)', msg);
                    end;
                end;
                LeaveAllR.Reset;
                LeaveAllR.SetRange(LeaveAllR."No.", ReqNo);
                if LeaveAllR.Find('-')
                then begin
                    Commit();
                    LeaveAllR.Status := LeaveAllR.Status::"Pending Approval";
                    LeaveAllR.Modify();
                end;
            end;
        end;
    end;

    PROCEDURE CancelLeaveRequisition(AppNo: Code[20]; Recalled: Boolean; Cancelled: Boolean);
    var
        ApprovalEntry: Record "Approval Entry";
        RecID: RecordID;
        FromRecRef: RecordRef;
    BEGIN
        LeaveReq.RESET;
        LeaveReq.SETRANGE("No.", AppNo);
        IF LeaveReq.FIND('-') THEN BEGIN
            FromRecRef.GETTABLE(LeaveReq);
            RecID := FromRecRef.RecordId;
            ApprovalEntry.Reset();
            ApprovalEntry.SetRange("Record ID to Approve", RecID);
            ApprovalEntry.SetFilter(Status, '=%1', ApprovalEntry.Status::Open);
            ApprovalEntry.SetFilter("Sequence No.", '=%1', 1);
            if ApprovalEntry.Find('-') then begin
                VarVariant := LeaveReq;
                // CustApprovals.ApprovalsHouseCleaning(ApprovalEntry);
                // IF CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) THEN begin
                CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
                Commit();
                //  ChangeLeaveStatus(AppNo, Recalled, Cancelled);
                //end;
                repeat
                    HREmp.Reset();
                    HREmp.SetRange("User ID", ApprovalEntry."Approver ID");
                    if HREmp.Find('-') then begin
                        if HREmp."Company E-Mail" <> '' then begin
                            if Recalled = true then
                                SendEmail(HREmp."Company E-Mail", '' + Format(LeaveReq."Application Type") + ' LEAVE', 'A ' + Format(LeaveReq."Application Type") + ' leave, Document Number ' + AppNo + ' from ' + LeaveReq."Employee Name" + ' has been recalled');

                            if Cancelled = true then
                                SendEmail(HREmp."Company E-Mail", '' + Format(LeaveReq."Application Type") + ' LEAVE', 'A ' + Format(LeaveReq."Application Type") + ' leave, Document Number ' + AppNo + ' from ' + LeaveReq."Employee Name" + ' has been Cancelled');
                        end;
                    end;
                until ApprovalEntry.Next() = 0;
            end else begin
                if Recalled = true then
                    Error('You can not recall this document. First level has alredy approved the document');
                if Cancelled = true then
                    Error('You can not Cancel this document. First level has alredy approved the document');
            end;
        END;
    END;

    procedure SendApprovalEmailAlert(DocNumber: Code[20]; TableID: Integer; UserID: Code[50])
    var
        HRTraining: Record "Training Requests";
        GenSetup: Record "Human Resources Setup";
        msg: Text;
        FromName: Text;
        Emplyoyee: Record "Employee";
        ReliverEmail: Text;
        EmpName: Text;
        HREmp2: Record Employee;
    begin
        FromName := '';
        GenSetup.Get();
        HREmp.Reset();
        HREmp.SetRange("User ID", UserID);
        if HREmp.Find('-') then begin
            msg := '';
            if TableID = Database::"HR Leave Application" then begin
                LeaveT.Reset();
                LeaveT.SetRange("Application Code", DocNumber);
                if LeaveT.Find('-') then begin
                    if Emplyoyee.Get(LeaveT."Employee No") then begin
                        FromName := Emplyoyee."First Name" + ' ' + Emplyoyee."Middle Name" + ' ' + Emplyoyee."Last Name";
                    end;
                    if HREmp."Company E-Mail" <> '' then begin
                        msg := 'Dear ' + HREmp.Title + ' ' + HREmp."Last Name" + ',<br /><br />';
                        msg := msg + 'You have a new leave application request from ' + FromName + ' that requires your attention.<br /><br />';
                        msg := msg + '<b />Details:<br /><br />';
                        msg := msg + '<b>Applicant Name:</b> <i>' + LeaveT."Employee Name" + '</i><br /><br />';
                        msg := msg + '<b>Type of Leave: </b><i>' + LeaveT."Leave Type" + '</i><br /><br />';
                        msg := msg + '<b>Start Date: </b><i>' + Format(LeaveT."Start Date") + '</i><br /><br />';
                        msg := msg + '<b>End Date: </b><i>' + Format(LeaveT."End Date") + '</i><br /><br />';
                        msg := msg + '<b>Return Date: </b><i>' + Format(LeaveT."Return Date") + '</i><br /><br />';
                        msg := msg + '<b>No of Days: </b><i>' + Format(LeaveT."Days Applied") + '</i><br /><br />';
                        // msg := msg + 'To view the application, follow the link below:<br /><br />';
                        //msg := msg + '<a href="' + GenSetup."Link Portal URL" + '">click this link to approve</a>';

                        SendEmail(HREmp."Company E-Mail", 'Leave Approval Request: ' + DocNumber + '(Leave Number)', msg);
                    end;
                    ////Notify Reliever//////////////////
                    HREmp2.Reset();
                    HREmp2.SetRange("No.", LeaveT.Reliever);
                    if HREmp2.Find('-') then begin
                        ReliverEmail := HREmp2."Company E-Mail";
                        HREmp.Reset();
                        HREmp.SetRange("No.", LeaveT."Employee No");
                        HREmp.SetFilter("Company E-Mail", '<>%1', '');
                        if HREmp.find('-') then begin
                            EmpName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                            if ReliverEmail <> '' then begin
                                msg := '';
                                msg := 'Dear  ' + HREmp2.Title + ' ' + HREmp2."Last Name" + ',<br /><br />';
                                msg := msg + 'You have been chosen by ' + EmpName + ' as a reliever while on Leave.<br /><br />';
                                msg := msg + '<b />Details:<br /><br />';
                                msg := msg + '<b>Applicant Name:</b> <i>' + LeaveT."Employee Name" + '</i><br /><br />';
                                msg := msg + '<b>Type of Leave: </b><i>' + LeaveT."Leave Type" + '</i><br /><br />';
                                msg := msg + '<b>Start Date: </b><i>' + Format(LeaveT."Start Date") + '</i><br /><br />';
                                msg := msg + '<b>End Date: </b><i>' + Format(LeaveT."End Date") + '</i><br /><br />';
                                msg := msg + '<b>Return Date: </b><i>' + Format(LeaveT."Return Date") + '</i><br /><br />';
                                msg := msg + '<b>No of Days: </b><i>' + Format(LeaveT."Days Applied") + '</i><br /><br />';
                                SendEmail(ReliverEmail, 'APPLICATION NO: ' + DocNumber + '(Leave Number)', msg);
                            end;
                        end;
                    end;
                end;
            end;
            if TableID = Database::"Purchase Header" then begin
                objPurchaseHeader.Reset();
                objPurchaseHeader.SetRange("No.", DocNumber);
                if objPurchaseHeader.Find('-') then begin
                    if Emplyoyee.Get(objPurchaseHeader."Assigned User ID") then begin
                        FromName := Emplyoyee."First Name" + ' ' + Emplyoyee."Middle Name" + ' ' + Emplyoyee."Last Name";
                    end;
                    if HREmp."Company E-Mail" <> '' then begin
                        msg := '';
                        msg := 'Dear  ' + HREmp.Title + ' ' + HREmp."Last Name" + ',<br /><br />';
                        msg := msg + 'You have a new Purchase application request from ' + FromName + ' that requires your attention.<br /><br />';
                        msg := msg + '<b>Purpose: </b><i>';
                        msg := msg + objPurchaseHeader."Posting Description" + '</i><br /><br />';
                        msg := msg + 'To view the application, follow the link below:<br />';
                        // msg := msg + '<a href="' + GenSetup."Link Portal URL" + '">click this link to approve</a>';

                        SendEmail(HREmp."Company E-Mail", 'Purchase Approval Request: ' + DocNumber + '(Purchase Number)', msg);
                    end;
                end;
            end;
            // if TableID = Database::"Store Requistion Header" then begin
            //     StoreRequisition.Reset();
            //     StoreRequisition.SetRange("No.", DocNumber);
            //     if StoreRequisition.Find('-') then begin
            //         if Emplyoyee.Get(StoreRequisition."Employee No") then begin
            //             FromName := Emplyoyee."First Name" + ' ' + Emplyoyee."Middle Name" + ' ' + Emplyoyee."Last Name";
            //         end;
            //         if HREmp."Company E-Mail" <> '' then begin
            //             msg := '';
            //             msg := 'Dear Sir/Madam,<br /><br />';
            //             msg := msg + 'You have a new Store application request from ' + FromName + ' that requires your attention.<br /><br />';
            //             msg := msg + '<b>Purpose: </b><i>';
            //             msg := msg + StoreRequisition."Request Description" + '</i><br /><br />';
            //             msg := msg + 'To view the application, follow the link below:<br /><br />';
            //             msg := msg + '<a href="' + GenSetup."Link Portal URL" + '">click this link to aprove</a>';

            //             SendEmail(HREmp."Company E-Mail", 'Store Approval Request: ' + DocNumber + '(Store Number)', msg);
            //         end;
            //     end;
            // end;
            // if TableID = Database::"Imprest Header" then begin
            //     ImprestRequisition.Reset();
            //     ImprestRequisition.SetRange("No.", DocNumber);
            //     if ImprestRequisition.Find('-') then begin
            //         if Emplyoyee.Get(ImprestRequisition."Employee No.") then begin
            //             FromName := Emplyoyee."First Name" + ' ' + Emplyoyee."Middle Name" + ' ' + Emplyoyee."Last Name";
            //         end;
            //         if HREmp."Company E-Mail" <> '' then begin
            //             msg := '';
            //             msg := 'Dear Sir/Madam,<br /><br />';
            //             msg := msg + 'You have a new Imprest application request from ' + FromName + ' that requires your attention.<br /><br />';
            //             msg := msg + '<b>Purpose: <b><i>';
            //             msg := msg + ImprestRequisition.Purpose + '</i><br /><br />';
            //             msg := msg + 'To view the application, follow the link below:<br /><br />';
            //             msg := msg + '<a href="' + GenSetup."Link Portal URL" + '">click this link to approve</a>';

            //             SendEmail(HREmp."Company E-Mail", 'Imprest Approval Request: ' + DocNumber + '(Imprest Number)', msg);
            //         end;
            //     end;
            // end;
            // if TableID = Database::"Imprest Surrender Header" then begin
            //     objImprestSurrender.Reset();
            //     objImprestSurrender.SetRange(No, DocNumber);
            //     if objImprestSurrender.Find('-') then begin
            //         if Emplyoyee.Get(objImprestSurrender."Employee No") then begin
            //             FromName := Emplyoyee."First Name" + ' ' + Emplyoyee."Middle Name" + ' ' + Emplyoyee."Last Name";
            //         end;
            //         if HREmp."Company E-Mail" <> '' then begin
            //             msg := '';
            //             msg := 'Dear Sir/Madam,<br /><br />';
            //             msg := msg + 'You have a new Imprest Surrender application reques from ' + FromName + ' that requires your attention.<br /><br />';
            //             msg := msg + '<b>Purpose: </b><i>';
            //             msg := msg + objImprestSurrender.Remarks + ' ' + objImprestSurrender."Imp Purpose" + '</i><br /><br />';
            //             msg := msg + 'To view the application, follow the link below:<br /><br />';
            //             msg := msg + '<a href="' + GenSetup."Link Portal URL" + '">click this link to approve</a>';

            //             SendEmail(HREmp."Company E-Mail", 'Imprest Surrender Approval Request: ' + DocNumber + '(Surrender Number)', msg);
            //         end;
            //     end;
            // end;
            // if TableID = Database::"Staff Claims Header" then begin
            //     StaffClaims.Reset();
            //     StaffClaims.SetRange("No.", DocNumber);
            //     if StaffClaims.Find('-') then begin
            //         if Emplyoyee.Get(StaffClaims."Employee No") then begin
            //             FromName := Emplyoyee."First Name" + ' ' + Emplyoyee."Middle Name" + ' ' + Emplyoyee."Last Name";
            //         end;
            //         if HREmp."Company E-Mail" <> '' then begin
            //             msg := '';
            //             msg := 'Dear Sir/Madam,<br /><br />';
            //             msg := msg + 'You have a new Staff Claim application request from ' + FromName + ' that requires your attention.<br /><br />';
            //             msg := msg + '<b>Purpose: </b><i>';
            //             msg := msg + StaffClaims.Purpose + '</i><br /><br />';
            //             msg := msg + 'To view the application, follow the link below:<br /><br />';
            //             msg := msg + '<a href="' + GenSetup."Link Portal URL" + '">click this link to approve</a>';

            //             SendEmail(HREmp."Company E-Mail", 'Staff Claim Approval Request: ' + DocNumber + '(Claim Number)', msg);
            //         end;
            //     end;
            // end;
            if TableID = Database::"Transport Requisition" then begin
                TransportRequisition.Reset();
                TransportRequisition.SetRange("Transport Requisition No", DocNumber);
                if TransportRequisition.Find('-') then begin
                    if Emplyoyee.Get(TransportRequisition."Employee No") then begin
                        FromName := Emplyoyee."First Name" + ' ' + Emplyoyee."Middle Name" + ' ' + Emplyoyee."Last Name";
                    end;
                    if HREmp."Company E-Mail" <> '' then begin
                        msg := '';
                        msg := 'Dear  ' + HREmp.Title + ' ' + HREmp."Last Name" + ',<br /><br />';
                        msg := msg + 'You have a new Transport application request from ' + FromName + ' that requires your attention.<br /><br />';
                        msg := msg + '<b>Purpose: </b><i>';
                        msg := msg + TransportRequisition.Comments + '</i><br /><br />';
                        msg := msg + 'To view the application, follow the link below:<br /><br />';
                        // msg := msg + '<a href="' + GenSetup + '">click this link to approve</a>';

                        SendEmail(HREmp."Company E-Mail", 'Transport Approval Request: ' + DocNumber + '(Transport Number)', msg);
                    end;
                end;
            end;
            if TableID = Database::"Training Requests" then begin
                HRTraining.Reset();
                HRTraining.SetRange("Code", DocNumber);
                if HRTraining.Find('-') then begin
                    if Emplyoyee.Get(HRTraining."Employee No.") then begin
                        FromName := Emplyoyee."First Name" + ' ' + Emplyoyee."Middle Name" + ' ' + Emplyoyee."Last Name";
                    end;
                    if HREmp."Company E-Mail" <> '' then begin
                        msg := '';
                        msg := 'Dear  ' + HREmp.Title + ' ' + HREmp."Last Name" + ',<br /><br />';
                        msg := msg + 'You have a new Training application request from ' + FromName + ' that requires your attention.<br /><br />';
                        msg := msg + '<b>Purpose: </b><i>';
                        //msg := msg + HRTraining."Purpose of Training" + '</i><br /><br />';
                        msg := msg + 'To view the application, follow the link below:<br /><br />';
                        // msg := msg + '<a href="' + GenSetup."Link Portal URL" + '">click this link to approve</a>';

                        SendEmail(HREmp."Company E-Mail", 'Training Approval Request: ' + DocNumber + '(Training Number)', msg);
                    end;
                end;
            end;
        end;
        //  else
        //     Error('Your user id not set. Contact HR');
    end;

    procedure HRTimeOffLieu(EmployeeNo: Code[20]; AppliedDays: Decimal; SenderComments: Text; ResponsibilityCenter: Code[20]; UserID: Text; StartDate: Date; StartTime: Time; EndTime: Time) DocNo: Code[20]
    var
        GenLedgerSetup: Record "General Ledger Setup";
        TheTable: Record "HR Leave Allocation Request";
    begin

        HRSetup.Get;
        //if HRSetup."Used For Approval" = HRSetup."Used For Approval"::" " then
        // Error('Select what to use for approval in HR Setup');

        //if HRSetup."Close Leave Application" = true then Error('Please note that the leave application is currently closed, Kindly contact your leave Administrator');
        LeaveReq.Init();
        IF LeaveReq."No." = '' THEN BEGIN
            TheTable.RESET;
            IF TheTable.FINDLAST THEN BEGIN
                LeaveReq."No." := INCSTR(TheTable."No.")
            END ELSE BEGIN
                LeaveReq."No." := 'Appl0001';
            END;
        END;
        NextNo := LeaveReq."No.";

        LeaveReq."Leave Type" := 'TIME OFF';
        LeaveReq."Applied Days" := AppliedDays;
        LeaveReq."User ID" := UserID;
        LeaveReq."Employee No" := EmployeeNo;
        LeaveReq."Starting Date" := StartDate;
        LeaveReq."Time Off Start" := StartTime;
        LeaveReq."Time Off End" := EndTime;
        LeaveReq."Application Type" := LeaveReq."Application Type"::"Time Off";
        LeaveReq."Adjustment Type" := LeaveReq."Adjustment Type"::"Positive Adjustment";
        if HREmp.Get(EmployeeNo) then begin
            HREmp.TestField(Gender);
            //HREmp.TestField("Global Dimension 2 Code");
            LeaveReq."Employee Name" := HREmp.FullName();
            LeaveReq."Approver ID" := HREmp.Supervisor;
            LeaveReq."Responsibility Center" := HREmp."Responsibility Center";
            // if ((HRSetup."Used For Approval" = HRSetup."Used For Approval"::" ") and (LeaveReq."Responsibility Center" = '')) then
            // Error('Employee responsibility not Set in HR');

            LeaveReq."Department Code" := HREmp."Global Dimension 2 Code";
            //LeaveReq.Validate("Department Code");
            LeaveReq."Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            //LeaveReq.Validate("Global Dimension 1 Code");
        end;

        LeaveReq."Date" := Today;
        LeaveReq.Purpose := SenderComments;
        LeaveReq.Validate("Reliever No.");
        LeaveReq.Status := LeaveReq.Status::Posted;
        LeaveReq.Insert(false);

        LeaveReq.Reset();
        LeaveReq.SetRange("No.", NextNo);
        if LeaveReq.Find('-') then begin
            // LeaveReq.Validate("Applied Days");
            // LeaveReq.Validate("Reliever No.");
        end;
        //LeaveRequisitionsApprovalRequest(NextNo);
        DocNo := NextNo;
    end;

    procedure HRLeaveCarryForward(EmployeeNo: Code[20]; AppliedDays: Decimal; SenderComments: Text; ResponsibilityCenter: Code[20]; UserID: Text) DocNo: Code[20]
    var
        GenLedgerSetup: Record "General Ledger Setup";
        TheTable: Record "HR Leave Allocation Request";
    begin

        HRSetup.Get;
        // if HRSetup."Used For Approval" = HRSetup."Used For Approval"::" " then
        //Error('Select what to use for approval in HR Setup');

        // if HRSetup."Close Leave Application" = true then Error('Please note that the leave application is currently closed, Kindly contact your leave Administrator');
        LeaveReq.Init();
        IF LeaveReq."No." = '' THEN BEGIN
            TheTable.RESET;
            IF TheTable.FINDLAST THEN BEGIN
                LeaveReq."No." := INCSTR(TheTable."No.")
            END ELSE BEGIN
                LeaveReq."No." := 'Appl0001';
            END;
        END;
        NextNo := LeaveReq."No.";

        LeaveReq."Leave Type" := 'ANNUAL';
        LeaveReq."Applied Days" := AppliedDays;
        LeaveReq."User ID" := UserID;
        LeaveReq."Employee No" := EmployeeNo;
        LeaveReq."Application Type" := LeaveReq."Application Type"::"Carry Forward";
        LeaveReq."Adjustment Type" := LeaveReq."Adjustment Type"::"Positive Adjustment";
        if HREmp.Get(EmployeeNo) then begin
            HREmp.TestField(Gender);
            HREmp.TestField("Global Dimension 2 Code");
            LeaveReq."Employee Name" := HREmp.FullName();
            LeaveReq."Approver ID" := HREmp.Supervisor;
            LeaveReq."Responsibility Center" := HREmp."Responsibility Center";
            // if ((HRSetup."Used For Approval" = HRSetup."Used For Approval"::" ") and (LeaveReq."Responsibility Center" = '')) then
            //    Error('Employee responsibility not Set in HR');

            LeaveReq."Department Code" := HREmp."Global Dimension 2 Code";
            LeaveReq.Validate("Department Code");
            LeaveReq."Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            LeaveReq.Validate("Global Dimension 1 Code");

        end;

        LeaveReq."Date" := Today;
        LeaveReq.Purpose := SenderComments;
        LeaveReq.Validate("Reliever No.");
        LeaveReq.Status := LeaveReq.Status::Open;
        LeaveReq.Insert(false);

        LeaveReq.Reset();
        LeaveReq.SetRange("No.", NextNo);
        if LeaveReq.Find('-') then begin
            // LeaveReq.Validate("Applied Days");
            // LeaveReq.Validate("Reliever No.");
        end;
        LeaveRequisitionsApprovalRequest(NextNo);
        DocNo := NextNo;
    end;

    Procedure ApproveLeaveReimbursement(DocNo: Text; ApprovedDays: Integer; ApproversComments: Text; ApproverID: Text)
    begin
        LeaveReq.Reset;
        LeaveReq.SetRange(LeaveReq."No.", DocNo);

        if LeaveReq.Find('-')
        then begin
            LeaveReq."Days Approved" := ApprovedDays;
            LeaveReq."Approvers Comments" := ApproversComments;
            LeaveReq."Approver ID" := ApproverID;
            LeaveReq.modify;
        end;
    end;

    procedure SendEmail(receiver: Text[50]; subject: Text[100]; message: Text[1000]) returnValue: Boolean
    var
        SMTPMail: Codeunit "Email Message";
        SendEmail: codeunit email;
        MailManagement: Codeunit "Mail Management";
        SendToList: List of [Text];
        SenderEmail: Text;
        ret: Boolean;
        // EmailSender: Record "Email Sender";
        HRSetup: Record "Human Resources Setup";
    begin
        HRSetup.Get();
        // if HRSetup."Enable Emails" = true then begin
        returnValue := FALSE;
        //SMTPMailSetup.GET;
        returnValue := false;
        //ret := SystemRegex.IsMatch(receiver, '^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$', SystemRegexOptions.IgnoreCase);
        //if ret then begin
        //SMTPMailSetup.GETSetup;
        SendToList.Add(receiver);
        SMTPMail.Create(SendToList, subject, message, true);
        SendEmail.Send(SMTPMail, Enum::"Email Scenario"::Default);
        returnValue := TRUE;
        // end else begin
        //     EmailSender.Reset;
        //     EmailSender.SetRange(EmailSender."Receiver Email", receiver);
        //     if EmailSender.FindSet then begin
        //         repeat
        //             EmailSender."Sent?" := true;s
        //             EmailSender.Modify;
        //         until EmailSender.Next = 0;
        //     end;
        // end;
        // end;
    end;

    procedure InsertEmployeeRequisition(StaffNo: Text; RecruitmentPlan: Text; PlanType: Option; Position: Text; DirectorateCode: Text; DepartmentCode: Text; County: Text; FinacialYear: Text; Vacancies: Integer; RecruitmentReason: Text; Justification: Text; CandidateSource: Option; SourcingMethod: option; StartDate: Date; EndDate: Date) DocNo: text
    begin
        EmpReq.Init();
        EmpReq."Document Type" := EmpReq."document type"::"Recruitment Requisition";
        if HumanResourcesSetup.Get() then
            HumanResourcesSetup.TestField("Recruitment Requsition Nos.");
        DocNo := NoSeriesMgt.GetNextNo(HumanResourcesSetup."Recruitment Requsition Nos.", 0D, True);
        EmpReq."Document No." := DocNo;
        EmpReq."Document Date" := Today;
        EmpReq."Requester Staff No" := StaffNo;
        UserSetup.reset;
        UserSetup.setrange(UserSetup."Employee No.", StaffNo);
        if UserSetup.find('-') then
            EmpReq."Requester ID" := UserSetup."User ID";
        EmpReq."Recruitment Plan ID" := RecruitmentPlan;
        EmpReq."Recruitment Plan Type" := PlanType;
        EmpReq."Position ID" := Position;
        EmpReq.Validate("Position ID");
        EmpReq.Directorate := "DirectorateCode";
        EmpReq.Department := "DepartmentCode";
        EmpReq.Region := County;
        EmpReq."Created By" := UserSetup."User ID";
        EmpReq."Created On" := Today;
        EmpReq."Created Time" := Time;
        EmpReq."Finacial Year Code" := FinacialYear;
        EmpReq."No of Openings" := Vacancies;
        EmpReq."Primary Recruitment Reason" := RecruitmentReason;
        EmpReq."Recruitment Justification" := Justification;
        EmpReq."Target Candidate Source" := CandidateSource;
        EmpReq."Sourcing Method" := SourcingMethod;
        EmpReq."Planned Recruitment Start Date" := StartDate;
        EmpReq."Planned Recruitment End Date" := EndDate;
        EmpReq.Insert(true);



    end;

    procedure GeneratePNineReport(EmployeeNo: Text; Period: Integer) BaseImage: Text
    var
        "prSalary Card": Record "pr Salary Card";
        PrEmployee: Record Employee;
    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        PrEmployee.Reset;
        PrEmployee.SetRange(PrEmployee."No.", EmployeeNo);
        PrEmployee.SetFilter(PrEmployee."Period Year Filter", '%1', Period);
        if PrEmployee.Find('-') then begin
            RecRef.GetTable(PrEmployee);
            Report.SaveAs(Report::"P9 Report (Final)", '', ReportFormat::Pdf, OutStr, RecRef);
            FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('P9_%1.Pdf', PrEmployee."No."), TRUE);
            TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
        end;
    end;

    procedure ReturnBase64FromReport(ReportPath: Text) PDFFile: Text
    var
        ToFile: Text;
        imageinstream: InStream;
        Image6txt2: BigText;
        FilenameDT: File;
        imagetext7: Text;
    //Bytes: dotnet Array;
    //Convert: dotnet Convert;
    //MemoryStream: dotnet MemoryStream;
    Begin
        filename := FILESPATH + ReportPath;
        CLEAR(Image6txt2);
        // IF FilenameDT.OPEN(filename) THEN BEGIN
        //     FilenameDT.CREATEINSTREAM(imageinstream);
        //     MemoryStream := MemoryStream.MemoryStream();
        //     COPYSTREAM(MemoryStream, imageinstream);
        //     Bytes := MemoryStream.GetBuffer();
        //     Image6txt2.ADDTEXT(Convert.ToBase64String(Bytes));
        //     FilenameDT.CLOSE;
        //     Image6txt2.GETSUBTEXT(imagetext7, 1);
        //     PDFFile := imagetext7;
        // END;
        EXIT(PDFFile);
    End;

    procedure InsertSelfInitiatedTransfer(EmployeeNo: Text; Station1: Text; Station2: Text; Station3: Text; StaffUserId: Text; Comments: Text; Reason: Text) DocNo: Text
    begin
        HRSetup.Get;
        HRSetup.TestField("Employee Transfer Nos");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Employee Transfer Nos", 0D, True);

        Mobility.Init();
        Mobility."Employee No" := EmployeeNo;
        Mobility."Document No" := DocNo;
        Mobility.Validate("Employee No");
        Mobility.Type := Mobility.Type::"Self initiated";
        Mobility."Suggested Station 1" := Station1;
        Mobility."Suggested Station 2" := Station2;
        Mobility."Suggested Station 3" := Station3;
        Mobility.Validate("Suggested Station 1");
        Mobility.Validate("Suggested Station 2");
        Mobility.Validate("Suggested Station 3");
        Mobility."No. Series" := HRSetup."Employee Transfer Nos";
        Mobility."Created By" := StaffUserId;
        Mobility."Transfer Reason Code" := Reason;
        Mobility."Date Created" := Today;
        Mobility."Time Created" := Time;
        Mobility.Remarks := Comments;
        Mobility.Insert(false);

    end;

    procedure ModifySelfInitiatedTransfer(DocNo: Text; EmployeeNo: Text; Station1: Text; Station2: Text; Station3: Text; StaffUserId: Text; Comments: Text; Reason: Text)
    begin
        Mobility.Reset();
        Mobility.SetRange("Employee No", EmployeeNo);
        Mobility.SetRange("Document No", DocNo);
        if Mobility.Find('-') then begin
            Mobility."Suggested Station 1" := Station1;
            Mobility."Suggested Station 2" := Station2;
            Mobility."Suggested Station 3" := Station3;
            Mobility.Validate("Suggested Station 1");
            Mobility.Validate("Suggested Station 2");
            Mobility.Validate("Suggested Station 3");
            Mobility.Remarks := Comments;
            Mobility."Transfer Reason Code" := Reason;
            Mobility.Modify(false);
        end;
    end;

    procedure SendMobilityApproval(DocNo: Text)
    begin
        Mobility.Reset();
        Mobility.SetRange("Document No", DocNo);
        if Mobility.Find('-') then begin
            VarVariant := Mobility;
            IF CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end;

    end;

    procedure CancelMobilityApproval(DocNo: Text)
    begin
        Mobility.Reset();
        Mobility.SetRange("Document No", DocNo);
        if Mobility.Find('-') then begin
            VarVariant := Mobility;
            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
        end;

    end;

    procedure InsertManagementInitiatedTransfer(EmployeeNo: Text; Station1: Text; StaffUserId: Text; Comments: Text; TransferDate: Date) DocNo: Text
    begin
        HRSetup.Get;
        HRSetup.TestField("Employee Transfer Nos");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Employee Transfer Nos", 0D, True);

        Mobility.Init();
        Mobility."Employee No" := EmployeeNo;
        Mobility."Document No" := DocNo;
        Mobility.Validate("Employee No");
        Mobility.Type := Mobility.Type::"Management initiated";
        Mobility."New Station" := Station1;
        Mobility.Validate("New Station");
        Mobility."No. Series" := HRSetup."Employee Transfer Nos";
        Mobility."Created By" := StaffUserId;
        Mobility."Transfer Date" := TransferDate;
        Mobility."Date Created" := Today;
        Mobility."Time Created" := Time;
        Mobility.Remarks := Comments;
        Mobility.Insert(false);

    end;

    procedure ModifyManagementInitiatedTransfer(DocNo: Text; EmployeeNo: Text; Station1: Text; StaffUserId: Text; Comments: Text; TransferDate: Date)
    begin
        Mobility.Reset();
        Mobility.SetRange("Employee No", EmployeeNo);
        Mobility.SetRange("Document No", DocNo);
        if Mobility.Find('-') then begin
            Mobility."New Station" := Station1;
            Mobility.Validate("New Station");
            Mobility."Transfer Date" := TransferDate;
            Mobility.Remarks := Comments;
            Mobility.Modify(false);
        end;
    end;

    procedure InsertEmployeeClockIn(EmpNo: Text; ClockinDate: Date; ClockinTime: Time)
    begin
        ClockIn.init;
        ClockIn."Employee No" := EmpNo;
        ClockIn.Validate("Employee No");
        ClockIn."Clockin Date" := ClockinDate;
        ClockIn."Clockin Time" := ClockinTime;
        ClockIn."Date Created" := CurrentDateTime;
        ClockIn.Insert;
    end;

    procedure InsertEmployeeClockOut(EmpNo: Text; ClockOutDate: Date; ClockOutTime: Time)
    begin
        ClockIn.Reset();
        ClockIn.SetRange("Employee No", EmpNo);
        ClockIn.SetRange("Clockin Date", ClockOutDate);
        if ClockIn.find('-') then begin
            ClockIn."Clockin Time" := ClockOutTime;
            ClockIn."Date Created" := CurrentDateTime;
            ClockIn.Modify;
        end;
    end;

    Procedure InsertFuelCard(EmpUserId: Text; RegistrationNo: Text; CardType: Text; StartDate: date) DocNo: Text
    var
        FuelCard: Record "Fuel Card";
    begin
        FltMgtSetup.Get();
        FltMgtSetup.TestField(FltMgtSetup."Fuel Card No");
        DocNo := NoSeriesMgt.GetNextNo(FltMgtSetup."Fuel Card No", 0D, True);
        FuelCard.init;
        FuelCard.No := DocNo;
        FuelCard."Registration No." := RegistrationNo;
        FuelCard.Validate("Registration No.");
        FuelCard."Created By" := EmpUserId;
        FuelCard."Card Type" := CardType;
        FuelCard."Start Date" := StartDate;
        FuelCard.Insert(true);
    end;








    Procedure InsertFuelCardLines(DocNo: Text; RecieptNo: Text; Amount: decimal; FuelDate: Date; Driver: Text): Text
    var
        FuelCard: Record "Fuel Card";
        FuelLine: Record "Vehicle Fuel Card Lines";
    begin
        if FuelCard.get(DocNo) then
            FuelLine.init;
        FuelLine."No." := DocNo;
        FuelLine."Reciept No" := RecieptNo;
        FuelLine.Amount := Amount;
        FuelLine."Date of Fueling" := FuelDate;
        FuelLine.Driver := Driver;
        FuelLine.Validate(Driver);
        FuelLine."Vehicle RegNo" := FuelCard."Registration No.";
        FuelLine.Validate("Vehicle RegNo");
        if FuelLine.insert then
            EXIT('Success')
        else
            EXIT('Failed');

    end;

    Procedure SendFuelCardApproval(DocNo: Text)
    var
        FuelCard: Record "Fuel Card";
    begin

        FuelCard.reset;
        FuelCard.Setrange(No, DocNo);
        if FuelCard.find('-') then begin
            VarVariant := FuelCard;
            IF CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end;
    end;

    Procedure CancelFuelCardApproval(DocNo: Text)
    var
        FuelCard: Record "Fuel Card";
    begin

        FuelCard.reset;
        FuelCard.Setrange(No, DocNo);
        if FuelCard.find('-') then begin
            VarVariant := FuelCard;
            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);

        end;
    end;

    procedure NewDisciplinaryCase(EmployeeNo: Text; ComplaintDate: Date; DisciplinaryCaseType: Text; CaseDescription: Text; PeriodFrom: Date; PeriodTo: Date; MultipleAccused: Boolean; CaseSeverity: Option; ModeofLodging: Text; RespC: Text; AccuserIsStaff: Boolean; AccuserName: Text; NonStaffOriginator: Text; PreviousInterventions: Text; "User ID": Text) DocNo: Text
    begin
        HRSetup.Get;
        HRSetup.TestField(HRSetup."Disciplinary Cases Nos.");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Disciplinary Cases Nos.", 0D, true);
        Disciplinary.Init();
        Disciplinary."Case Number" := DocNo;
        Disciplinary."Employee No" := EmployeeNo;
        Disciplinary.Validate("Employee No");
        Disciplinary."Document Date" := Today;
        Disciplinary."Date of Complaint" := ComplaintDate;
        Disciplinary."Type of Disciplinary Case" := DisciplinaryCaseType;
        Disciplinary."Period From" := PeriodFrom;
        Disciplinary."Period To" := PeriodTo;
        Disciplinary."Has Multiple Accused Employees" := MultipleAccused;
        Disciplinary."Case Description" := CaseDescription;
        Disciplinary."Case Severity" := CaseSeverity;
        Disciplinary."Mode of Lodging the Complaint" := ModeofLodging;
        Disciplinary."Responsibility Center" := RespC;
        Disciplinary."Accuser Is Staff" := AccuserIsStaff;
        // if HREmp.Get(EmployeeNo) then
        Disciplinary."Created By" := "User ID";
        Disciplinary.Accuser := AccuserName;
        Disciplinary."Non Staff Originator" := NonStaffOriginator;
        Disciplinary."Previous Interventions" := PreviousInterventions;
        Disciplinary.Type := Disciplinary.Type::Disciplinary;
        Disciplinary.Insert(false);

    end;


    Procedure InsertGrievance(EmployeeNo: Text; Description: Text; AccusedEmployee: Text; DateCreated: Date) DocNo: Text
    begin
        HRSetup.Get;
        HRSetup.TestField("Discipline Grievance Nos.");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Discipline Grievance Nos.", 0D, true);
        Grievance.Init();
        Grievance."No." := DocNo;
        Grievance."Employee No." := EmployeeNo;
        Grievance.Description := Description;
        Grievance.Validate("Employee No.");
        Grievance.Type := Grievance.Type::Grievance;
        Grievance."Accused Employee" := AccusedEmployee;
        Grievance."Document Date" := Today;
        Grievance."Date Created" := DateCreated;
        if HREmp.Get(EmployeeNo) then
            Grievance."Created By" := HREmp."User ID";
        Grievance.Status := Grievance.Status::New;
        Grievance.Insert(false);
    end;

    Procedure InsertSurcharge(EmployeeNo: Text; Description: Text; AccusedEmployee: Text; DateCreated: Date; Value: Decimal; PropertyDescription: Text) DocNo: Text
    begin
        HRSetup.Get;
        HRSetup.TestField("Discipline Surcharge Nos.");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Discipline Surcharge Nos.", 0D, true);
        Grievance.Init();
        Grievance."No." := DocNo;
        Grievance."Employee No." := EmployeeNo;
        Grievance.Description := Description;
        Grievance.Validate("Employee No.");
        if HREmp.Get(EmployeeNo) then
            Grievance.Type := Grievance.Type::SurCharge;
        Grievance."Accused Employee" := AccusedEmployee;
        Grievance."Value of Property" := Value;
        Grievance."Document Date" := Today;
        Grievance."Description of Property" := PropertyDescription;
        Grievance."Date Created" := DateCreated;
        Grievance."Created By" := HREmp."User ID";
        Grievance.Status := Grievance.Status::New;
        Grievance.Insert(false);
    end;

    Procedure InsertAccusedEmployees(DocNo: Text; EmpNo: Text)
    var
        AccusedEmployees: Record "Discipline Accused Employees";
    begin
        AccusedEmployees.Init();
        AccusedEmployees."Case Number" := DocNo;
        AccusedEmployees."Employee No" := EmpNo;
        AccusedEmployees.Validate("Employee No");
        AccusedEmployees.Insert();
    end;

    procedure InsertInductionHeader(EmpNo: Text; StartDate: Date; EndDate: Date; Venue: Text; Workplans: Text) DocNo: Text
    var
        InductionHeader: Record "Induction Header";
    begin
        InductionHeader.Init;
        HRSetup.TestField("Induction Nos");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Induction Nos", 0D, true);
        InductionHeader."No." := DocNo;
        InductionHeader."Document Date" := Today;
        InductionHeader."Created By" := EmpNo;
        InductionHeader."Start Date" := StartDate;
        InductionHeader."End Date" := EndDate;
        InductionHeader.Venue := Venue;
        InductionHeader."No. Series" := HRSetup."Induction Nos";
        InductionHeader.Workplan := Workplans;
        InductionHeader.insert(false);

    end;

    procedure InsertInductionLines(DocNo: Text; Empno: Text)
    var
        InductionL: Record "Induction Lines";
    begin
        InductionL.Init();
        InductionL."Induction No." := DocNo;
        InductionL."Employee No." := Empno;
        InductionL.Validate("Employee No.");
        InductionL.insert();

    end;

    Procedure SendInductionApproval(DocNo: Text)
    var
        InductionHeader: Record "Induction Header";
    begin

        InductionHeader.reset;
        InductionHeader.Setrange("No.", DocNo);
        if InductionHeader.find('-') then begin
            VarVariant := InductionHeader;
            IF CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end;
    end;

    Procedure CancelInductionApproval(DocNo: Text)
    var
        InductionHeader: Record "Induction Header";
    begin

        InductionHeader.reset;
        InductionHeader.Setrange("No.", DocNo);
        if InductionHeader.find('-') then begin
            VarVariant := InductionHeader;
            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);

        end;
    end;

    procedure InsertWorkTicketHeader(DocumentNo: Text; VehicleNo: Text; MonthDate: Date; GOKWorkTicket: Text; PreviousWorkTcket: Text; Directorate: Text; AuthorizedBy: Text; CreatedBy: Text) DocNo: Text

    begin
        if DocumentNo = '' then begin
            WorkTicketHeader.init;
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Daily Work Ticket");
            DocNo := NoSeriesMgt.GetNextNo(FltMgtSetup."Daily Work Ticket", 0D, true);
            WorkTicketHeader."Daily Work Ticket" := DocNo;
            WorkTicketHeader."Vehicle Registration No" := VehicleNo;
            WorkTicketHeader.Validate("Vehicle Registration No");
            WorkTicketHeader."Month Date" := MonthDate;
            WorkTicketHeader.Validate("Month Date");
            WorkTicketHeader."Ticket No" := GOKWorkTicket;
            WorkTicketHeader."Previous Work Ticket No" := PreviousWorkTcket;
            WorkTicketHeader."Global Dimension 1 Code" := Directorate;
            WorkTicketHeader."Authorized By" := AuthorizedBy;
            WorkTicketHeader."Created By" := CreatedBy;
            WorkTicketHeader.Insert(false);
        end else begin
            WorkTicketHeader.reset();
            WorkTicketHeader.Setrange("Daily Work Ticket", DocumentNo);
            if WorkTicketHeader.Find('-') then begin
                WorkTicketHeader."Vehicle Registration No" := VehicleNo;
                WorkTicketHeader.Validate("Vehicle Registration No");
                WorkTicketHeader."Month Date" := MonthDate;
                WorkTicketHeader.Validate("Month Date");
                WorkTicketHeader."Ticket No" := GOKWorkTicket;
                WorkTicketHeader."Previous Work Ticket No" := PreviousWorkTcket;
                WorkTicketHeader."Global Dimension 1 Code" := Directorate;
                WorkTicketHeader."Authorized By" := AuthorizedBy;
                WorkTicketHeader."Created By" := CreatedBy;
                WorkTicketHeader.Modify(false);
            end;
        end;
    end;

    procedure UnsealBid(DocNo: Code[30])
    var
        myInt: Integer;
        Procurement: Codeunit "Procurement Processing";
        BidRegister: Record "Bid Opening Register";

    begin
        BidRegister.reset;
        BidRegister.SetRange(BidRegister.Code, DocNo);
        if BidRegister.FindFirst() then
            Procurement.UnsealBid(BidRegister);

    end;

    procedure CreateActivities(WrkCode: code[20]; Activities: Text[1080]; Outputs: Text; permomance: Text[1080]; AnnualTarget: Text[50])
    var
        myInt: Integer;
        WorkplanActivities: Record "Workplan Activity";
        DocNo: code[30];
    begin
        DocNo := '';
        SPMSetUp.get;
        WorkplanActivities.Init();
        DocNo := NoSeriesMgt.GetNextNo(SPMSetUp."Plan Activity Nos", 0D, true);
        WorkplanActivities."Strategic Plan ID" := WrkCode;
        WorkplanActivities.code := DocNo;
        WorkplanActivities."Annual Target" := AnnualTarget;
        WorkplanActivities.Outputs := Outputs;
        WorkplanActivities."Performance Measures" := permomance;
        WorkplanActivities.Descriptions := Activities;
        WorkplanActivities.Insert();
    end;

    procedure InsertWorkTicketLines(DocNo: Text; TransportNo: Text; WorkTicketDate: Date; Journey_Route: Text; OilDrawn: Decimal; FuelDrawn: Decimal; Timeout: Time; TimeIn: Time; OpeningOdometer: Decimal; ClosingOdometer: Decimal
    ; FuelPerKM: Decimal; OilPerKM: Decimal; FuelCarriedForward: Decimal; AuthorizedBy: Text; GOKOfficer: Text; DefectRecorded: Text; DefectDate: Date; ActionTaken: Text)
    begin
        WorkTicketLines.Init;
        WorkTicketLines."Daily Work Ticket" := DocNo;
        WorkTicketLines."Transport Requisition No" := TransportNo;
        WorkTicketLines.Validate("Transport Requisition No");
        WorkTicketLines.Validate(Destination);
        WorkTicketLines.Validate("Vehicle Allocated");
        WorkTicketLines.Date := WorkTicketDate;
        WorkTicketLines."Journey/Route" := Journey_Route;
        WorkTicketLines."Oil Drawn(Litres)" := OilDrawn;
        WorkTicketLines."Fuel Drawn(Litres)" := FuelDrawn;
        WorkTicketLines."Time out" := Timeout;
        WorkTicketLines."Time In" := TimeIn;
        WorkTicketLines."Opening Odometer Reading" := OpeningOdometer;
        WorkTicketLines."Closing Odometer Reading" := ClosingOdometer;
        WorkTicketLines."Total Kilometres" := ClosingOdometer - OpeningOdometer;
        WorkTicketLines."Miles Per Litre(Fuel)" := FuelPerKM;
        WorkTicketLines."Miles Per Litre(Oil)" := OilPerKM;
        WorkTicketLines."Fuel Carried Forward" := FuelCarriedForward;
        WorkTicketLines."Authorized By" := AuthorizedBy;
        WorkTicketLines."GOK Officer" := GOKOfficer;
        WorkTicketLines.Validate("Authorized By");
        WorkTicketLines.Defect := DefectRecorded;
        if DefectRecorded <> '' then begin
            WorkTicketLines."Defect Date" := DefectDate;
            WorkTicketLines."Action Taken Reported" := ActionTaken;
        end;
        WorkTicketLines.Insert;
    end;

    procedure ModifyWorkTicketLines(DocNo: Text; TransportNo: Text; EntryNo: Integer; WorkTicketDate: Date; Journey_Route: Text; OilDrawn: Decimal; FuelDrawn: Decimal; Timeout: Time; TimeIn: Time; OpeningOdometer: Decimal; ClosingOdometer: Decimal
   ; FuelPerKM: Decimal; OilPerKM: Decimal; FuelCarriedForward: Decimal; AuthorizedBy: Text; GOKOfficer: Text; DefectRecorded: Text; DefectDate: Date; ActionTaken: Text)
    begin
        WorkTicketLines.Reset();
        WorkTicketLines.Setrange("Daily Work Ticket", DocNo);
        WorkTicketLines.Setrange("Transport Requisition No", TransportNo);
        WorkTicketLines.Setrange(EntryNo, EntryNo);
        if WorkTicketLines.Find('-') then begin
            WorkTicketLines.Validate(Destination);
            WorkTicketLines.Validate("Vehicle Allocated");
            WorkTicketLines.Date := WorkTicketDate;
            WorkTicketLines."Journey/Route" := Journey_Route;
            WorkTicketLines."Oil Drawn(Litres)" := OilDrawn;
            WorkTicketLines."Fuel Drawn(Litres)" := FuelDrawn;
            WorkTicketLines."Time out" := Timeout;
            WorkTicketLines."Time In" := TimeIn;
            WorkTicketLines."Opening Odometer Reading" := OpeningOdometer;
            WorkTicketLines."Closing Odometer Reading" := ClosingOdometer;
            WorkTicketLines."Total Kilometres" := ClosingOdometer - OpeningOdometer;
            WorkTicketLines."Miles Per Litre(Fuel)" := FuelPerKM;
            WorkTicketLines."Miles Per Litre(Oil)" := OilPerKM;
            WorkTicketLines."Fuel Carried Forward" := FuelCarriedForward;
            WorkTicketLines."Authorized By" := AuthorizedBy;
            WorkTicketLines.Validate("Authorized By");
            WorkTicketLines."GOK Officer" := GOKOfficer;
            WorkTicketLines.Defect := DefectRecorded;
            if DefectRecorded <> '' then begin
                WorkTicketLines."Defect Date" := DefectDate;
                WorkTicketLines."Action Taken Reported" := ActionTaken;
            end;
            WorkTicketLines.Insert;
        end;
    end;

    procedure DeleteWorkTicketLines(DocNo: Text; TransportNo: Text; EntryNo: Integer)
    begin
        WorkTicketLines.Reset();
        WorkTicketLines.Setrange("Daily Work Ticket", DocNo);
        WorkTicketLines.Setrange("Transport Requisition No", TransportNo);
        WorkTicketLines.Setrange(EntryNo, EntryNo);
        if WorkTicketLines.Find('-') then begin
            WorkTicketLines.Delete;
        end;
    end;

    procedure InsertLeavePlannerHeader(EmployeeNo: Text; LeaveCalendar: Text) DocNo: Text
    begin
        LeavePlannerHeader.Init();
        HRSetup.Get;
        HRSetup.TestField(HRSetup."Leave Planner Nos.");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Leave Planner Nos.", 0D, true);
        LeavePlannerHeader."Application Code" := DocNo;
        LeavePlannerHeader."Employee No" := EmployeeNo;
        LeavePlannerHeader.Validate("Employee No");
        LeavePlannerHeader."No series" := HRSetup."Leave Planner Nos.";
        LeavePlannerHeader."Leave Calendar" := LeaveCalendar;
        LeavePlannerHeader.insert(false);
    end;

    procedure InsertLeavePlannerLines(DocNo: Text; EmpNo: Text; LeaveType: Text; StartDate: Date; DaysApplied: Decimal)
    begin
        LeavePlan.Init;
        LeavePlan."Application Code" := DocNo;
        LeavePlan.Validate("Employee No", EmpNo);
        LeavePlan."Leave Type" := LeaveType;
        LeavePlan."Days Applied" := DaysApplied;
        LeavePlan."Start Date" := StartDate;
        LeavePlan.Validate("Application Code");
        LeavePlan.Validate("Leave Type");
        LeavePlan.Validate("Days Applied");
        LeavePlan.Validate("Start Date");
        LeavePlan.Insert();

    end;

    procedure ModifyLeavePlannerLines(DocNo: Text; LineNo: Integer; LeaveType: Text; StartDate: Date; DaysApplied: Decimal)
    begin
        LeavePlan.Reset();
        LeavePlan.SetRange("Application Code", DocNo);
        LeavePlan.SetRange("Line No.", LineNo);
        if LeavePlan.find('-') then Begin
            LeavePlan."Leave Type" := LeaveType;
            LeavePlan."Days Applied" := DaysApplied;
            LeavePlan."Start Date" := StartDate;
            LeavePlan.Validate("Leave Type");
            LeavePlan.Validate("Days Applied");
            LeavePlan.Validate("Start Date");
            LeavePlan.Modify();
        end;
    end;

    procedure SendLeavePlannerApproval(DocNo: Text)
    begin
        LeavePlannerHeader.Reset();
        LeavePlannerHeader.SetRange("Application Code", DocNo);
        if LeavePlannerHeader.find('-') then Begin
            VarVariant := LeavePlannerHeader;
            IF CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end;
    end;

    Procedure CancelLeavePlannerHeader(DocNo: Text)
    begin
        LeavePlannerHeader.reset;
        LeavePlannerHeader.SetRange("Application Code", DocNo);
        if LeavePlannerHeader.find('-') then begin
            VarVariant := LeavePlannerHeader;
            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);

        end;
    end;

    Procedure UpdateApprovalEntrySenderID(TableID: Integer; DocumentNo: Text; SenderID: Text)
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.Setrange("Table ID", TableID);
        ApprovalEntry.Setrange("Document No.", DocumentNo);
        ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
        if ApprovalEntry.Find('-') then begin
            repeat
                ApprovalEntry."Sender ID" := SenderID;
                ApprovalEntry.Modify();
            until ApprovalEntry.Next = 0;
        end;
    end;

    procedure DocumentRejections(EntryNo: Integer; "Document No": Code[20]; UserID: Code[20]; CommentLineText: Text; "Table ID": Integer; SeqenceNo: Integer)
    var
        AppEntry: Record "Approval Entry";
        RecID: RecordID;
        FromRecRef: RecordRef;
        DocNumber: Code[100];
        DocN: Code[100];
        msg: Text;
    //HRTraining: Record "HR Training Applications";
    begin
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Entry No.", EntryNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", UserID);
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Open);
        if ApprovalEntry.Find('-') then begin
            DocNumber := FORMAT(ApprovalEntry."Record ID to Approve");
            DocNumber := CONVERTSTR(DocNumber, ':', ',');
            DocNumber := SELECTSTR(2, DocNumber);

            // IF (DocNumber = 'QUOTE') OR (DocNumber = 'ORDER') THEN BEGIN
            //     DocN := FORMAT(ApprovalEntry."Record ID to Approve");
            //     DocN := CONVERTSTR(DocN, ':', ',');
            //     DocN := SELECTSTR(3, DocN);
            //     DocNumber := DocN;
            // end;
            if not GuiAllowed then
                DocumentRejectionCommentLine(DocNumber, CommentLineText, UserID, ApprovalEntry."Document Type", ApprovalEntry."Record ID to Approve", "Table ID", SeqenceNo);
            ApprovalsMgmt.RejectApprovalRequests(ApprovalEntry);


            if "Table ID" = 69205 then begin
                LeaveT.Reset();
                LeaveT.SetRange("Application Code", DocNumber);
                if LeaveT.Find('-') then begin
                    if HREmp.Get(LeaveT."Employee No") then begin
                        if HREmp."Company E-Mail" <> '' then begin
                            msg := 'Dear  ' + HREmp.Title + ' ' + HREmp."Last Name" + ',<br /><br />';
                            msg := msg + 'Your leave application was declined.<br /><br />';
                            msg := msg + '<b>Reason:</b><i>' + CommentLineText + '</i>';
                            SendEmail(HREmp."Company E-Mail", 'Declined Application: ' + "Document No" + ' (Leave Number)', msg);
                        end;
                    end;
                end;
            end;
            if AppEntry."Table ID" = 38 then begin
                objPurchaseHeader.Reset();
                objPurchaseHeader.SetRange("No.", DocNumber);
                if objPurchaseHeader.Find('-') then begin
                    if HREmp.Get(objPurchaseHeader."Request-By No.") then begin
                        if HREmp."Company E-Mail" <> '' then begin
                            msg := '';
                            msg := 'Dear  ' + HREmp.Title + ' ' + HREmp."Last Name" + ',,<br /><br />';
                            msg := msg + 'Your purchase requisition was declined.<br /><br />';
                            msg := msg + '<b>Reason:</b><i>' + CommentLineText + '</i>';
                            SendEmail(HREmp."Company E-Mail", 'Rejected Application: ' + "Document No" + ' (Purchase Number)', msg);
                        end;
                    end;
                end;
            end;
            // if AppEntry."Table ID" = 70134954 then begin
            //     StoreRequisition.Reset();
            //     StoreRequisition.SetRange("No.", DocNumber);
            //     if StoreRequisition.Find('-') then begin
            //         if HREmp.Get(StoreRequisition."Employee No") then begin
            //             if HREmp."Company E-Mail" <> '' then begin
            //                 msg := '';
            //                 msg := 'Dear Sir/Madam,<br /><br />';
            //                 msg := msg + 'Your store requisition was declined.<br /><br />';
            //                 msg := msg + '<b>Reason:</b><i>' + CommentLineText + '</i>';
            //                 SendEmail(HREmp."Company E-Mail", 'Rejected Application: ' + "Document No" + ' (Store Number)', msg);
            //             end;
            //         end;
            //     end;
            // end;
            // if AppEntry."Table ID" = 70135176 then begin
            //     ImprestRequisition.Reset();
            //     ImprestRequisition.SetRange("No.", DocNumber);
            //     if ImprestRequisition.Find('-') then begin
            //         if HREmp.Get(ImprestRequisition."Employee No.") then begin
            //             if HREmp."Company E-Mail" <> '' then begin
            //                 msg := '';
            //                 msg := 'Dear Sir/Madam,<br /><br />';
            //                 msg := msg + 'Your imprest requisition was declined.<br /><br />';
            //                 msg := msg + '<b>Reason:</b><i>' + CommentLineText + '</i>';
            //                 SendEmail(HREmp."Company E-Mail", 'Rejected Application: ' + "Document No" + ' (Imprest Number)', msg);
            //             end;
            //         end;
            //     end;
            // end;
            // if AppEntry."Table ID" = 70135168 then begin
            //     objImprestSurrender.Reset();
            //     objImprestSurrender.SetRange(No, DocNumber);
            //     if objImprestSurrender.Find('-') then begin
            //         if HREmp.Get(objImprestSurrender."Employee No") then begin
            //             if HREmp."Company E-Mail" <> '' then begin
            //                 msg := '';
            //                 msg := 'Dear Sir/Madam,<br /><br />';
            //                 msg := msg + 'Your imprest surrender requisition was declined.<br /><br />';
            //                 msg := msg + '<b>Reason:</b><i>' + CommentLineText + '</i>';
            //                 SendEmail(HREmp."Company E-Mail", 'Rejected Application: ' + "Document No" + ' (Imprest Surrender Number)', msg);
            //             end;
            //         end;
            //     end;
            // end;
            // if AppEntry."Table ID" = 70135169 then begin
            //     StaffClaims.Reset();
            //     StaffClaims.SetRange("No.", DocNumber);
            //     if StaffClaims.Find('-') then begin
            //         if HREmp.Get(StaffClaims."Employee No") then begin
            //             if HREmp."Company E-Mail" <> '' then begin
            //                 msg := '';
            //                 msg := 'Dear Sir/Madam,<br /><br />';
            //                 msg := msg + 'Your staff clim requisition was declined.<br /><br />';
            //                 msg := msg + '<b>Reason:</b><i>' + CommentLineText + '</i>';
            //                 SendEmail(HREmp."Company E-Mail", 'Rejected Application: ' + "Document No" + ' (Claim Number)', msg);
            //             end;
            //         end;
            //     end;
            // end;
            if AppEntry."Table ID" = 59003 then begin
                TransportRequisition.Reset();
                TransportRequisition.SetRange("Transport Requisition No", DocNumber);
                if TransportRequisition.Find('-') then begin
                    if HREmp.Get(TransportRequisition."Requested By") then begin
                        msg := '';
                        msg := 'Dear  ' + HREmp.Title + ' ' + HREmp."Last Name" + ',<br /><br />';
                        msg := msg + 'Your transport requisition was declined.<br /><br />';
                        msg := msg + '<b>Reason:</b><i>' + CommentLineText + '</i>';
                        SendEmail(HREmp."Company E-Mail", 'Rejected Application: ' + "Document No" + ' (Transport Number)', msg);
                    end;
                end;
            end;
            // if AppEntry."Table ID" = 70135040 then begin
            //     HRTraining.Reset();
            //     HRTraining.SetRange(c, DocNumber);
            //     if HRTraining.Find('-') then begin
            //         if HREmp.Get(HRTraining."Employee No.") then begin
            //             if HREmp."Company E-Mail" <> '' then begin
            //                 msg := '';
            //                 msg := 'Dear Sir/Madam,<br /><br />';
            //                 msg := msg + 'Your training requisition was declined.<br /><br />';
            //                 msg := msg + '<b>Reason:</b><i>' + CommentLineText + '</i>';
            //                 SendEmail(HREmp."Company E-Mail", 'Rejected Application: ' + "Document No" + ' (Training Number)', msg);
            //             end;
            //         end;
            //     end;
            // end;
        end;
    end;

    procedure DocumentRejectionCommentLine(DocumentNo: Code[20]; CommentLineText: Text; WebUser: Code[20]; DocumentType: Integer; recID: RecordId; "Table ID": Integer; SeqenceNo: Integer)
    var
        NextDocNumber: Integer;
        objApprovalCommentLine: Record "Approval Comment Line";
    begin
        objApprovalCommentLine.Reset;
        objApprovalCommentLine.SetCurrentkey("Entry No.");
        if objApprovalCommentLine.FindLast then
            NextDocNumber := objApprovalCommentLine."Entry No." + 1;

        objApprovalCommentLine.Init;
        objApprovalCommentLine."Entry No." := NextDocNumber;
        objApprovalCommentLine."Table ID" := "Table ID";
        objApprovalCommentLine."Document Type" := DocumentType;
        objApprovalCommentLine."Document No." := DocumentNo;
        objApprovalCommentLine."User ID" := WebUser;
        objApprovalCommentLine.Comment := CommentLineText;
        objApprovalCommentLine."Date and Time" := CurrentDatetime;
        //objApprovalCommentLine."Sequence No" := SeqenceNo;
        objApprovalCommentLine."Record ID to Approve" := recID;
        objApprovalCommentLine.Insert(false);
    end;

    procedure DocumentApprovals(LineNo: Integer; UserID: Code[20]) ret: Boolean
    var
        AppEntry: Record "Approval Entry";
        RecID: RecordID;
        FromRecRef: RecordRef;
        DocNumber: Code[100];
        DocN: Code[100];
        msg: Text;
    begin
        ret := false;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Entry No.", LineNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", UserID);
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Open);
        if ApprovalEntry.Find('-') then begin
            ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);

            AppEntry.Reset();
            AppEntry.SetRange("Record ID to Approve", ApprovalEntry."Record ID to Approve");
            AppEntry.SetRange(Status, AppEntry.Status::Open);
            if AppEntry.Find('-') then begin
                repeat
                    DocNumber := FORMAT(AppEntry."Record ID to Approve");
                    DocNumber := CONVERTSTR(DocNumber, ':', ',');
                    DocNumber := SELECTSTR(2, DocNumber);

                    IF (DocNumber = 'QUOTE') OR (DocNumber = 'ORDER') THEN BEGIN
                        DocN := FORMAT(AppEntry."Record ID to Approve");
                        DocN := CONVERTSTR(DocN, ':', ',');
                        DocN := SELECTSTR(3, DocN);
                        DocNumber := DocN;
                    end;
                ///////send alert/////
                // SendApprovalEmailAlert(DocNumber, AppEntry."Table ID", AppEntry."Approver ID");
                until ApprovalEntry.Next() = 0;
            end;
            ret := true;
        end;
        exit(ret);
    end;

    procedure UpdateDirectApprover(Supervisor: Text)
    var
        UserSet: Record "User Setup";
        UserSet2: Record "User Setup";
    begin
        UserSet.Reset();
        UserSet.SetRange(UserSet."Approval Administrator", true);
        if UserSet.find('-') then begin
            UserSet."Approver ID" := Supervisor;
            UserSet.modify();
            HRSetup.Get();
            if UserSet2.get(Supervisor) then
                if HREmp.Get(UserSet2."Employee No.") then
                    if HREmp."Phone No." <> '' then
                        SMS.SendSMS('254' + DelChr(HREmp."Phone No.", '<', '0'),
                        'A document has been sent to you for approval, kindly log in to Jumuika to approve ' + HRSetup."ESS Portal Link"
                        );
        end;

    end;

    procedure UpdateLeaveApprover(Supervisor: Text; LeaveNo: Text)
    var
        UserSet: Record "User Setup";
        UserSet2: Record "User Setup";
        NewSupervisor: Text;
        UserSet3: Record "User Setup";
        UserSet4: Record "User Setup";
        HREmp2: Record Employee;
    begin
        LeaveT.Reset();
        LeaveT.SetRange("Application Code", LeaveNo);
        if LeaveT.Find('-') then begin
            if UserSet2.get(Supervisor) then
                if HREmp2.Get(UserSet2."Employee No.") then
                    //Check if Supervisor is on leave
            leaveApplications.Reset();
            leaveApplications.Setrange("Employee No", HREmp2."No.");
            leaveApplications.SetFilter("Application Date", '%1..%2', LeaveT."Start Date", LeaveT."End Date");
            //leaveApplications.SetFilter("End Date", '%1..%2', LeaveT."Start Date", LeaveT."End Date");
            leaveApplications.Setrange(Status, leaveApplications.Status::Released);
            if leaveApplications.find('-') then begin
                UserSet3.Reset();
                UserSet3.setrange("Employee No.", leaveApplications.Reliever);
                if UserSet3.find('-') then begin
                    NewSupervisor := UserSet3."User ID";
                end;
            end
            else
                NewSupervisor := Supervisor;
            UserSet.Reset();
            UserSet.SetRange(UserSet."Approval Administrator", true);
            if UserSet.find('-') then begin
                UserSet."Approver ID" := NewSupervisor;
                UserSet.modify();
                if UserSet4.get(NewSupervisor) then
                    if HREmp.Get(UserSet4."Employee No.") then
                        if HREmp."Phone No." <> '' then
                            SMS.SendSMS('254' + DelChr(HREmp."Phone No.", '<', '0'),
                            'A document has been sent for you for approval, kindly log in to Jumuika to approve '
                            );
            end;
        end;
    end;

    // procedure PasswordChanged(EmpNo: Text; Changed: Boolean)
    // begin
    //     HREmp.Reset();
    //     HREmp.SetRange(HREmp."No.", EmpNo);
    //     if HREmp.find('-') then begin
    //         HREmp."Changed Password" := Changed;
    //         HREmp.Modify();
    //     end;
    // end;

    // procedure CheckPasswordChanged(EmpNo: Text) Changed: Boolean
    // begin
    //     HREmp.Reset();
    //     HREmp.SetRange(HREmp."No.", EmpNo);
    //     if HREmp.find('-') then begin
    //         Changed := HREmp."Changed Password";

    //     end;
    // end;

    procedure createLoansApplication(ApplicationDate: date; empNo: Text; LoanProductType: Code[20]; AmountRequested: Decimal; Reason: Text[250]; RepaymentPeriod: Integer) ret: Text;
    begin
        loansApplication.Init();
        //loansApplication."Loan No" := docNo;
        loansApplication."Loan Product Type" := LoanProductType;
        loansApplication.Validate("Loan Product Type");
        loansApplication."Application Date" := ApplicationDate;
        loansApplication.Validate("Employee No", empno);
        //loansApplication."Loan Category" := LoanCategory;
        loansApplication.Instalment := RepaymentPeriod;
        loansApplication."Amount Requested" := AmountRequested;
        loansApplication.Validate("Amount Requested");
        // loansApplication."Loan Status" := loansApplication."Loan Status"::Application;
        loansApplication."Loan Status" := loansApplication."Loan Status"::"Being Processed";
        loansApplication.Reason := Reason;
        loansApplication.insert();
        ret := 'Success';
        Exit(loansApplication."Loan No");
    end;

    //Dependants Change
    procedure createDependantsChange(ApplicationDate: date; empNo: Text; RequestorID: Code[20]; CardNo: code[20]; DependantNo: Code[20]; strDescription: Text[100]; Doctype: Option) ret: Text
    begin
        DependantsChange.Init();
        //DependantsChange."Document No" := docNo;
        DependantsChange."Document Type" := Doctype;
        DependantsChange."Employee No" := empno;
        DependantsChange.VALIDATE("Employee No");
        DependantsChange."Card No" := CardNo;
        DependantsChange."Dependant No" := DependantNo;
        DependantsChange."Requestor ID" := RequestorID;
        DependantsChange."Document Date" := ApplicationDate;
        DependantsChange.Description := strDescription;

        DependantsChange.insert(true);
        ret := 'Success';
        Exit(ret);
    end;

    procedure createWelfareIncidence(IncidenceNo: Code[20]; IncidenceDate: date; IncidenceTime: time; incidenceStatus: option; IncidenceType: option; AffectedEmployee: Text; RequestorID: Code[20]; CardNo: code[20]; DependantNo: Code[20]; IncidenceDesc: Text[100]; Doctype: Option) ret: Text
    begin
        HRWelfareIncidence.Init();
        HRWelfareIncidence."Incidence No" := IncidenceNo;
        HRWelfareIncidence."Incidence Status" := incidenceStatus;

        HRWelfareIncidence."Incidence Type" := IncidenceType;
        HRWelfareIncidence.Incidence := IncidenceDesc;
        HRWelfareIncidence."Incidence Date" := IncidenceDate;
        HRWelfareIncidence."Incidence Time" := IncidenceTime;
        HRWelfareIncidence."Affected Employee" := AffectedEmployee;
        HRWelfareIncidence.VALIDATE("Affected Employee");
        HRWelfareIncidence.insert();
        ret := 'Success';
        EXIT(ret);
    end;

    // procedure createWelfareIncident(employeeNo: Code[20]; incidence: Code[20]; IncidenceDate: date;
    //     IncidenceTime: time; actionTaken: Text[1000]; dutyStation: Code[20]): Code[20]

    // var
    //     Employee: Record Employee;
    //     WelfareIncidence: Record "HR Welfare Incidence";
    // begin
    //     Hrsetup.reset();
    //     HrSetup.get();
    //     HrSetup.TestField(HrSetup."Incidences Nos");
    //     WelfareIncidence.init();
    //     welfareIncidence."Incidence No" := NoSeriesMgt.GetNextNo(HRSetup."Incidences Nos", 0D, true);
    //     // WelfareIncidence."Affected Employee" := employeeNo;
    //     WelfareIncidence.validate("Affected Employee", employeeNo);
    //     WelfareIncidence."Incidence Date" := IncidenceDate;
    //     WelfareIncidence."Incidence Time" := IncidenceTime;
    //     welfareIncidence."Action Taken" := actionTaken;
    //     WelfareIncidence."Incidence Status" := WelfareIncidence."Incidence Status"::open;
    //     WelfareIncidence."Duty Station" := dutyStation;
    //     WelfareIncidence.incidence := incidence;

    //     if WelfareIncidence.insert() then
    //         exit(WelfareIncidence."Incidence No")
    //     else
    //         exit('failed');

    // end;
















    // procedure createFeedbackForm("Employee No": Code[20]; Description: Text; Type: Option): Code[20]
    // var
    //     Employee: Record Employee;
    //     Feedback: Record Feedback;

    // begin
    //     HRSetup.Get;
    //     HRSetup.TestField("Feedback Nos");
    //     Feedback.init();
    //     Feedback."No." := NoSeriesMgt.GetNextNo(HRSetup."Feedback Nos", 0D, true);
    //     Feedback.Validate("Employee No", "Employee No");
    //     Feedback.Description := Description;
    //     Feedback.Type := Type;
    //     if Feedback.Insert() then
    //         EXIT(feedback."No.")

    //     else
    //         EXIT('Insert failed');

    // end;

    procedure createVehicleIncidence(IncidentDate: Date; VehicleId: Code[20]; DriverId: Code[20];
        IncidentTime: Time; ResponsibleEmployee: Code[20];
        PersonCulpable: Text[100];
        WorkTicketNo: Code[20]; DutyStation: Code[20]): Text

    var
        VehicleIncident: Record "Vehicle Incident";
    begin

        FltMgtSetup.Get();
        FltMgtSetup.TestField(FltMgtSetup."Vehicle Incident Nos.");
        VehicleIncident.init();
        VehicleIncident."Incident No." := NoSeriesMgt.GetNextNo(FltMgtSetup."Vehicle Incident Nos.", 0D, true);
        VehicleIncident.Validate("Incident No.");
        VehicleIncident."Incident Time" := IncidentTime;
        VehicleIncident."Incident Date" := IncidentDate;
        VehicleIncident.Validate("Driver ID", DriverId);
        VehicleIncident.Validate("Vehicle ID", VehicleId);
        VehicleIncident."Person Culpable" := PersonCulpable;
        VehicleIncident.Validate("Responsible Employee", ResponsibleEmployee);
        VehicleIncident.Validate("Work Ticket No", WorkTicketNo);
        VehicleIncident.Validate("Duty Station", DutyStation);
        if VehicleIncident.Insert() then
            Exit('Success')
        else
            Exit('Failed');

    end;

    // procedure CreateMedicalCard(employeeNo: Code[20]; cardNo: Code[20]; date: Date; Description: Text[250]; DependantName: Text[200]): Code[20]
    // var
    //     Dependants: Record "Dependants Change";
    // begin
    //     HRSetup.Get();
    //     HRSetup.TestField(HRSetup."PR Benefit Nos");
    //     Dependants.Init();
    //     Dependants."Document No" := NoSeriesMgt.GetNextNo(HRSetup."PR Benefit Nos", 0D, true);
    //     Dependants.Validate("Employee No", employeeNo);
    //     Dependants."Card No" := cardNo;
    //     Dependants.Description := Description;
    //     Dependants."Document Date" := date;
    //     Dependants."Dependant Name" := DependantName;
    //     if Dependants.insert then
    //         Exit(Dependants."Document No")
    //     else
    //         Exit('Failed');

    // end;

    // procedure CreateChangeDependantsLines(DocNo: Code[50]; EmployeeNo: Code[20]; DOB: Date; Relationship: Code[20];
    //  Surname: Text[50]; OtherNames: Text[100]; IDNo: Text[250]): Text[20];
    // var
    //     DependantsHeader: Record "Dependants Header";

    // begin

    //     DependantsHeader.Reset();
    //     DependantsHeader.init();
    //     DependantsHeader."Document No" := DocNo;
    //     DependantsHeader."Employee Code" := EmployeeNo;
    //     DependantsHeader."Other Names" := OtherNames;
    //     DependantsHeader."Date Of Birth" := DOB;
    //     DependantsHeader.Relationship := Relationship;
    //     DependantsHeader."ID No/Passport No" := IDNo;
    //     if DependantsHeader.Insert() then
    //         Exit('Success')
    //     else
    //         Exit('Failed');
    // end;


    Procedure CreatePayChangeAdvice(EmpNo: code[30]; createdBy: code[50]; PayrollPeriod: date; EffectiveDate: date; SubjectVar: Text; SourceDoc: Enum "PayChange Source Document";
        ReferenceDetails: Code[50]; DescriptionVar: text): Code[20]
    var
        PayChangeAdvice: record "prBasic pay PCA";
        NextDocNo: code[20];
    begin
        HRSetup.Get();
        HRSetup.TestField(HRSetup."Pay-change No.");
        PayChangeAdvice.init;
        //NextDocNo := NoSeriesMgt.GetNextNo(HRSetup."Pay-change No.", 0D, true);
        PayChangeAdvice."Change Advice Serial No." := NextDocNo;
        paychangeAdvice."Payroll Period" := PayrollPeriod;
        PayChangeAdvice.validate("Employee Code", EmpNo);
        paychangeadvice.validate("Effective Date", EffectiveDate);
        paychangeadvice.Validate("Source Document", SourceDoc);
        PaychangeAdvice.Validate(description, DescriptionVar);
        PaychangeAdvice."User ID" := createdBy;
        if paychangeAdvice.insert(true) then

            //if paychangeAdvice.insert() then
            exit(PayChangeAdvice."Change Advice Serial No.")
        // exit(NextDocNo)

        else
            Exit('');
    end;


    procedure sendPayChangeAdviceForApproval(ChangeNo: Code[50]) status: Text
    var
        PayChangeAdvice: Record "prbasic pay PCA";
    begin
        status := 'danger*The pay change advice could not be sent for approval';
        PayChangeAdvice.Reset;
        PayChangeAdvice.SetRange("Change Advice Serial No.", ChangeNo);
        PayChangeAdvice.SetRange(Status, TransportRequisition.Status::Open);
        if PayChangeAdvice.FindSet then begin

            leaveApp := PayChangeAdvice;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            IF PayChangeAdvice.GET(PayChangeAdvice."Change Advice Serial No.") THEN BEGIN
                IF PayChangeAdvice.Status = PayChangeAdvice.Status::Open THEN BEGIN
                    status := 'warning';
                END ELSE BEGIN
                    status := 'Success';
                END;
            end else begin
                status := '';
            end;

        end else begin
            status := 'danger*A pay change advice with the given number does not exist, is no longer open or you are not the owner';
        end;
        exit(status);
    end;

    procedure CreatePaychangeAdviceLines(EmployeeNo: code[20]; ChangeNo: code[20]; Payrollperiod: date; TransactionCode: code[50];
     ChangeType: option ,Increment,Addition,Reduction,Stoppage; FromDate: date; ToDate: Date;
    PaidAmount: decimal; CommentsVar: text[250]): Text
    var
        PayChangeLines: record "prEmployee Trans PCA";
    begin
        Paychangelines.init;
        paychangelines."Change Advice Serial No." := ChangeNo;
        PayChangeLines."Employee Code" := EmployeeNo;
        PayChangeLines.Validate("Transaction Code", TransactionCode);
        PayChangeLines.validate("Payroll Period", Payrollperiod);
        PayChangeLines.Validate("Document Type", PayChangeLines."Document Type"::PCA);
        PayChangeLines.Comments := CommentsVar;
        PayChangeLines."Change Type" := ChangeType;
        PayChangeLines."From Date" := FromDate;
        payChangeLines."To Date" := ToDate;
        PayChangeLines.Amount := PaidAmount;
        if PayChangeLines.insert then
            exit('Success*Record inserted successsfully')
        else
            exit('Danger*Record could not be inserted');
    end;

    procedure SendLoanAppForApproval(LoanNo: Code[50]) status: Text
    var
        LaonApplication: Record "Loan Application";
    begin
        status := 'danger*The Loan Application could not be sent for approval';
        LaonApplication.Reset;
        LaonApplication.SetRange("Loan No", LoanNo);
        LaonApplication.SetRange(Status, TransportRequisition.Status::Open);
        if LaonApplication.FindSet then begin

            loanApp := LaonApplication;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(loanApp) THEN
                CustomApprovals.OnSendDocForApproval(loanApp);
            IF LaonApplication.GET(LaonApplication."Loan No") THEN BEGIN
                IF LaonApplication.Status = LaonApplication.Status::Open THEN BEGIN
                    status := 'warning';
                END ELSE BEGIN
                    status := 'Success';
                END;
            end else begin
                status := '';
            end;

        end else begin
            status := 'danger*A Loan Applicaiton with the given number does not exist, is no longer open or you are not the owner';
        end;
        exit(status);
    end;



    procedure createEmployeeExitVoucher(EmpNo: Code[30]; Reasons: Code[30]; Description: Text[50];
     LastWorkDate: Date; NoticeDate: Date; EmpExitDate: Date): Code[30];
    var
        EmployeeExitheader: Record "Employee Exit header";
    begin
        HRSetup.Get();
        HRSetup.TestField(HRSetup."Exit voucher Nos");
        EmployeeExitHeader.reset();
        EmployeeExitheader.Init();
        // EmployeeExitHeader."Document No." := NoSeriesMgt.GetNextNo(HRSetup."Exit voucher Nos", 0D, true);
        EmployeeExitHeader."Document No." := '';
        EmployeeExitheader."Document Type" := EmployeeExitheader."Document Type"::"Exit Voucher";
        EmployeeExitHeader.validate("Employee No", EmpNo);
        EmployeeExitheader."Reasons Code" := Reasons;
        EmployeeExitHeader.Description := Description;
        EmployeeExitHeader."Last working Date" := LastWorkDate;
        EmployeeExitHeader."Notice Date" := NoticeDate;
        EmployeeExitHeader."Employee Exit Date" := EmpExitDate;
        if EmployeeExitHeader.insert(true) then begin
            exit(EmployeeExitHeader."Document No.")
        end
        else
            exit('failed');
    end;

    Procedure CreateRecruitmentRequisition(PlanType: Option "Annual HR Plan","Special Recruitment","Project Recruitment";

        PlanCode: code[20]; Position: code[20];

        Noofpositions: integer; CycleType: Option Standard,Expedited; LeadTime: DateFormula; StartDate: Date;

        EndDate: Date; FinYear: Code[20]; FundingSource: Code[50]; BudgetCost: decimal;

        CostHire: decimal; BudgetLineNo: Code[20]): code[20]

    var

        RecHeader: Record "Recruitment Requisition Header";

        NextNo: Code[20];

    begin

        RecHeader.Init;

        HRSetup.Get();

        HRSetup.TestField(HRSetup."Exit voucher Nos");

        NextNo := NoSeriesMgt.GetNextNo(HRSetup."Exit voucher Nos", 0D, true);

        RecHeader."Document No." := NextNo;

        RecHeader.Validate("Recruitment Plan Type", PlanType);

        RecHeader.validate("Recruitment Plan ID", PlanCode);

        RecHeader.Validate("Position ID", Position);

        RecHeader.Validate("Recruitment Cycle Type", CycleType);

        RecHeader.Validate("Recruitment Lead Time", LeadTime);

        RecHeader.Validate("Planned Recruitment Start Date", StartDate);

        RecHeader.Validate("Planned Recruitment End Date", EndDate);

        RecHeader.Validate("Finacial Year Code", FinYear);

        RecHeader.Validate("Recruitment Line Budget Cost", BudgetCost);

        RecHeader.Validate("Average Cost/Hire", CostHire);

        RecHeader.Validate("Job Task No.", BudgetLineNo);

        RecHeader.Validate("No of Openings", Noofpositions);

        IF RecHeader.Insert then
            exit(NextNo)

        else
            exit('');

    end;
    //  Procedure ReturnBase64FromReport(ReportPath : Text) PDFFile : Text
    // filename:=FILESPATH_S+ ReportPath;
    // CLEAR(Image6txt2);
    //  IF FilenameDT.OPEN(filename) THEN BEGIN
    //     FilenameDT.CREATEINSTREAM(imageinstream);
    //     MemoryStream:=MemoryStream.MemoryStream();
    //     COPYSTREAM(MemoryStream,imageinstream);
    //     Bytes:=MemoryStream.GetBuffer();
    //     Image6txt2.ADDTEXT(Convert.ToBase64String(Bytes));
    //     FilenameDT.CLOSE;
    //     Image6txt2.GETSUBTEXT(imagetext7,1); //ERROR('Good...%1',Image6txt2);
    //     PDFFile:=imagetext7;
    //  END;
    //  EXIT(PDFFile);

    procedure createstandardpurchasereq(PRNType: Option " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return",Tyre;
    LocationCode: Code[20]; ProdReqGroup: Option Goods,Services,Works,Assets;
    GeographicalCode: code[50];
    AdminUnitCode: code[50]; PlanningCategory: code[50]; userId: Code[50]; requestByNo: Code[10]): Code[20]
    var
        PurchHeader: record "Purchase Header";
        PurchSetup: record "Purchases & Payables Setup";
        ProcSetup: record "Procurement Setup";
    begin
        ProcSetup.get();
        PurchHeader.init;
        purchHeader."No." := NoSeriesMgt.GetNextNo(ProcSetup."Purchase Req No", 0D, true);
        purchHeader."Document Type" := purchHeader."Document Type"::"Purchase Requisition";
        // purchHeader.validate("Document Type");
        purchHeader.validate("Requisition Type", PRNType);
        PurchHeader.Validate("Location Code", LocationCode);
        PurchHeader.Validate("Requisition Product Group", ProdReqGroup);
        PurchHeader.Validate("Shortcut Dimension 1 Code", GeographicalCode);
        PurchHeader.validate("Shortcut Dimension 2 Code", AdminUnitCode);
        PurchHeader."Requester ID" := userId;
        PurchHeader.Validate("Request-By No.", requestByNo);


        // PurchHeader.Validate("Priority Level", PriorityLevel);
        // PurchHeader.Validate(Description, DescriptionVar);
        if PurchHeader.Insert then exit(PurchHeader."No.") else exit('Failed');
    end;

    Procedure CreateNewResourceRequirement(StrategyPlanId: Code[20]; YearReportingCode: code[20];
       FromDate: Date; ToDate: Date; GeographicalCode: code[50];
       AdminUnit: Code[50]; ConsolidationTemplate: code[50]; ProPlantemplate: Code[50]; EmpUserId: Text) DocNo: code[20]
    var
        AnnualStrategyWork: Record "Annual Strategy Workplan";
        SPMSetup: Record "SPM General Setup";
    begin

        AnnualStrategyWork.Init();
        SPMSetup.Get;
        SPMSetup.TestField("Functional Annual Workplan Nos");
        AnnualStrategyWork.No := NoSeriesMgt.GetNextNo(SPMSetup."Functional Annual Workplan Nos", 0D, true);
        AnnualStrategyWork."Strategy Plan ID" := StrategyPlanId;
        AnnualStrategyWork.Validate("Year Reporting Code", YearReportingCode);
        AnnualStrategyWork.Validate("Start Date", FromDate);
        AnnualStrategyWork.Validate("End Date", ToDate);
        AnnualStrategyWork."Annual Strategy Type" := AnnualStrategyWork."annual strategy type"::Functional;
        AnnualStrategyWork."Planning Budget Type" := AnnualStrategyWork."Planning Budget Type"::Original;
        AnnualStrategyWork.Validate("Global Dimension 1 Code", GeographicalCode);
        AnnualStrategyWork.Validate("Global Dimension 2 Code", AdminUnit);
        AnnualStrategyWork.Validate("Annual Workplan", ConsolidationTemplate);
        AnnualStrategyWork."Created By" := EmpUserId;
        AnnualStrategyWork."Created at" := Today;
        AnnualStrategyWork.Insert();
        DocNo := AnnualStrategyWork.No;
        exit(DocNo);
    end;

    procedure CreateStrategyWorkPlanLines(documentNo: Code[50]; StrategyNo: code[30]; KraId: Code[20]; CoreStrategyId: Code[20];
    StrategyID: Code[20]; ActivityId: Code[50]): Code[20]

    var
        StrategyWorkplanLines: Record "Strategy Workplan Lines";


    begin
        StrategyWorkplanLines.reset;
        if StrategyWorkplanLines.FindLast() then begin
            StrategyWorkplanLines.Init();
            StrategyWorkplanLines.No := documentNo;
            StrategyWorkplanLines."Strategy Plan ID" := StrategyNo;
            StrategyWorkplanLines."KRA ID" := KraId;
            StrategyWorkplanLines."Year Reporting Code" := StrategyNo;
            StrategyWorkplanLines."Core Strategy ID" := CoreStrategyId;
            StrategyWorkplanLines."Resource Req. No" := documentNo;
            StrategyWorkplanLines."Strategy ID" := StrategyID;
            StrategyWorkplanLines.validate("Activity ID", ActivityId);
            If StrategyWorkplanLines.Insert(true) then
                exit('Success')
            else
                exit('Failed');
        end;

    end;

    // procedure GetReciptssDocDimensions(DocuN: code[30])
    // var
    //     myInt: Integer;
    //     Receipts: Record "Receipts Header1";
    // begin
    //     Receipts.reset;
    //     Receipts.SetRange(Receipts."No.", DocuN);
    //     if Receipts.FindFirst() then begin
    //         Receipts.ShowEditDimension(true);
    //     end;

    // end;

    // procedure GetPaymentsDocDimensions(DocuN: code[30])
    // var
    //     myInt: Integer;
    //     Payments: Record Payments;
    // begin
    //     payments.reset;
    //     Payments.SetRange("No.", DocuN);
    //     if Payments.FindFirst() then begin
    //         Payments.ShowEditDimension(Payments.Status = Payments.Status::Open);
    //         Payments.UpdateLineDimensions(Payments."Dimension Set ID");
    //     end;

    // end;

    procedure UpdateLeaveRejection(DocNo: Text; RejectionComments: Text)
    begin
        leaveApplications.reset();
        leaveApplications.Setrange(leaveApplications."Application Code", DocNo);
        if leaveApplications.find('-') then begin
            leaveApplications.status := leaveApplications.Status::Rejected;
            leaveApplications."Approver Comments" := RejectionComments;
            leaveApplications.modify();
        end;
    end;

    procedure GetPreviousPay(EmpNo: Text) Pays: array[2] of Decimal
    begin
        PrPeriodTrans.Reset();
        PrPeriodTrans.SetRange(PrPeriodTrans."Employee Code", EmpNo);
        PrPeriodTrans.SetRange(PrPeriodTrans."Transaction Code", 'NPAY');
        if PrPeriodTrans.findlast then
            Pays[1] := PrPeriodTrans.Amount;
        PrPeriodTrans.Reset();
        PrPeriodTrans.SetRange(PrPeriodTrans."Employee Code", EmpNo);
        PrPeriodTrans.SetRange(PrPeriodTrans."Transaction Code", 'BPAY');
        if PrPeriodTrans.findlast then
            Pays[2] := PrPeriodTrans.Amount;
    end;

    procedure InsertReservationHeader(RequestorID: Text; EmployeeNo: Text; Description: Text; Type2: Option; ImplementingUnit: Text; DutyStation: Text) DocNo: Text
    var
        ReservH: Record "Resource Booking Header";
    begin
        ResourceBookingSetup.Get;
        ResourceBookingSetup.TestField(ResourceBookingSetup."Reservation Nos");
        DocNo := NoSeriesMgt.GetNextNo(ResourceBookingSetup."Reservation Nos", 0D, true);
        ReservH.Init;
        ReservH.No := DocNo;
        ReservH."Requestor ID" := RequestorID;
        ReservH.Validate("Employee No", EmployeeNo);
        ReservH.Description := Description;
        ReservH."Document Date" := Today;
        ReservH."Time Created" := Time;
        ReservH.Type := Type2;
        ReservH.Validate("Implementing Unit Code", ImplementingUnit);
        ReservH."Duty Station" := DutyStation;
        ReservH.Insert();

    end;

    procedure InsertReservationLines(DocNo: Text; Propertys: Text; StartDate: DateTime; StartTime: Time; FloorCode: Text; Room: Text; Reason: Text; RoomType: Option)
    begin
        ReservLine.Init;
        ReservLine.Validate(No, DocNo);
        ReservLine.Validate("Property Code", Propertys);
        ReservLine."Floor Code" := FloorCode;
        ReservLine."Room Code" := Room;
        ReservLine."Start Date/Time" := StartDate;
        ReservLine."Room Type" := RoomType;
        ReservLine.Reason := Reason;
        ReservLine."Start Time" := StartTime;
        ReservLine.Insert();
        // 
        // ReservLine
        // ReservLine
        // ReservLine
        // ReservLine
        // ReservLine

    end;

    procedure AssignTransportRequisitionDriver(DocNo: Code[20]; Driver: Code[20]; Vehicle: Code[20]; Allocatedby: Code[20])
    var
        msg: Text;
    begin
        TransportRequisition.RESET;
        TransportRequisition.SETRANGE("Transport Requisition No", DocNo);
        IF TransportRequisition.FIND('-') THEN BEGIN
            TransportRequisition."Driver Allocated" := Driver;
            TransportRequisition.Validate("Driver Allocated");
            TransportRequisition."Vehicle Allocated" := Vehicle;
            TransportRequisition.Validate("Driver Allocated");
            TransportRequisition."Vehicle Allocated by" := Allocatedby;
            TransportRequisition.Modify;

            if HREmp.Get(Driver) then begin
                if HREmp."Company E-Mail" <> '' then begin
                    msg := '';
                    msg := 'Dear ' + HREmp.Title + ' ' + HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name" + ',<br /><br />';
                    msg := msg + 'A transport request ' + DocNo + ' has been assigned to you.<br /><br />';
                    msg := msg + '<b>Date of Travel:</b><i>' + Format(TransportRequisition."Date of Trip") + '</i>';
                    msg := msg + '<b>Journey From:</b><i>' + TransportRequisition.Commencement + '</i>';
                    msg := msg + '<b>Destination:</b><i>' + TransportRequisition.Destination + '</i>';
                    msg := msg + '<b>Purpose:</b><i>' + TransportRequisition."Purpose of Trip" + '</i>';
                    msg := msg + '<b>Vehicle Assigned:</b><i>' + Vehicle + '</i>';
                    SendEmail(HREmp."Company E-Mail", 'ASSIGNMENT OF TRANSPORT REQUEST: ' + DocNo + ' (Request Number)', msg);
                end;
            end;
        end;
    end;

    procedure InsertHandoverNotes(LeaveNo: Text; HandoverType: Option; Activity: Text; Status: Text; Reason: Text)
    begin
        HandOver.Init;
        HandOver.Validate("Leave No.", LeaveNo);
        HandOver."Type" := HandoverType;
        HandOver.Activity := Activity;
        HandOver.Status := Status;
        HandOver.Reason := Reason;
        HandOver.Insert();
    end;

    procedure ModifyBidEvaluationsLInes(DocNo: Code[30]; LineNum: Integer; EvaFindings: Code[80]; Evalremarks: Text)
    var
        myInt: Integer;
        BIDLines: Record "Bid Evaluation Score Entry";
    begin
        BIDLines.Reset();
        BIDLines.SetRange("Line No", LineNum);
        BIDLines.SetRange("Bid No.", DocNo);
        if BIDLines.FindFirst() then begin
            BIDLines."Response Value" := EvaFindings;
            BIDLines.Validate(BIDLines."Response Value");
            BIDLines."Evaluation Requirement" := Evalremarks;
            BIDLines.Modify();
        end;

    end;

    procedure CancellRFQApproval(DocuNum: Code[40])
    var
        myInt: Integer;
        VarVariant: Variant;
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        StandardRFq: Record "Standard Purchase Code";
    begin
        StandardRFq.Reset();
        StandardRFq.SetRange(Code, DocuNum);
        if StandardRFq.FindFirst() then begin
            VarVariant := StandardRFq;
            ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant)
        end;

    end;

    procedure SendRFQforApproval(DocNum: code[30])
    var
        myInt: Integer;
        VarVariant: Variant;
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        StandardRFq: Record "Standard Purchase Code";
    begin
        StandardRFq.Reset();
        StandardRFq.SetRange(Code, DocNum);
        if StandardRFq.FindFirst() then begin
            VarVariant := StandardRFq;
            if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                ApprovalsMgmt.OnSendDocForApproval(VarVariant);
        end;

    end;

    procedure SendReservationHeader(DocNo: Text)
    begin
        ReservH.Reset();
        ReservH.Setrange(No, DocNo);
        If ReservH.Find('-') then begin
            VarVariant := ReservH;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                CustomApprovals.OnSendDocForApproval(VarVariant);
        end

    end;

    procedure UpdateLoanComments(LoanNo: Text; HRComments: Text; DirectorsComments: Text)
    var
        loansApplication: Record "Loan Application";
    begin
        loansApplication.reset();
        loansApplication.Setrange(loansApplication."Loan No", LoanNo);
        if loansApplication.find('-') then begin
            loansApplication."Approved Amount" := loansApplication."Amount Requested";
            //loansApplication.Validate("Approved Amount");
            loansApplication."Salaries Comments" := HRComments;
            loansApplication."Director Comments" := DirectorsComments;
            loansApplication.Modify();

        end;
    end;

    procedure ChangeLeaveReliever(DocNo: Text; RelieverNo: Text)
    begin
        leaveApplications.Reset();
        leaveApplications.SetRange("Application Code", DocNo);
        if leaveApplications.Find('-') then begin
            leaveApplications.Validate(Reliever, RelieverNo);
            leaveApplications.Modify();
        end;
    end;

    procedure InsertcarLoansApplication(ApplicationDate: date; empNo: Text; LoanProductType: Code[20]; AmountRequested: Decimal; Reason: Text[250]; RepaymentPeriod: Integer; ManufactureYear: Integer) ret: Text;
    begin
        loansApplication.Init();
        //loansApplication."Loan No" := docNo;
        loansApplication."Loan Product Type" := LoanProductType;
        loansApplication.Validate("Loan Product Type");
        loansApplication."Application Date" := ApplicationDate;
        loansApplication.Validate("Employee No", empno);
        //loansApplication."Loan Category" := LoanCategory;
        loansApplication.Instalment := RepaymentPeriod;
        loansApplication."Amount Requested" := AmountRequested;
        loansApplication.Validate("Amount Requested");
        loansApplication."Loan Status" := loansApplication."Loan Status"::Application;
        //loansApplication."Loan Status" := loansApplication."Loan Status"::"Being Processed";
        loansApplication.Reason := Reason;
        loansApplication."Year of Manufacture" := ManufactureYear;
        loansApplication.insert();
        ret := 'Success';
        Exit(loansApplication."Loan No");
    end;


    procedure createPurchaseReq(employeeNo: Code[50]; requisitionNo: Code[50]; location: Code[50]; description: Text; priorityLevel: Option ,Low,Normal,High,Critical; requisitionProductGroup: Option Goods,Services,Works,Assets; constituency: Text[100]; planId: Text[100]; PlanEntryNo: Integer; TemplateId: Text[50]; tfundingsource: Code[100]; tconstituency: Code[100]) status: Text
    var
        myType: Text;
        userSetup: Record "User Setup";
        RequestorId: code[50];
        procSetup: Record "Procurement Setup";
    begin
        userSetup.reset();
        userSetup.setRange("Employee No.", employeeNo);
        procSetup.get();
        if userSetup.FindFirst() then
            RequestorId := userSetup."USER ID";


        case priorityLevel of
            0:
                priorityLevel := PurchaseHeader."priority level"::Low;
            1:
                priorityLevel := PurchaseHeader."priority level"::Normal;
            2:
                priorityLevel := PurchaseHeader."priority level"::High;
            3:
                priorityLevel := PurchaseHeader."priority level"::Critical;
            else
        end;

        case requisitionProductGroup of
            0:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Goods;
            1:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Services;
            2:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Works;
            3:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Assets;
            else
        end;


        myType := 'Purchase Requisition';
        if requisitionNo = '' then begin //new  requisition
            PurchaseHeader.Init;
            status := NoSeriesMgt.GetNextNo(procSetup."Purchase Req No", 0D, true);
            PurchaseHeader."No." := status;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
            PurchaseHeader.Validate("Document Type");
            PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::Project;
            PurchaseHeader.Validate("Requisition Type");
            PurchaseHeader."Requester ID" := RequestorId;
            PurchaseHeader."Request-By No." := employeeNo;
            PurchaseHeader.Validate("Request-By No.");
            PurchaseHeader."Location Code" := location;
            //PurchaseHeader.VALIDATE("Location Code");
            PurchaseHeader.Description := description;
            PurchaseHeader.Validate(Description);
            PurchaseHeader."Order Date" := Today;
            PurchaseHeader."Responsibility Center" := location;
            PurchaseHeader."Priority Level" := priorityLevel;
            PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
            PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::Standard;
            PurchaseHeader."Procurement Plan ID" := planId;
            PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;
            PurchaseHeader."Requisition Template ID" := TemplateId;
            PurchaseHeader."Shortcut Dimension 2 Code" := tfundingsource;
            PurchaseHeader."Shortcut Dimension 3 Code" := tconstituency;
            if PurchaseHeader.Insert(false) then begin

                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader.Validate("Procurement Plan Entry No");
                PurchaseHeader.Modify(false);
            end else begin
                status := 'danger*Your ' + myType + ' could not be captured';
            end;

        end else begin //existing
            PurchaseHeader.Reset;
            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            PurchaseHeader.SetRange("No.", requisitionNo);
            if PurchaseHeader.FindSet then begin
                PurchaseHeader."Responsibility Center" := location;
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate(Description, description);
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader."Priority Level" := priorityLevel;
                PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
                PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::Standard;
                PurchaseHeader."Procurement Plan ID" := planId;
                PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;
                PurchaseHeader."Requisition Template ID" := TemplateId;
                if PurchaseHeader.Modify(false) then begin
                    PurchaseHeader.Validate("Procurement Plan Entry No");
                    status := 'success*Your ' + myType + ' was successfully updated';
                end else begin
                    status := 'danger*Your ' + myType + ' could not be updated';
                end;

            end else begin
                status := 'danger*A ' + myType + ' with the given number does not exist, you are not the owner or is no longer open' + requisitionNo;
            end;

        end;
        exit(status);
    end;



    procedure createPurchaseReqLine(documentNo: Code[250]; procurementPlanId: Code[250]; quantity: Decimal; procurementItemNo: Integer) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", documentNo);
        if PurchaseHeader.FindSet then begin

            //add line
            PurchaseLine.Init;
            PurchaseLine."Document Type" := PurchaseLine."document type"::"Purchase Requisition";
            PurchaseLine."Document No." := documentNo;
            PurchaseLine.Validate("Document No.");
            PurchaseLine."Procurement Plan ID" := procurementPlanId;
            PurchaseLine."Procurement Plan Entry No" := procurementItemNo;
            PurchaseLine.Validate("Procurement Plan Entry No");
            PurchaseLine.Quantity := quantity;
            PurchaseLine.Validate("Quantity");
            if PurchaseLine.insert(false) then
                status := 'Success*Your Requisition Line has been added'

            else
                status := 'danger*Your Requisition Line could not be added';

        end;
        exit(status);
    end;

    procedure GetLoansEntitlementPerGrade(LoanCategory: Option; EmpNo: Text) Entitlements: Decimal
    begin
        If HREmp.Get(EmpNo) Then
            LoanEntitlement.Reset();
        LoanEntitlement.SetRange(LoanEntitlement."Loan Category", LoanCategory);
        LoanEntitlement.SetRange(LoanEntitlement."Job Grade", HREmp."Salary Scale");
        if LoanEntitlement.find('-') then begin
            Entitlements := LoanEntitlement."Amount Entitled";
        end

    end;

    procedure GetYearsToRetirement(EmpNo: Text) Years: Integer
    var
        EmpPost: Record "PR Employee Posting Groups";
        Rage: Date;
    begin
        If HREmp.Get(EmpNo) Then
            HumanResourcesSetup.GET;
        EmpPost.Reset();
        EmpPost.SetRange(EmpPost.Code, HREmp."Posting Group");
        if EmpPost.Find('-') then begin
            EmpPost.TestField("Retirement Age");
            if HREmp."Date Of Birth" > 0D then begin
                if HREmp.Disabled then begin
                    EmpPost.TestField("PWD Retirement Age");
                    Rage := CALCDATE(EmpPost."PWD Retirement Age", HREmp."Date Of Birth");
                    HREmp."Retirement Date" := CALCDATE('<+1D>', Rage);
                    Years := ABS(DATE2DMY(Rage, 3) - DATE2DMY(HREmp."Date Of Birth", 3));
                end else begin
                    Rage := CALCDATE(EmpPost."Retirement Age", HREmp."Date Of Birth");
                    HREmp."Retirement Date" := CALCDATE('<+1D>', Rage);
                    Years := ABS(DATE2DMY(Rage, 3) - DATE2DMY(HREmp."Date Of Birth", 3));
                end;
            end;
        end;
    end;

    // procedure AttachDocumentsLink(DocNo: Code[20]; FileName: Text[2000]; DocID: Text; TableID: Integer)
    // var
    //     DocAttachment: Record "Document Attachment";
    //     FromRecRef: RecordRef;
    //     FileManagement: Codeunit "File Management";
    //     //Bytes: dotnet Array;
    //     // LegalH: Record "Legal Management";
    //     //Convert: dotnet Convert;
    //     //MemoryStream: dotnet MemoryStream;
    //     Ostream: OutStream;
    //     CurrPage: Page "Document Attachments";
    //     tableFound: Boolean;

    //     HRTraining: Record "Training Requests";
    //     InterBank: Record "Payments";
    //     PV: Record "Payments";
    //     ImpMemo: Record "Payments";
    //     //  ICTReq: Record "ICT General Requisition Header";
    //     StaffAdvanceHeader: Record "Payments";
    //     EmpReq: Record "Recruitment Requisition Header";
    //     StaffAdvanceSurr: Record "Payments";
    //     //  Induction: Record "HR Induction Schedule";
    //     //StaffInd: Record "HR Staff  Induction";
    //     LeaveT: Record "HR Leave Application";
    //     objPurchaseHeader: Record "Purchase Header";
    //     EmpTransfer: Record "Employee Transfers";
    //     DependantChange: record "Dependants Change";
    //     PayChangeAdvice: record "prBasic pay PCA";
    //     LoanApplication: Record "Loan Application";

    // begin

    //     // if FileName <> '' then begin
    //     // Clear(DocAttachment);
    //     DocAttachment.Init();
    //     //DocAttachment.Validate("File Extension", FileManagement.GetExtension(FileName));
    //     DocAttachment."File Name" := FileName;
    //     DocAttachment."Table ID" := TableID;
    //     DocAttachment."No." := DocNo;
    //     DocAttachment."EDMS Link" := DocID;
    //     DocAttachment.Insert(false);
    //     //if FileManagement.DeleteServerFile(FileName) then;

    // end;

    procedure InsertProcurementPlan(EmpUserID: Text; Description: Text; CSRID: Text; GeographicalID: Text; AdminUnit: Text; VoteID: Text) DocNo: Text
    begin
        PurchSetup.Get;
        PurchSetup.TestField("Procument Plan Nos");
        DocNo := NoSeriesMgt.GetNextNo(PurchSetup."Procument Plan Nos", 0D, true);
        ProcurementPlan.Init();
        ProcurementPlan."Plan Type" := ProcurementPlan."Plan Type"::Functional;
        ProcurementPlan.Code := DocNo;
        ProcurementPlan.Description := Description;
        ProcurementPlan."Document Type" := ProcurementPlan."Document Type"::"Procurement Plan";
        ProcurementPlan."Created By" := EmpUserID;
        ProcurementPlan."Date Created" := Today;
        ProcurementPlan."Time Created" := Time;
        ProcurementPlan."Document Date" := Today;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", EmpUserID);
        if UserSetup.FindSet then begin
            Employee.Reset;
            Employee.SetRange("No.", UserSetup."Employee No.");
            if Employee.FindSet then begin
                ProcurementPlan."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                ProcurementPlan."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
                ProcurementPlan.Region := Employee.Region;
                ProcurementPlan.Directorate := Employee."Directorate Code";
                ProcurementPlan.Department := Employee."Department Code";
                if AdminUnit <> Employee."Global Dimension 2 Code" then begin
                    ProcurementPlan.Validate("Global Dimension 1 Code", Employee."Global Dimension 1 Code");
                    ProcurementPlan.Validate("Global Dimension 2 Code", Employee."Global Dimension 2 Code");

                end;
            end;
        end;

        ProcurementPlan."Corporate Strategic Plan ID" := CSRID;
        FinancialYear.Reset();
        FinancialYear.setrange(Active, true);
        if FinancialYear.Find('-') then
            ProcurementPlan.Validate("Financial Year Code", FinancialYear.Code);
        ProcurementPlan."Global Dimension 3 Code" := VoteID;
        ProcurementPlan.Insert(false);

    end;

    Procedure InsertProcurementPlanLines(ProcurementPlanID: Text; PlanCategory: Text)
    begin
        ProcurementPlanLines.Init();
        ProcurementPlanLines."Procurement Plan ID" := ProcurementPlanID;
        ProcurementPlanLines.Validate("Planning Category", PlanCategory);
        ProcurementPlanLines.Insert();

    end;

    Procedure ModifyProcurementPlanLines(ProcurementPlanID: Text; LineNo: Integer; PlanCategory: Text)
    begin
        ProcurementPlanLines.Reset();
        ProcurementPlanLines.setrange("PP Line No", LineNo);
        ProcurementPlanLines.setrange("Procurement Plan ID", ProcurementPlanID);
        if ProcurementPlanLines.find('-') then Begin
            ProcurementPlanLines.Validate("Planning Category", PlanCategory);
            ProcurementPlanLines.Modify();
        End;

    end;

    Procedure DeleteProcurementPlanLines(ProcurementPlanID: Text; LineNo: Integer; PlanCategory: Text)
    begin
        ProcurementPlanLines.Reset();
        ProcurementPlanLines.setrange("PP Line No", LineNo);
        ProcurementPlanLines.setrange("Procurement Plan ID", ProcurementPlanID);
        if ProcurementPlanLines.find('-') then Begin
            //ProcurementPlanLines.Validate("Planning Category", PlanCategory);
            ProcurementPlanLines.Delete;
        End;

    end;

    Procedure InsertProcurementPlanEntry(ProcurementPlanID: Text; PlanCategory: Text; PlanItemType: Option; PlanItemNo: Text;
    ProcurementType: Text; SolicitationType: Text; ProcurementMethod: Option; OtherMethods: Text; PreferenceReservationCode: Text;
    FundingSourceID: Text; InvitationNoticeType: Integer; Quantity: Decimal; UnitCost: Decimal; Q1Quantity: Decimal;
    Q1Amount: Decimal; Q2Quantity: Decimal; Q2Amount: Decimal; Q3Quantity: Decimal; Q3Amount: Decimal; Q4Quantity: Decimal;
    Q4Amount: Decimal)
    begin
        ProcurementPlanEntry.Init();
        ProcurementPlanEntry."Procurement Plan ID" := ProcurementPlanID;
        ProcurementPlanEntry.Validate("Planning Category", PlanCategory);
        ProcurementPlanEntry."Document Type" := ProcurementPlanEntry."Document Type"::"Procurement Plan";
        ProcurementPlanEntry."Plan Item Type" := PlanItemType;
        ProcurementPlanEntry.Validate("Plan Item No", PlanItemNo);
        ProcurementPlanEntry."Procurement Type" := ProcurementType;
        ProcurementPlanEntry."Solicitation Type" := SolicitationType;
        ProcurementPlanEntry."Procurement Method" := ProcurementMethod;
        ProcurementPlanEntry."Other Procurement Methods" := OtherMethods;
        ProcurementPlanEntry."Preference/Reservation Code" := PreferenceReservationCode;
        ProcurementPlanEntry."Funding Source ID" := FundingSourceID;
        ProcurementPlanEntry."Invitation Notice Type" := InvitationNoticeType;
        ProcurementPlanEntry."Quantity" := Quantity;
        ProcurementPlanEntry."Unit Cost" := UnitCost;
        ProcurementPlanEntry."Q1 Quantity" := Q1Quantity;
        ProcurementPlanEntry."Q1 Amount" := Q1Amount;
        ProcurementPlanEntry."Q2 Quantity" := Q2Quantity;
        ProcurementPlanEntry."Q2 Amount" := Q2Amount;
        ProcurementPlanEntry."Q3 Quantity" := Q3Quantity;
        ProcurementPlanEntry."Q3 Amount" := Q3Amount;
        ProcurementPlanEntry."Q4 Quantity" := Q4Quantity;
        ProcurementPlanEntry."Q4 Amount" := Q4Amount;
        ProcurementPlanEntry.Insert();
    end;

    Procedure ModifyProcurementPlanEntry(LineNo: Integer; ProcurementPlanID: Text; PlanCategory: Text; PlanItemType: Option; PlanItemNo: Text;
    ProcurementType: Text; SolicitationType: Text; ProcurementMethod: Option; OtherMethods: Text; PreferenceReservationCode: Text;
    FundingSourceID: Text; InvitationNoticeType: Integer; Quantity: Decimal; UnitCost: Decimal; Q1Quantity: Decimal;
    Q1Amount: Decimal; Q2Quantity: Decimal; Q2Amount: Decimal; Q3Quantity: Decimal; Q3Amount: Decimal; Q4Quantity: Decimal;
    Q4Amount: Decimal)
    begin
        ProcurementPlanEntry.Reset();
        ProcurementPlanEntry.Setrange(ProcurementPlanEntry."Entry No.", LineNo);
        ProcurementPlanEntry.Setrange(ProcurementPlanEntry."Procurement Plan ID", ProcurementPlanID);
        ProcurementPlanEntry.Setrange("Planning Category", PlanCategory);
        if ProcurementPlanEntry.Find('-') then begin
            ProcurementPlanEntry."Document Type" := ProcurementPlanEntry."Document Type"::"Procurement Plan";
            ProcurementPlanEntry."Plan Item Type" := PlanItemType;
            ProcurementPlanEntry.Validate("Plan Item No", PlanItemNo);
            ProcurementPlanEntry."Procurement Type" := ProcurementType;
            ProcurementPlanEntry."Solicitation Type" := SolicitationType;
            ProcurementPlanEntry."Procurement Method" := ProcurementMethod;
            ProcurementPlanEntry."Other Procurement Methods" := OtherMethods;
            ProcurementPlanEntry."Preference/Reservation Code" := PreferenceReservationCode;
            ProcurementPlanEntry."Funding Source ID" := FundingSourceID;
            ProcurementPlanEntry."Invitation Notice Type" := InvitationNoticeType;
            ProcurementPlanEntry."Quantity" := Quantity;
            ProcurementPlanEntry."Unit Cost" := UnitCost;
            ProcurementPlanEntry."Q1 Quantity" := Q1Quantity;
            ProcurementPlanEntry."Q1 Amount" := Q1Amount;
            ProcurementPlanEntry."Q2 Quantity" := Q2Quantity;
            ProcurementPlanEntry."Q2 Amount" := Q2Amount;
            ProcurementPlanEntry."Q3 Quantity" := Q3Quantity;
            ProcurementPlanEntry."Q3 Amount" := Q3Amount;
            ProcurementPlanEntry."Q4 Quantity" := Q4Quantity;
            ProcurementPlanEntry."Q4 Amount" := Q4Amount;
            ProcurementPlanEntry.Modify();
        end;
    end;

    procedure CreateBidScoringTemplate(TempTyp: Option; Desc: Text; UserI: Text) DocNo: code[30]
    var
        myInt: Integer;
        BidScoringTemplate: Record "Bid Scoring Template";
        ProcurementSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    //DocNo: code[30];
    begin
        ProcurementSetup.Get;
        ProcurementSetup.TestField("Bid Req Template No. Series");
        DocNo := NoSeriesMgt.GetNextNo(ProcurementSetup."Bid Req Template No. Series", 0D, true);
        BidScoringTemplate.init;
        BidScoringTemplate.Code := DocNo;
        BidScoringTemplate."Template type" := TempTyp;
        BidScoringTemplate.Description := Desc;
        BidScoringTemplate."Created By" := UserI;
        if BidScoringTemplate.Insert() = true then
            exit(DocNo)
        else
            exit('');

    end;

    procedure CancellIFSTEnderCommiteeForApproval(DocNu: code[30]): Text
    var
        myInt: Integer;
        VarVariant: Variant;
        IfsCommitee: Record "IFS Tender Committee";
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
    begin
        IfsCommitee.Reset();
        IfsCommitee.SetRange("Document No.", DocNu);
        if IfsCommitee.FindFirst() then begin
            VarVariant := IfsCommitee;
            ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
        end;
    end;

    procedure SendIFSTEnderCommiteeForApproval(DocNu: code[30]): Text
    var
        myInt: Integer;
        VarVariant: Variant;
        IfsCommitee: Record "IFS Tender Committee";
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
    begin
        IfsCommitee.Reset();
        IfsCommitee.SetRange("Document No.", DocNu);
        if IfsCommitee.FindFirst() then begin
            VarVariant := IfsCommitee;
            if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                ApprovalsMgmt.OnSendDocForApproval(VarVariant);
        end;
    end;

    Procedure DeleteProcurementPlanEntry(LineNo: Integer; ProcurementPlanID: Text; PlanCategory: Text)
    begin
        ProcurementPlanEntry.Reset();
        ProcurementPlanEntry.Setrange(ProcurementPlanEntry."Entry No.", LineNo);
        ProcurementPlanEntry.Setrange(ProcurementPlanEntry."Procurement Plan ID", ProcurementPlanID);
        ProcurementPlanEntry.Setrange("Planning Category", PlanCategory);
        if ProcurementPlanEntry.Find('-') then begin
            ProcurementPlanEntry.Delete();
        end;
    end;

    procedure GenerateEvalutionReport(DocumentNo: Code[20]) FileContentsB64: Text;
    var
        // AnnualWorkplan: Record "Workplan Budget Per Item";
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        EvaluationReport: Record "Bidder Mandatory Requirements";
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        ResponseObject: JsonObject;
    begin
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        EvaluationReport.Reset;
        EvaluationReport.SetRange(EvaluationReport."Tender No", DocumentNo);
        if EvaluationReport.FindFirst() then begin
            RecRef.GetTable(EvaluationReport);
            Report.SaveAs(Report::"Evaluation Report", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);
        end;
    end;

    procedure InsertBidscoreRequirement(TempLID: Code[30]; Evalty: Option; EvalRequirement: text; CriteriaGID: code[10]): Boolean
    var
        myInt: Integer;
        BidReq: Record "Bid Score Requirement";
    begin
        BidReq.Reset();
        BidReq.Init();
        BidReq."Evaluation Type" := Evalty;
        BidReq."Template ID" := TempLID;
        BidReq."Criteria Group ID" := CriteriaGID;
        BidReq.Validate(BidReq."Criteria Group ID");
        BidReq."Evaluation Requirement" := EvalRequirement;
        if BidReq.Insert() = true then
            exit(true)
        else
            exit(false);

    end;


    procedure CreateBidScoreCreterio(TemplateId: Code[30]; CreterioGr: Code[30]; EvaluationTYp: Option; Desc: Text): Boolean
    var
        myInt: Integer;
        BidCrerio: Record "Bid Score Criteria Group";
    begin
        BidCrerio.Init();
        BidCrerio."Criteria Group ID" := CreterioGr;
        BidCrerio."Template ID" := TemplateId;
        BidCrerio."Evaluation Type" := EvaluationTYp;
        BidCrerio.Description := Desc;
        if BidCrerio.Insert() then
            exit(true)
        else
            exit(false);

    end;

    procedure InsertExpenseRequisition(
                                       Description: Text[100];
                                       "Global Dimension 1 Code": Code[20];
                                       "Global Dimension 2 Code": Code[20];
                                       "Activity Code": Code[20];
                                       "Requires Imprest": Boolean;
                                       "Imprest Type": Option;
                                       "Start Date": Date;
                                       "No Of Days": Integer;
                                       Subject: Text[100];
                                       ObjectiveTxt: Text[250];
                                       "Requires Direct Payment": Boolean;
                                       "Requires PRN": Boolean;
                                       "Procurement Plan ID": Code[20];
                                       "PRN Type": Option ,Standard,"Project Works";
                                       "Location Code": Code[10];
                                       "Requisition Product Group": Option Goods,Services,Works,Assets;
                                       "PP Plan Category": Text[100];
                                       "Created By": Code[50]; DirectPaymentType: Option; DocuNo: Code[20]) DocNo: Code[20]

    var
        "Corporate Strategy": Text[100];
        "Reporting Period": Text[100];
        Workplan: Text[100];

        ObjBigTxt: BigText;
        Instr: InStream;
        OuStr: OutStream;
    begin
        ExpenseRequisition.CheckExsiting("Created By");
        SPMSetUp.Get();
        SPMSetUp.TestField("Exp. Requisition Nos");
        if DocuNo = '' then
            DocNo := NoSeriesMgt.GetNextNo(SPMSetUp."Exp. Requisition Nos", 0D, true)
        else
            DocNo := DocuNo;
        ExpenseRequisition.Init();
        ExpenseRequisition."No." := DocNo;
        ExpenseRequisition.Description := Description;
        ExpenseRequisition."Created By" := "Created By";
        ExpenseRequisition."Global Dimension 1 Code" := "Global Dimension 1 Code";
        ExpenseRequisition."Holders Admin Unit" := "Global Dimension 2 Code";
        ExpenseRequisition.Validate("Global Dimension 2 Code", "Global Dimension 2 Code");
        ExpenseRequisition.Validate("Global Dimension 1 Code");
        "Corporate Strategy" := WorkplanMgt.GetCurrentCorporateStrategy();
        "Reporting Period" := WorkplanMgt.GetCurrentStrategyImplementationYear("Corporate Strategy");
        ExpenseRequisition."Corporate Strategy" := "Corporate Strategy";
        ExpenseRequisition."Reporting Period" := "Reporting Period";
        ExpenseRequisition.Validate("Reporting Period");
        ExpenseRequisition.Workplan := WorkplanMgt.GetCurrentWorkplan("Corporate Strategy", "Reporting Period", "Global Dimension 1 Code", "Global Dimension 2 Code");
        ExpenseRequisition.Validate(Workplan);
        ExpenseRequisition.Date := Today;
        ExpenseRequisition."Direct Payment Type" := DirectPaymentType;
        ExpenseRequisition.Validate("Activity Code", "Activity Code");
        //ExpenseRequisition."Activity Code" := "Activity Code";
        ExpenseRequisition."Requires Imprest" := "Requires Imprest";
        ExpenseRequisition."Imprest Type" := "Imprest Type";
        ExpenseRequisition."Start Date" := "Start Date";
        if ("No Of Days" <> 0) then
            ExpenseRequisition.Validate("No Of Days", "No Of Days");
        ExpenseRequisition.Subject := Subject;
        ExpenseRequisition.CalcFields(Objective);
        ExpenseRequisition.Objective.CreateInStream(Instr);
        ObjBigTxt.Read(Instr);
        if format(ObjBigTxt) <> ObjectiveTxt then begin
            ExpenseRequisition.Objective.CreateOutStream(OuStr);
            OuStr.WriteText(ObjectiveTxt);
        end;
        ExpenseRequisition."Requires Direct Payment" := "Requires Direct Payment";
        ExpenseRequisition."Requires PRN" := "Requires PRN";
        ExpenseRequisition."Procurement Plan ID" := "Procurement Plan ID";
        ExpenseRequisition."PRN Type" := "PRN Type";
        ExpenseRequisition."Location Code" := "Location Code";
        ExpenseRequisition."PP Plan Category" := "PP Plan Category";
        ExpenseRequisition."Requisition Product Group" := "Requisition Product Group";

        ExpenseRequisition."Date Created" := CurrentDateTime;
        if DocuNo = '' then ExpenseRequisition.Insert() else ExpenseRequisition.modify();
    end;

    procedure ModifyExpenseRequisition(
                                           Description: Text[100];
                                           "Requires Imprest": Boolean;
                                           "Imprest Type": Option;
                                           "Activity Code": Code[20];
                                           "Start Date": Date;
                                           "No Of Days": Integer;
                                           Subject: Text[100];
                                           ObjectiveTxt: Text[250];
                                           "Requires Direct Payment": Boolean;
                                           "Requires PRN": Boolean;
                                           "PRN Type": Option;
                                           "Requisition Product Group": Code[20];
                                           "PP Plan Category": Text[100];
                                           DirectPaymentType: Option; DocuNo: Code[20]) DocNo: Code[20]

    var
        "Corporate Strategy": Text[100];
        "Reporting Period": Text[100];
        Workplan: Text[100];
        ObjBigTxt: BigText;
        Instr: InStream;
        OuStr: OutStream;
    begin

        ExpenseReqLine.Reset();
        ExpenseRequisition.SetRange("No.", DocuNo);
        if ExpenseRequisition.FindSet() then begin
            ExpenseRequisition.Description := Description;
            ExpenseRequisition."Direct Payment Type" := DirectPaymentType;
            ExpenseRequisition."Requires Imprest" := "Requires Imprest";
            ExpenseRequisition."Imprest Type" := "Imprest Type";
            ExpenseRequisition."Start Date" := "Start Date";
            if ("No Of Days" <> 0) then
                ExpenseRequisition.Validate("No Of Days", "No Of Days");
            ExpenseRequisition.Subject := Subject;
            ExpenseRequisition.CalcFields(Objective);
            ExpenseRequisition.Objective.CreateInStream(Instr);
            ObjBigTxt.Read(Instr);
            if format(ObjBigTxt) <> ObjectiveTxt then begin
                ExpenseRequisition.Objective.CreateOutStream(OuStr);
                OuStr.WriteText(ObjectiveTxt);
            end;
            ExpenseRequisition."Requires Direct Payment" := "Requires Direct Payment";
            ExpenseRequisition."Requires PRN" := "Requires PRN";
            ExpenseRequisition."PRN Type" := "PRN Type";
            ExpenseRequisition."PP Plan Category" := "PP Plan Category";
            ExpenseRequisition."Activity Code" := "Activity Code";
            ExpenseRequisition.Validate("Activity Code", "Activity Code");
            ExpenseRequisition.modify();
        end;

    end;

    procedure InsertExpenseRequisitionLine(DocumentNo: Text; "G/L Account": Code[20]; "Vote Book": Code[20]; Class: Text; "Total Amount": Decimal; Dim4: Text; Dim6: Text; Activity: code[30])
    var
        Mt: integer;
        ExpenseRequisition: Record "Expense Requisition";
        ExpenseReqLine: Record "Expense Requisition Line";
    begin
        ExpenseRequisition.reset;
        ExpenseRequisition.Setrange("No.", DocumentNo);
        if ExpenseRequisition.find('-') then begin
            ExpenseReqLine.init;
            ExpenseReqLine."Document No." := ExpenseRequisition."No.";
            ExpenseReqLine."Budget Code" := ExpenseRequisition."Budget Code";
            ExpenseReqLine."Resource Req. No." := ExpenseRequisition."Resource Req. No.";
            ExpenseReqLine."Activity Id" := Activity;
            ExpenseReqLine.Validate("Activity Id");
            ExpenseReqLine."Global Dimension 1 Code" := ExpenseRequisition."Global Dimension 1 Code";
            ExpenseReqLine."Global Dimension 2 Code" := ExpenseRequisition."Global Dimension 2 Code";
            ExpenseReqLine."Requires Direct Payment" := ExpenseRequisition."Requires Direct Payment";
            ExpenseReqLine."Requires Imprest" := ExpenseRequisition."Requires Imprest";
            ExpenseReqLine."Requires PRN" := ExpenseRequisition."Requires PRN";
            ExpenseReqLine.Validate("G/L Account", "G/L Account");
            ExpenseReqLine."Shortcut Dimension 4 Code" := Dim4;
            ExpenseReqLine."Shortcut Dimension 3 Code" := "Vote Book";
            ExpenseReqLine."Shortcut Dimension 5 Code" := Class;
            ExpenseReqLine."Shortcut Dimension 6 Code" := Dim6;
            ExpenseReqLine.validate(ExpenseReqLine."Shortcut Dimension 4 Code");
            ExpenseReqLine.validate(ExpenseReqLine."Shortcut Dimension 5 Code");
            ExpenseReqLine.validate(ExpenseReqLine."Shortcut Dimension 3 Code");
            ExpenseReqLine.validate(ExpenseReqLine."Shortcut Dimension 6 Code");

            // ExpenseReqLine."Budget Allocation" := "Budget Allocation";
            // ExpenseReqLine."Budget Balance" := "Budget Balance";
            // ExpenseReqLine."Total Committments" := "Total Committments";
            ExpenseReqLine."Total Amount" := "Total Amount";
            ExpenseReqLine.Validate(ExpenseReqLine."Total Amount");
            ExpenseReqLine.Insert();
        end;
    end;

    procedure ModifyExpenseLines(DocNo: Code[30]; LineNo: Integer; resourseNum: code[30]; TAmount: Decimal)
    var
        myInt: Integer;
        ExpenseReqLine: Record "Expense Requisition Line";
    begin
        ExpenseReqLine.Reset();
        ExpenseReqLine.SetRange("Line No.", LineNo);
        ExpenseReqLine.SetRange("Document No.", DocNo);
        ExpenseReqLine.SetRange("Resource Req. No.", resourseNum);
        if ExpenseReqLine.FindFirst() then begin
            ExpenseReqLine."Total Amount" := TAmount;
            if ExpenseReqLine."Total Amount" > ExpenseReqLine."Budget Balance" then
                Error('Total amount cannot be greater than the available budget balance');
            // ExpenseReqLine.validate(ExpenseReqLine."Total Amount");
            ExpenseReqLine."Error Message" := '';
            ExpenseReqLine.error := false;
            ExpenseReqLine.Modify();
        end;

    end;

    procedure InsertExpenseReqAllocation(supplier: Text; ExpenseDescription: Text; GLAccount: Text; Quantity: Decimal; Rate: Decimal)
    begin

        ExpenseReqAllocation.Init();
        ExpenseReqAllocation."Supplier" := supplier;
        ExpenseReqAllocation."Expense Description" := ExpenseDescription;
        ExpenseReqAllocation."G/L Account" := GLAccount;
        ExpenseReqAllocation.Quantity := Quantity;
        ExpenseReqAllocation.Validate(Rate, Rate);
        ExpenseReqAllocation.Insert(true);
    end;

    procedure InsertExpenseLinesImprest(DocumentNo: Text; EmpNo: Text; ExpenseDescription: Text; GLAccount: Text; Quantity: Decimal; Rate: Decimal; Destination: Text; VoteItem: Text; LineNo: Integer; Type: Option)
    begin

        ExpenseReqAllocation.Init();
        ExpenseReqAllocation."Document No." := DocumentNo;
        ExpenseReqAllocation."Source Line No." := LineNo;
        ExpenseReqAllocation.Type := Type;
        ExpenseReqAllocation.Validate("Resource No.", EmpNo);
        ExpenseReqAllocation."Expense Description" := ExpenseDescription;
        ExpenseReqAllocation.Destination := Destination;
        ExpenseReqAllocation."Vote Item" := VoteItem;
        ExpenseReqAllocation."G/L Account" := GLAccount;
        ExpenseReqAllocation.Quantity := Quantity;
        ExpenseReqAllocation.Validate(Rate, Rate);
        ExpenseReqAllocation.Insert(true);
    end;

    procedure InsertExpenseLinesPurchase(DocumentNo: Text; supplier: Text; ProcPlanEntry: Integer; ProcType: Option; LineType: Option; ItemNo: Text; ExpenseDescription: Text; GLAccount: Text; Quantity: Decimal; Rate: Decimal; LineNo: Integer)
    begin

        ExpenseReqAllocation.Init();
        ExpenseReqAllocation."Document No." := DocumentNo;
        ExpenseReqAllocation.validate(ExpenseReqAllocation."Document No.");
        ExpenseReqAllocation."Source Line No." := LineNo;
        ExpenseReqAllocation.Type := ExpenseReqAllocation.Type::PRN;
        ExpenseReqAllocation."Supplier" := supplier;
        ExpenseReqAllocation."G/L Account" := GLAccount;
        ExpenseReqAllocation."ProcPlan Entry No." := ProcPlanEntry;
        ExpenseReqAllocation.Validate("ProcPlan Entry No.");
        ExpenseReqAllocation."Proc Type" := ProcType;
        ExpenseReqAllocation."Line Type" := LineType;
        ExpenseReqAllocation.Validate("No.");
        ExpenseReqAllocation."Expense Description" := ExpenseDescription;
        ExpenseReqAllocation.Quantity := Quantity;
        ExpenseReqAllocation.Validate(Rate, Rate);
        ExpenseReqAllocation.Insert(true);
    end;

    procedure ExpenseRequisitionApproval(DocNo: Text)
    begin
        ExpenseRequisition.Reset();
        ExpenseRequisition.SetRange(ExpenseRequisition."No.", DocNo);
        if ExpenseRequisition.find('-') then begin
            VarVariant := ExpenseRequisition;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end

    end;

    procedure CancelExpenseRequisitionApproval(DocNo: Text)
    begin
        ExpenseRequisition.Reset();
        ExpenseRequisition.SetRange(ExpenseRequisition."No.", DocNo);
        if ExpenseRequisition.find('-') then begin
            VarVariant := ExpenseRequisition;
            if ExpenseRequisition."Approval Status" = ExpenseRequisition."Approval Status"::"Pending Approval" then
                CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);

        end;

    end;

    procedure GetDSARates(EmpNo: Text; Destination: Text) Rate: Decimal
    begin
        Rate := 0;
        HREmp.Get(EmpNo);
        ResourceCost.Reset();
        // ResourceCost.SetRange(Type, ResourceCost.Type::);
        ResourceCost.SetRange(Code, HREmp."Salary Scale");
        ResourceCost.SetRange("Work Type Code", Destination);
        if ResourceCost.Find('-') then
            Rate := ResourceCost."Direct Unit Cost";


    end;

    // procedure FullUtilVoucherApproval(DocNo: Text)
    // var
    //     PvLines: Record "PV Lines";
    //     Payment: Record "Payments";
    //     isValid: Boolean;
    //     IsBankValid: Text;
    //     ValidBankName: Text;
    //     validPayeeBankAccName: Text;
    //     ValidkcbBankAccName: Text;

    //     OutwardPayment: Codeunit OutwardPayment;
    //     TotalNetAmount: Decimal;
    //     paymodeTable: Record "Pay Mode";
    //     EFPay: Code[10];
    //     PLPay: Code[10];
    //     EFAmount: Decimal;
    //     PLAmount: Decimal;
    //     payeeBankAccName: Text;
    //     kcbBankAccName: Text;
    //     smsSetup: Record "SMS Setup";
    //     PRBankAcc: Record "PR Bank Accounts";
    //     SkipBankValidationList: List of [Code[10]];
    //     BankCode: Code[10];
    //     ValidatedBankName: Text[250];



    // begin


    //     isValid := true;
    //     smsSetup.get();
    //     Payment.reset();
    //     Payment.setRange("No.", DocNo);
    //     Payment.FindFirst();

    //     if (PRBankAcc.FindSet()) then
    //         repeat
    //             BankCode := PRBankAcc."Bank Code";
    //             if not SkipBankValidationList.Contains(BankCode) then skipBankValidationList.Add(BankCode);
    //         until PRBankAcc.Next = 0;
    //     if (Payment."Pay Mode" = 'MO') then begin
    //         isValid := true;
    //     end
    //     else begin
    //         paymodeTable.Reset;
    //         paymodeTable.setRange("Code", 'EF');
    //         paymodeTable.FindFirst();
    //         paymodeTable.TestField(paymodeTable.Threshold);

    //         EFPay := paymodeTable."Code";
    //         EFAmount := paymodeTable.Threshold;
    //         paymodeTable.Reset;
    //         paymodeTable.setRange("Code", 'PL');
    //         paymodeTable.FindFirst();
    //         paymodeTable.TestField(paymodeTable.Threshold);
    //         PLPay := paymodeTable."Code";
    //         PLAmount := paymodeTable.Threshold;

    //         if not (Payment."Pay Mode" in ['IF', 'RT', 'EF', 'PL', 'MO']) then begin
    //             isValid := false;
    //             Error('Invalid Payment Channel');
    //         end;

    //         if (Payment."Pay Mode" = EFPay) then begin
    //             TotalNetAmount := 0;

    //             PvLines.Reset();
    //             PvLines.SetRange(No, Payment."No.");


    //             if PvLines.FindSet() then
    //                 repeat
    //                     TotalNetAmount := TotalNetAmount + PvLines."Net Amount";
    //                 until PvLines.Next() = 0;

    //             if TotalNetAmount > EFAmount then begin
    //                 isValid := false;
    //                 Error('Amount Should be Less than 1M For the selected paymode');

    //             end

    //         end;

    //         if (Payment."Pay Mode" = PLPay) then begin
    //             TotalNetAmount := 0;

    //             PvLines.Reset();
    //             PvLines.SetRange(No, Payment."No.");
    //             if PvLines.FindSet() then
    //                 repeat
    //                     TotalNetAmount := TotalNetAmount + PvLines."Net Amount";
    //                 until PvLines.Next() = 0;

    //             if TotalNetAmount > PLAmount then begin
    //                 isValid := false;
    //                 Error('Amount Should be Less than 1M For the selected paymode');

    //             end

    //         end;
    //         if (smsSetup.skipValidation = true) then begin
    //             isValid := true

    //         end
    //         else begin
    //             if ((Payment."Payment Type" = Payment."Payment Type"::"Payment Voucher") or
    //             (Payment."Payment Type" = Payment."Payment Type"::"Standing Imprest") or
    //             (Payment."Payment Type" = Payment."Payment Type"::"Bank Transfer") or
    //              (Payment."Payment Type" = Payment."Payment Type"::"Staff Claim") or
    //             (Payment."Payment Type" = Payment."Payment Type"::"Special Imprest")) then begin


    //                 PvLines.Reset();
    //                 PvLines.SetRange(No, Payment."No.");
    //                 if PvLines.FindSet() then
    //                     repeat
    //                         if ((smsSetup.ByPassValidation = true) and SkipBankValidationList.Contains(PvLines."Payee Bank Code")) then begin
    //                             isValid := true;
    //                         end
    //                         else begin
    //                             IsBankValid := OutwardPayment.validateBankAccount(PvLines."Payee Bank Account No.", PvLines."Payee Bank Code");
    //                             kcbBankAccName := DelChr(UpperCase(IsBankValid), '=');
    //                             payeeBankAccName := DelChr(UpperCase(PvLines."Payee Bank Acc Name"), '=');

    //                             if kcbBankAccName = payeeBankAccName then begin
    //                                 PvLines.isBankValid := 'VALID BANK DETAILS';
    //                                 PvLines.rbankName := IsBankValid;

    //                             end

    //                             else begin
    //                                 PvLines.isBankValid := 'INVALID BANK DETAILS';
    //                                 // PvLines.bankName := IsBankValid;
    //                                 PvLines.rbankName := IsBankValid;
    //                                 isValid := false;
    //                             end;

    //                             PvLines.Modify();
    //                             Commit();

    //                         end;
    //                     until PvLines.Next() = 0;



    //             end;

    //             if (Payments."Payment Type" = Payments."Payment Type"::"Imprest") then begin
    //                 ValidBankName := payments.validateImprestBank(Payments."No.");
    //                 Payments.ValidatedBankName := ValidBankName;
    //                 if (payments.isNameValid(payments."Payee", ValidBankName) = false) then begin
    //                     payments.Modify;
    //                     Commit();
    //                     isValid := false;
    //                     Error('Invalid Bank Account');
    //                 end;
    //             end;







    //         end;



    //     end;

    //     if isValid = true then begin

    //         FullUtilizationVoucher.Reset();
    //         FullUtilizationVoucher.SetRange(FullUtilizationVoucher."No.", DocNo);
    //         if FullUtilizationVoucher.find('-') then begin
    //             VarVariant := FullUtilizationVoucher;
    //             if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
    //                 CustomApprovalMgt.OnSendDocForApproval(VarVariant);
    //         end;


    //     end
    //     else
    //         Error('Bank Validation Failed');


    // end;

    // procedure CancelFullUtilVoucher(DocNo: Text)
    // begin
    //     FullUtilizationVoucher.Reset();
    //     FullUtilizationVoucher.SetRange(FullUtilizationVoucher."No.", DocNo);
    //     if FullUtilizationVoucher.find('-') then begin
    //         VarVariant := FullUtilizationVoucher;
    //         // if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
    //         if FullUtilizationVoucher.Status = FullUtilizationVoucher.Status::"Pending Approval" then
    //             CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
    //     end;



    // end;

    procedure ClearExpenseLines(DocNu: code[40]; LineNu: Integer)
    var
        myInt: Integer;
        Expenselines: Record "Expense Requisition Line";
        ResourceAlo: Record "Expense Req. Allocation";
    begin
        Expenselines.reset;
        Expenselines.setrange(Expenselines."Document No.", DocNu);
        Expenselines.SetRange("Line No.", LineNu);
        if Expenselines.findfirst then begin
            ResourceAlo.Reset();
            ResourceAlo.SetRange("Document No.", Expenselines."Document No.");
            ResourceAlo.SetRange("Source Line No.", Expenselines."Line No.");
            if ResourceAlo.Findset then
                ResourceAlo.Delete();
            Expenselines.delete(true);
        end;

    end;


    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
    begin

        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    procedure ImportExcellBudgetValues(var FileNamePath: Text[100]): Boolean
    var
        FileX: Codeunit "File Management";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        Success: Boolean;
        Row, LastRow : Integer;
        x: Codeunit "Excel Management";
        FileExists: Boolean;
        Data: Record "Workplan Budget Line";
        Buffer: Record "Excel Buffer";
        test: Text;
    begin
        Clear(TempBlob);
        // FileX.BLOBImportFromServerFile(TempBlob, FileNamePath);
        TempBlob.CreateInStream(InStream);
        Buffer.OpenBookStream(InStream, 'Workplan');
        Buffer.ReadSheet();
        Buffer.setrange("Column No.", 1);
        Buffer.FindLast();
        LastRow := Buffer."Row No.";
        Buffer.Reset();


        for row := 2 to LastRow do begin
            Data.Reset();
            Data.SetRange("Strategy Plan ID", x.GetText(Buffer, 'A', row));
            Data.SetRange("KRA ID", x.GetText(Buffer, 'B', row));
            Data.SetRange("Core Strategy ID", x.GetText(Buffer, 'C', row));
            Data.SetRange("Strategy ID", x.GetText(Buffer, 'E', row));
            Data.SetRange("Activity ID", x.GetText(Buffer, 'G', row));
            Data.SetRange("Input Line No.", x.GetInteger(Buffer, 'I', row));
            Data.SetRange("Line No.", x.GetText(Buffer, 'J', row));
            Data.SetRange("Budget Item", x.GetText(Buffer, 'K', row));
            if Data.FindFirst() then begin
                Data.Validate("Q1 Unit Amount", x.GetDecimal(Buffer, 'S', Row));
                Data.Validate("Q2 Unit Amount", x.GetDecimal(Buffer, 'T', Row));
                Data.Validate("Q3 Unit Amount", x.GetDecimal(Buffer, 'U', Row));
                Data.Validate("Q4 Unit Amount", x.GetDecimal(Buffer, 'V', Row));
                Data.Modify();
                Success := true;
            end;
        end;
        // Commit();
        // Success := XMLPORT.IMPORT(Xmlport::"Import Workplan Budgets", InStream);
        if Success then
            exit(true);
    end;



    procedure ExportWorkplanExcell(DocNo: Code[50]) FileContentsB64: Text
    var
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        // FileContentsB64: Text;
        ResponseObject: JsonObject;

        Wrokplans: Record "Workplan Budget Line";
    begin
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        Wrokplans.Reset();
        Wrokplans.SetRange(Wrokplans."Strategy Plan ID", DocNo);
        if Wrokplans.Find('-') then begin
            RecRef.GetTable(Wrokplans);
            // Report.SaveAs(Xmlport::"Export Workplan", '', ReportFormat::Excel, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64)
        end;
    end;

    // procedure GenerateVoucherReport2(DocNum: Code[50]) FileContentsB64: Text
    // var
    //     BlobOutStream: OutStream;
    //     RecRef: RecordRef;
    //     BlobInStream: InStream;
    //     Base64Convert: Codeunit "Base64 Convert";
    //     TempBlob: Codeunit "Temp Blob";
    //     // FileContentsB64: Text;
    //     ResponseObject: JsonObject;
    //     PayementsRec: record payments;
    //     ReceitRec: record "Bank Account Ledger Entry";
    //     ExpenseReqLine: Record "Expense Requisition Line";
    // begin

    //     TempBlob.CreateInStream(BlobInStream);
    //     TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
    //     PayementsRec.Reset();
    //     PayementsRec.SetRange(PayementsRec."No.", DocNum);
    //     //PayementsRec.SetFilter(PayementsRec."Posting Date", '%1..%2', StartDate, Enddate);
    //     if PayementsRec.Find('-') then begin
    //         RecRef.GetTable(PayementsRec);
    //         if PayementsRec."Payment Type" = PayementsRec."Payment Type"::"Payment Voucher" then begin
    //             if PayementsRec."PV Type" = "PV Type"::Refund then
    //                 Report.SaveAs(Report::"Refund Voucher", '', ReportFormat::Pdf, BlobOutStream, RecRef);
    //             if PayementsRec."PV Type" = "PV Type"::Normal then
    //                 Report.SaveAs(Report::"Payment Voucher", '', ReportFormat::Pdf, BlobOutStream, RecRef);
    //             if PayementsRec."PV Type" = "PV Type"::"Retention Payment" then
    //                 Report.SaveAs(Report::"Payment Voucher", '', ReportFormat::Pdf, BlobOutStream, RecRef);
    //             if PayementsRec."PV Type" = "PV Type"::Tax then
    //                 Report.SaveAs(Report::"Payment Voucher", '', ReportFormat::Pdf, BlobOutStream, RecRef);
    //             if PayementsRec."PV Type" = "PV Type"::"Revenue Sweep Voucher" then
    //                 Report.SaveAs(Report::"Sweep Report", '', ReportFormat::Pdf, BlobOutStream, RecRef);
    //         end;
    //         if PayementsRec."Payment Type" = PayementsRec."Payment Type"::Imprest then begin
    //             Report.SaveAs(Report::"Imprest Warranty", '', ReportFormat::Pdf, BlobOutStream, RecRef);
    //         end;
    //         if PayementsRec."Payment Type" = PayementsRec."Payment Type"::"Staff Claim" then begin
    //             Report.SaveAs(Report::F022Report, '', ReportFormat::Pdf, BlobOutStream, RecRef);
    //         end;

    //         if ((PayementsRec."Payment Type" = PayementsRec."Payment Type"::"Standing Imprest") or (PayementsRec."Payment Type" = PayementsRec."Payment Type"::"Special Imprest"))
    //         then begin
    //             Report.SaveAs(Report::"Imprest Warranty", '', ReportFormat::Pdf, BlobOutStream, RecRef);
    //         end;
    //         FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
    //         //Message(FileContentsB64);
    //         exit(FileContentsB64)
    //     end;
    // end;






    // procedure GenerateVoucherReport(DocNo: Code[20]) BaseImage: Text
    // var
    //     paymentRep: Record Payments;
    // begin
    //     TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
    //     paymentRep.Reset;
    //     paymentRep.SetRange(paymentRep."No.", DocNo);
    //     if paymentRep.Find('-') then begin
    //         RecRef.GetTable(paymentRep);
    //         Report.SaveAs(Report::"Refund Voucher", '', ReportFormat::Pdf, OutStr, RecRef);
    //         FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('Voucher_%1.Pdf', paymentRep."No."), TRUE);
    //         TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
    //         BaseImage := Base64Convert.ToBase64(InStr);
    //         exit(BaseImage);
    //     end;
    // end;

    // procedure GenerateReceiptReport(DocNo: Code[20]) BaseImage: Text
    // var
    //     receiptRep: Record "Receipts Header1";
    // begin
    //     TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
    //     receiptRep.Reset;
    //     receiptRep.SetRange(receiptRep."No.", DocNo);
    //     if receiptRep.Find('-') then begin
    //         RecRef.GetTable(receiptRep);
    //         if receiptRep."Receipt Type" = receiptRep."Receipt Type"::Utilization then begin
    //             Report.SaveAs(Report::"Institution Receipt", '', ReportFormat::Pdf, OutStr, RecRef);
    //         end else
    //             Report.SaveAs(Report::Receipt, '', ReportFormat::Pdf, OutStr, RecRef);
    //         FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('Receipt_%1.Pdf', receiptRep."No."), TRUE);
    //         TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
    //         BaseImage := Base64Convert.ToBase64(InStr);
    //         exit(BaseImage);
    //     end;
    // end;

    procedure InsertContractPaymentTerms(
     No: Code[20];
     InstalmentCode: Code[10];
     PaymentCertificateType: Option;
     Description: Text[100];
     PaymentPercent: Decimal;
     CurrencyCode: Code[10];
     PlannedAmount: Decimal;
     PaidAmount: Decimal)

    begin
        // Initialize the record
        ContractPaymentTerm.Init();

        // Set the fields using the parameters
        ContractPaymentTerm."No." := No;
        ContractPaymentTerm."Instalment Code" := InstalmentCode;
        ContractPaymentTerm."Payment Certificate Type" := PaymentCertificateType;
        ContractPaymentTerm.Description := Description;
        ContractPaymentTerm."Payment %" := PaymentPercent;
        ContractPaymentTerm."Currency Code" := CurrencyCode;
        ContractPaymentTerm."Planned Amount" := PlannedAmount;
        ContractPaymentTerm."Paid Amount" := PaidAmount;
        ContractPaymentTerm.Insert();

    end;

    procedure GenerateBankStatement(BankAccountNo: Code[20]; GeograhicalCode: Text; FromDate: Date; EndDate: Date) BaseImage: Text
    var
        BankAccount: Record "Bank Account";
        BankAccountLedger: Record "Bank Account Ledger Entry";
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        ResponseObject: JsonObject;
    begin
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        BankAccountLedger.Reset;
        BankAccountLedger.SetRange(BankAccountLedger."Bank Account No.", BankAccountNo);
        BankAccountLedger.SetRange(BankAccountLedger."Global Dimension 1 Code", GeograhicalCode);
        BankAccountLedger.SetRange(BankAccountLedger."Posting Date", FromDate, EndDate);
        if BankAccountLedger.FindFirst() then begin
            RecRef.GetTable(BankAccountLedger);
            // Report.SaveAs(Report::"Bank Ledger Entries Report", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);
        end;
    end;

    // procedure GetImprestDimensions(DocNumber: Code[40])
    // var
    //     myInt: Integer;
    //     ImprestMemo: Record "Imprest Memo";
    // begin
    //     ImprestMemo.reset;
    //     ImprestMemo.SetRange("No.", DocNumber);
    //     if ImprestMemo.FindFirst() then
    //         ImprestMemo.ShowEditDimension(true);
    // end;

    procedure GenerateWorkplanBudgetStrategy(DocumentNo: Code[20]; reportType: Integer) FileContentsB64: Text;
    var
        // AnnualWorkplan: Record "Workplan Budget Per Item";
        AnnualWorkplan: Record "Annual Strategy Workplan";
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        ResponseObject: JsonObject;
    begin
        // if( (reportType <> 1) or (reportType <> 0)  ) then Error('Invalid Report Type');
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        AnnualWorkplan.Reset;
        AnnualWorkplan.SetRange(AnnualWorkplan.No, DocumentNo);
        if AnnualWorkplan.FindFirst() then begin
            RecRef.GetTable(AnnualWorkplan);
            if (reportType = 0) then
                // Report.SaveAs(Report::"Workplan Budget Per Item", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            if (reportType = 1) then
                    // Report.SaveAs(Report::"Workplan Budget Per Item", '', ReportFormat::Excel, BlobOutStream, RecRef);

                    FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);
        end;
    end;

    procedure GenerateAnnualFunctionalPlan(DocumentNo: Code[20]; reportType: Integer) FileContentsB64: Text;
    var
        AnnualWorkplan: Record "Annual Strategy Workplan";
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        ResponseObject: JsonObject;
    begin
        // if((reportType <> 1) or (reportType <> 0)) then Error('Invalid Report Type');
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        AnnualWorkplan.Reset;
        AnnualWorkplan.SetRange(AnnualWorkplan.No, DocumentNo);
        if AnnualWorkplan.FindFirst() then begin
            RecRef.GetTable(AnnualWorkplan);
            if (reportType = 0) then
                Report.SaveAs(Report::"Functional Workplan", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            if (reportType = 1) then
                Report.SaveAs(Report::"Functional Workplan", '', ReportFormat::Excel, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);
        end;
    end;

    // procedure createNewPaymentVoucher(docNo: Code[20]; empNo: Text; narration: Text; adminUnit: Code[20]) ReturnV: Code[20]
    // var
    //     CashMgt: Record "Cash Management Setup";
    //     Employee: Record Employee;
    //     Payments: Record Payments;
    //     WorkplanMgt: Codeunit "Workplan Management";
    //     PayMode: Record "Pay Mode";
    //     DefaultDimensionRec: Record "Default Dimension Custom";
    //     CurrDimensions, DefaultDimensions : array[8] of Code[20];
    //     PayPost: Codeunit "Payments-Post";
    //     DimMgt: Codeunit DimensionManagement;
    //     UserSetup: Record "User Setup";
    // begin
    //     CashMgt.Get();
    //     Employee.RESET;
    //     Employee.Get(empNo);
    //     Payments.RESET;
    //     Payments.SETRANGE("No.", docNo);
    //     IF Payments.FINDSET THEN BEGIN
    //         Payments."Payment Narration" := narration;
    //         IF Payments.MODIFY(TRUE) THEN BEGIN
    //             ReturnV := Payments."No.";
    //             exit;
    //         END;
    //     END ELSE BEGIN
    //         Payments.INIT;
    //         Payments."Payment Type" := Payments."payment type"::"Payment Voucher";
    //         Payments."Account Type" := Payments."account type"::Customer;
    //         Payments.Budgeted := true;
    //         Payments."PV Type" := Payments."PV Type"::Normal;
    //         Payments."Strategic Plan" := WorkplanMgt.GetCurrentCorporateStrategy();
    //         Payments."Reporting Year Code" := WorkplanMgt.GetCurrentStrategyImplementationYear(Payments."Strategic Plan");
    //         Payments."Pay Mode" := PayMode.GetDefaultPayMode();
    //         Payments.Validate("Shortcut Dimension 1 Code", Employee."Global Dimension 1 Code");
    //         Payments.Validate("Shortcut Dimension 2 Code", adminUnit);
    //         DefaultDimensionRec.GetDimensionCodes(DefaultDimensionRec."Document Type"::"Payment Voucher", DefaultDimensions);
    //         //Update Dimensions
    //         DimMgt.GetShortcutDimensions(Payments."Dimension Set ID", CurrDimensions);
    //         Payments."Dimension Set ID" := PayPost.AggregateDimensions(CurrDimensions, DefaultDimensions, CurrDimensions);
    //         Payments."Shortcut Dimension 1 Code" := CurrDimensions[1];
    //         Payments."Shortcut Dimension 2 Code" := CurrDimensions[2];
    //         Payments."Shortcut Dimension 3 Code" := CurrDimensions[3];
    //         Payments."Shortcut Dimension 4 Code" := CurrDimensions[4];
    //         Payments."Shortcut Dimension 5 Code" := CurrDimensions[5];
    //         Payments."Shortcut Dimension 6 Code" := CurrDimensions[6];
    //         Payments."Paying Bank Account" := Payments.GetBankAccount();
    //         Payments.Validate("Paying Bank Account");
    //         ReturnV := NoSeriesMgt.GetNextNo(CashMgt."PV Nos", 0D, true);
    //         Payments."No." := ReturnV;
    //         //Payments."Account Type" := Payments."Account Type"::Employee;
    //         Payments."Payment Narration" := narration;
    //         Payments.Date := Today;
    //         Payments."Posting Date" := Today;
    //         Payments."Created By" := Employee."User ID";
    //         IF Payments.INSERT(TRUE) THEN BEGIN
    //             exit(ReturnV);
    //         END;
    //     END;
    // end;

    // procedure createPaymentVoucherLines(docNo: Text; accountNo: Code[50]; applieToDocNo: Integer; type: Code[20]; amount: Decimal)
    // var
    //     PVLines: Record "PV Lines";
    //     id: Integer;
    // begin
    //     PVLines.Reset();
    //     PVLines.SetRange(No, docNo);
    //     if PVLines.FindLast() then
    //         id := PVLines."Line No" + 1
    //     else
    //         id := 1;
    //     PVLines.Init;
    //     PVLines.No := docNo;
    //     PVLines."Line No" := id;
    //     PVLines.validate(Type, type);
    //     PVLines.Validate("Account No", accountNo);
    //     PVLines.Validate(Amount, amount);
    //     PVLines.lookupAppliestoDocNoApi(applieToDocNo);
    //     PVLines.Insert(true);
    // end;

    // procedure editPaymentVoucherLines(docNo: Text; id: Integer; expenditure: Code[50]; accountType: integer; accountNo: Code[50]; applieToDocNo: Code[50])
    // begin
    //     PVLines.RESET;
    //     PVLines.SETRANGE(No, docNo);
    //     PVLines.SETRANGE("Line No", id);
    //     IF PVLines.FINDSET THEN BEGIN
    //         PVLines.Type := expenditure;
    //         PVLines.VALIDATE(Type);
    //         PvLines."Account Type" := accountType;
    //         PVLines.VALIDATE("Account Type");
    //         PvLines."Account No" := accountNo;
    //         PvLines.VALIDATE("Account No");
    //         PvLines."Applies to Doc. No" := applieToDocNo;
    //         PvLines.VALIDATE("Applies to Doc. No");
    //         PVLines.MODIFY(TRUE);
    //     end
    // end;

    // procedure fnSendPaymentVoucherApproval(employeeNo: Code[50]; DocNumber: Code[50])
    // var
    //     tbl_payments: Record Payments;
    //     CustomApproval: Codeunit "Custom Approvals Codeunit";
    //     Var_Variant: Variant;
    // begin
    //     tbl_payments.Reset();
    //     tbl_payments.SetRange("No.", DocNumber);
    //     tbl_payments.SetRange("Account No.", employeeNo);
    //     tbl_payments.SetRange(Status, tbl_payments.status::Open);
    //     if tbl_payments.FindSet(true) then begin
    //         Var_Variant := tbl_payments;
    //         if CustomApproval.CheckApprovalsWorkflowEnabled(Var_Variant) then
    //             CustomApproval.OnSendDocForApproval(Var_Variant);
    //     end
    // end;

    // procedure fnCancelPaymentVoucherApproval(employeeNo: Code[50]; DocNumber: Code[50]) status: Text
    // var
    //     tbl_payments: Record Payments;
    //     CustomApproval: Codeunit "Custom Approvals Codeunit";
    //     Var_Variant: Variant;
    // begin
    //     tbl_payments.Reset();
    //     tbl_payments.SetRange("No.", DocNumber);
    //     tbl_payments.SetRange("Account No.", employeeNo);
    //     tbl_payments.SetRange(Status, tbl_payments.status::"Pending Approval");
    //     if tbl_payments.FindSet(true) then begin
    //         Var_Variant := tbl_payments;
    //         CustomApproval.OnCancelDocApprovalRequest(Var_Variant);
    //         status := 'success*Your approval request was successfully cancelled';
    //     end else begin
    //         status := 'danger* You could not cancel for approval. Either it is not open, or your are not the requestor.';
    //     end;



    // end;


    procedure GenerateRandomOTPCode(CodeLength: Integer): Text
    var
        OTP: Text;
        Characters: Text;
        RandomIndex: Integer;
        I: Integer;
    begin
        Characters := '0123456789';//'ABCDEFGHJKMNPQRSTUVWXYabcdefghjkmnpqrstuvwxy3456789';
        OTP := '';

        // Ensure CodeLength is positive
        if CodeLength <= 0 then
            Error('Code length must be greater than zero.');

        // Initialize the random number generator
        Randomize;

        // Generate the OTP code
        for I := 1 to CodeLength do begin
            RandomIndex := Random(StrLen(Characters));
            OTP := OTP + CopyStr(Characters, RandomIndex, 1);
        end;

        exit(OTP);
    end;

    // procedure GeneratePortalOTPCode(EmpNo: Text)
    // var
    //     otp: Text;
    // begin
    //     HrSetup.Get();
    //     HrEmp.Reset();
    //     HrEmp.Setrange(HrEmp."No.", EmpNo);
    //     if HrEmp.find('-') then begin
    //         otp := GenerateRandomOTPCode(5);
    //         HrEmp."OTP Code" := otp;
    //         HrEmp."OTP Code Expiration" := CurrentDateTime + HrSetup."OTP Timeout";
    //         HrEmp.modify(false);
    //         if HREmp."Phone No." <> '' then
    //             SMS.SendSMS('254' + DelChr(HREmp."Phone No.", '<', '0'),
    //             'ESS Login OTP is ' + otp
    //             );
    //     end;
    // end;

    // procedure GeneratePortalEmailOTPCode(EmpNo: Text)
    // var
    //     otp: Text;
    // begin
    //     HrSetup.Get();
    //     HrEmp.Reset();
    //     HrEmp.Setrange(HrEmp."No.", EmpNo);
    //     if HrEmp.find('-') then begin
    //         otp := GenerateRandomOTPCode(5);
    //         HrEmp."OTP Code" := otp;
    //         HrEmp."OTP Code Expiration" := CurrentDateTime + HrSetup."OTP Timeout";
    //         HrEmp.modify(false);
    //         if HREmp."Company E-mail" <> '' then
    //             SendEmail(HREmp."Company E-Mail", 'ESS Login OTP', 'ESS Login OTP is ' + otp);

    //     end;
    // end;



    // procedure ReturnPortalOTPCode(EmpNo: Text; OTP: Text) Success: Boolean
    // begin
    //     HrEmp.Reset();
    //     HrEmp.setrange("No.", EmpNo);
    //     HrEmp.setrange("OTP Code", OTP);
    //     if HrEmp.find('-') then
    //         if CurrentDateTime < HrEmp."OTP Code Expiration" then
    //             Success := true;
    // end;

    // procedure ReturnOTPExpiration(EmpNo: Text; OTP: Text) ExpirationDate: DateTime
    // begin
    //     HrEmp.Reset();
    //     HrEmp.setrange("No.", EmpNo);
    //     HrEmp.setrange("OTP Code", OTP);
    //     //HrEmp.Setfilter("OTP Code Expiration", '<%1', CurrentDateTime + HrSetup."OTP Timeout");
    //     if HrEmp.find('-') then
    //         ExpirationDate := HrEmp."OTP Code Expiration";

    // end;


    procedure insertAppointmentComittee(docType: Option; docDate: Date; Desc: Text;
  AppEffectiveDate: Date; endDate: Date; Venue: Text; brief: Text): Code[20];
    var
        commiteeRec: Record "Commitee Appointment Voucher";
        HumanResourcesSetup: Record "Human Resources Setup";
        DocNo: Code[20];

    begin
        HumanResourcesSetup.get();
        DocNo := NoSeriesMgt.GetNextNo(HumanResourcesSetup."Committee Terminate Nos.", 0D, true);
        commiteeRec.init();
        commiteeRec."Document No." := DocNo;
        commiteeRec."Document Type" := docType;


        commiteeRec."Document Date" := docDate;
        commiteeRec.Description := Desc;
        commiteeRec."Appointment Effective Date" := AppEffectiveDate;
        commiteeRec."Tenure End Date" := endDate;
        commiteeRec.Venue := Venue;
        commiteeRec."Additional Brief" := brief;
        if commiteeRec.Insert() then
            exit(commiteeRec."Document No.")
        else
            exit('');

    end;


    procedure CreateAppointmentLines(DocNo: Code[20]; DocType: Option; memberNo: Code[30]; MemberRole: Option): Code[20];
    var
        commiteeLines: Record "Commitee Appointed Member";
    begin
        commiteeLines.Init();
        commiteeLines."Document No." := DocNo;
        commiteeLines."Member No." := memberNo;
        commiteeLines.Role := MemberRole;
        commiteeLines."Document Type" := DocType;

        if commiteeLines.Insert() then
            exit(commiteeLines."Document No.")
        else
            exit('');
    end;



    procedure UpdateAppointmentComittee(DocNo: Code[20]; docType: Option; docDate: Date; Desc: Text;
           AppEffectiveDate: Date; endDate: Date; Venue: Text; brief: Text): Code[20];
    var
        commiteeRec: Record "Commitee Appointment Voucher";
    begin
        commiteeRec.reset();
        commiteeRec.setRange("Document No.", DocNo);
        if commiteeRec.FindFirst() then begin
            commiteeRec."Document Date" := docDate;
            commiteeRec."Document Type" := docType;
            commiteeRec.Description := Desc;
            commiteeRec."Appointment Effective Date" := AppEffectiveDate;
            commiteeRec."Tenure End Date" := endDate;
            commiteeRec.Venue := Venue;
            commiteeRec."Additional Brief" := brief;
            if commiteeRec.Modify() then
                exit(commiteeRec."Document No.")
            else
                exit('');
        end



    end;


    procedure UpdateAppointmentLines(DocNo: Code[20]; LineNo: Integer; memberNo: Code[30]; MemberRole: Option): Code[20];
    var
        commiteeLines: Record "Commitee Appointed Member";
    begin
        commiteeLines.SetRange("Document No.", DocNo);
        commiteeLines.SetRange("Line No", LineNo);

        if commiteeLines.FindFirst() then begin
            commiteeLines."Member No." := memberNo;
            commiteeLines.Role := MemberRole;

            if commiteeLines.Modify() then
                exit(commiteeLines."Document No.")
            else
                exit('');
        end
        else
            exit('');
    end;

    procedure InsertPMMUHeader(Strategy: Code[20]; Desc: Text; PmmuH: code[30]; EmploNumb: code[30]; targetCommitee: Code[20]; evaluationCommitee: Code[20]; createdBy: Text[100]; populateActivities: Option) DocNumber: Code[20]
    var
        myInt: Integer;
        Pmmu: Record "Perfomance Contract Header";
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DocNo: Code[30];
        Employee: Record Employee;
    begin
        SPMSetup.Get;
        Pmmu.Reset();
        Pmmu.Init();
        DocNo := NoSeriesMgt.GetNextNo(SPMSetup."Individual Scorecard Nos", 0D, true);
        Pmmu.No := DocNo;
        Pmmu."Strategy Plan ID" := Strategy;
        Pmmu.Validate(Pmmu."Strategy Plan ID");
        Pmmu.Description := Desc;
        if PmmuH <> '' then begin
            Pmmu."Department/Center PC ID" := PmmuH;
            Pmmu."Document Type" := Pmmu."Document Type"::"Individual Scorecard";
            Pmmu."Score Card Type" := Pmmu."Score Card Type"::Staff;
            Pmmu.Validate(Pmmu."Department/Center PC ID");
        end else begin
            Pmmu."Document Type" := Pmmu."Document Type"::"Individual Scorecard";
            Pmmu."Score Card Type" := Pmmu."Score Card Type"::Directors;
        end;
        // Pmmu."Responsibility Center" := ImplimentingUn;
        // Pmmu.Validate(Pmmu."Responsibility Center");
        Pmmu."Responsible Employee No." := EmploNumb;
        pmmu.validate("Responsible Employee No.");
        Pmmu."Target Setting Commitee" := targetCommitee;
        Pmmu."Evaluation Commitee" := evaluationCommitee;
        Pmmu."Created By" := createdBy;
        Pmmu."Populate Activities From" := populateActivities;
        Pmmu.Insert(false);
        DocNumber := DocNo;
        exit(DocNumber);
    end;

    procedure UpdatePMMUHeader(DocNo: Code[20]; Strategy: Code[20]; Desc: Text; PmmuH: code[30]; EmploNumb: code[30]; targetCommitee: Code[20]; evaluationCommitee: Code[20]) DocNumber: Code[20]
    var
        myInt: Integer;
        Pmmu: Record "Perfomance Contract Header";
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
    begin
        Pmmu.Reset();
        Pmmu.setRange(No, DocNo);
        IF Pmmu.FindFirst() then begin
            Pmmu."Strategy Plan ID" := Strategy;
            Pmmu.Validate(Pmmu."Strategy Plan ID");
            Pmmu.Description := Desc;
            if PmmuH <> '' then begin
                Pmmu."Department/Center PC ID" := PmmuH;
                Pmmu."Document Type" := Pmmu."Document Type"::"Individual Scorecard";
                Pmmu."Score Card Type" := Pmmu."Score Card Type"::Staff;
                Pmmu.Validate(Pmmu."Department/Center PC ID");
            end else begin
                Pmmu."Document Type" := Pmmu."Document Type"::"Individual Scorecard";
                Pmmu."Score Card Type" := Pmmu."Score Card Type"::Directors;
            end;
            // Pmmu."Responsibility Center" := ImplimentingUn;
            Pmmu."Target Setting Commitee" := targetCommitee;
            Pmmu."Evaluation Commitee" := evaluationCommitee;
            // Pmmu.Validate(Pmmu."Responsibility Center");
            Pmmu."Responsible Employee No." := EmploNumb;
            pmmu.validate(Pmmu."Responsible Employee No.");
            Pmmu.Modify();
        end


    end;

    Procedure InsertPmmuLines(DocNumber: Code[40]; STajPlan: Code[40]; Quantity: array[4] of Decimal; Outcome: Code[30]; Strategies: Code[30];
     StrategyOutput: Code[40]; UnitofMeasure: Code[40];
     BaselineTarget: Code[100]; StrategicOb: Code[30];
     Perspective: Code[30];
     Comments: Text) LastLineNo: integer;

    var
        Pmmu: Record "Perfomance Contract Header";
        PMMUActivities: Record "PMMU Activities";
        PMMUOutputActivities: Record "PMMU Output Activities";
    // LastLineNo: Integer;

    begin
        Pmmu.Reset();
        Pmmu.SetRange(Pmmu.No, DocNumber);
        Pmmu.SetRange("Strategy Plan ID", STajPlan);

        if Pmmu.FindFirst() then begin
            PMMUActivities.Reset();
            if PMMUActivities.FindLast() then
                LastLineNo := PMMUActivities."Entry No." + 1000
            else
                LastLineNo := 1000;


            PMMUActivities.Init();
            PMMUActivities."Entry No." := LastLineNo;
            PMMUActivities."Strategy Plan ID" := STajPlan;
            PMMUActivities."Contract No." := DocNumber;
            PMMUActivities.Validate(PMMUActivities."Strategy Plan ID");
            PMMUActivities.Outcome := Outcome;
            PMMUActivities.Validate(PMMUActivities.Outcome);
            PMMUActivities."Strategic Objective" := StrategicOb;
            PMMUActivities.Validate(PMMUActivities."Strategic Objective");
            PMMUActivities.Strategies := Strategies;
            PMMUActivities.Validate(PMMUActivities.Strategies);
            PMMUActivities.Perspectives := Perspective;
            PMMUActivities.Validate(PMMUActivities.Perspectives);
            PMMUActivities."Strategy Output Code" := StrategyOutput;
            PMMUActivities.Validate(PMMUActivities."Strategy Output Code");
            PMMUActivities.Weight := Quantity[1];
            PMMUActivities.Score := Quantity[2];
            PMMUActivities."Achieved Target" := Quantity[3];
            PMMUActivities.Target := Quantity[4];
            PMMUActivities."Baseline Target" := BaselineTarget;
            PMMUActivities."Unit of Measure" := UnitofMeasure;
            PMMUActivities.Comments := Comments;
            PMMUActivities.Insert();
            exit(LastLineNo);

        end;

    end;







    // procedure GetUserSignature(StaffUserID: Text) BaseImage: Text
    // var
    //     ToFile: Text;
    //     IStream: InStream;
    //     //Bytes: dotnet Array;
    //     //Convert: dotnet Convert;
    //     //MemoryStream: dotnet MemoryStream;
    //     TenantMedia: Record "Tenant Media";
    //     Index: Integer;
    //     imageID: GUID;
    //     "Employee Card": Record Employee;
    // begin
    //     UserSetup.Reset();
    //     UserSetup.SetRange(UserSetup."User ID", StaffUserID);
    //     if UserSetup.Find('-') then begin
    //         if UserSetup."User Signature".Hasvalue then begin
    //             // imageID := UserSetup."User Signature".CreateInStream(IStream);;
    //             // IF TenantMedia.GET(imageID) THEN BEGIN
    //             //     TenantMedia.CALCFIELDS(Content);
    //             //     TenantMedia.Content.CreateInstream(IStream);
    //             UserSetup.CALCFIELDS("User Signature");
    //             UserSetup."User Signature".CreateInStream(IStream);
    //             MemoryStream := MemoryStream.MemoryStream();
    //             CopyStream(MemoryStream, IStream);
    //             Bytes := MemoryStream.GetBuffer();
    //             BaseImage := Convert.ToBase64String(Bytes);
    //             // END;
    //         end;
    //     end;
    // end;

    // procedure UploadApprovalQRDocument(ApproverId: Text; DocNo: Code[20]; FileName: Text[2000]; QRCodeBase64: BigText; TableID: Integer)
    // var
    //     FromRecRef: RecordRef;
    //     FileManagement: Codeunit "File Management";
    //     //Bytes: dotnet Array;
    //     //Convert: dotnet Convert;
    //     //MemoryStream: dotnet MemoryStream;
    //     Ostream: OutStream;
    // begin
    //     ApprovalEntry.Reset();
    //     ApprovalEntry.SetRange("Document No.", DocNo);
    //     ApprovalEntry.SetRange("Approver ID", ApproverId);
    //     ApprovalEntry.SetRange("Table ID", TableID);
    //     // ApprovalEntry.SetFilter(Status, '=%1', ApprovalEntry.Status::Open);
    //     if ApprovalEntry.Find('-') then begin
    //         Bytes := Convert.FromBase64String(QRCodeBase64);
    //         MemoryStream := MemoryStream.MemoryStream(Bytes);
    //         ApprovalEntry."Approval QR Code".ImportStream(MemoryStream, '', FileName);
    //         ApprovalEntry.modify(false);
    //     end;
    // end;

    procedure insertInputs(WrkCode: code[20]; KRAID: Code[20]; CoreStrategyID: Code[20]; StrategyID: Code[20]; ActivityId: Code[20]; Input: Text[100]; EntryNo: Integer): Boolean
    var
        Inputs: Record "SubWorkPlan Activity Inputs";
        Entry: Integer;
    begin
        if EntryNo = 0 then begin
            Inputs.Reset();
            Inputs.SetCurrentKey("Line No.");
            if Inputs.FindLast() then
                Entry := Inputs."Line No." + 1;
        end else
            Entry := EntryNo;

        Inputs.Init();
        Inputs."Workplan No." := WrkCode;
        Inputs."KRA ID" := KRAID;
        Inputs."Core Strategy ID" := CorestrategyID;
        Inputs."Strategy ID" := StrategyID;
        Inputs."Activity ID" := ActivityId;
        Inputs.Validate(Inputs."Activity ID");
        Inputs.Description := Input;
        Inputs."Line No." := Entry;
        if not Inputs.Insert(true) then Inputs.Modify();
        exit(true);
    end;

    procedure insertBudgetAmounts(WrkCode: code[20]; KRAID: Code[20]; CoreStrategyID: Code[20]; StrategyID: Code[20]; ActivityId: Code[20]; InputLineNo: Integer;
                                            BudgetItem: Code[20]; DimensionCodes: array[8] of Code[20]): Boolean
    var
        WorkplanBudgets: Record "Workplan Budget Line";
    begin
        WorkplanBudgets.Init();
        WorkplanBudgets."Strategy Plan ID" := WrkCode;
        WorkplanBudgets."KRA ID" := KRAID;
        WorkplanBudgets."Core Strategy ID" := CoreStrategyID;
        WorkplanBudgets."Strategy ID" := StrategyID;
        WorkplanBudgets."Activity ID" := ActivityId;
        WorkplanBudgets."Input Line No." := InputLineNo;
        WorkplanBudgets."Budget Item" := BudgetItem;
        WorkplanBudgets.Validate("Budget Item");
        WorkplanBudgets."Shortcut Dimension 3 Code" := DimensionCodes[3];
        WorkplanBudgets."Shortcut Dimension 4 Code" := DimensionCodes[4];
        WorkplanBudgets."Shortcut Dimension 5 Code" := DimensionCodes[5];
        WorkplanBudgets."Shortcut Dimension 6 Code" := DimensionCodes[6];
        If WorkplanBudgets.Insert() then
            exit(true)
        else
            WorkplanBudgets.Modify();
        exit(true);
    end;

    procedure insertWorkings(WrkCode: code[20]; KRAID: Code[20]; CoreStrategyID: Code[20]; StrategyID: Code[20]; ActivityId: Code[20]; InputLineNo: Integer;
                                   BudgetItem: Code[20]; Quantity: array[4] of Decimal; UnitAmount: array[4] of Decimal; Type: Integer; ItemType: Integer; ItemNo: Code[30]; UnitCost: Decimal; EntryNo: Integer): Boolean
    var
        Workings: Record "Workplan Workings";

    begin
        if EntryNo = 0 then begin
            Workings.Reset();
            Workings.SetCurrentKey("Entry No");
            if Workings.FindLast() then
                EntryNo := Workings."Entry No" + 1;
        end;

        Workings.Init();
        Workings."Strategy Plan ID" := WrkCode;
        Workings."KRA ID" := KRAID;
        Workings."Core Strategy ID" := CoreStrategyID;
        Workings."Strategy ID" := StrategyID;
        Workings."Activity ID" := ActivityId;
        Workings."Input Line No." := InputLineNo;
        Workings."Budget Item" := BudgetItem;
        Workings."Entry No" := EntryNo;
        Workings.Type := Type;
        Workings.Validate("Type");
        Workings."Item Type" := ItemType;
        Workings."Item No" := ItemNo;
        Workings.Validate("Item No");
        Workings."Unit Cost" := UnitCost;
        Workings."Q1 Quantity" := Quantity[1];
        Workings.Validate("Q1 Quantity");
        Workings."Q2 Quantity" := Quantity[2];
        Workings.Validate("Q2 Quantity");
        Workings."Q3 Quantity" := Quantity[3];
        Workings.Validate("Q3 Quantity");
        Workings."Q4 Quantity" := Quantity[4];
        Workings.Validate("Q4 Quantity");
        if UnitAmount[1] <> 0 then
            Workings."Q1 Amount" := UnitAmount[1];
        if UnitAmount[2] <> 0 then
            Workings."Q2 Amount" := UnitAmount[2];
        if UnitAmount[3] <> 0 then
            Workings."Q3 Amount" := UnitAmount[3];
        if UnitAmount[4] <> 0 then
            Workings."Q4 Amount" := UnitAmount[4];
        If Workings.Insert() then begin
            Workings.UpdateBudgetLine();
            exit(true);
        end
        else begin
            Workings.Modify();
            Workings.UpdateBudgetLine();
            exit(true);
        end;

    end;

    procedure insertPlanEntries(ItemNum: code[20]; PItemType: Option; "AGbo %": array[4] of Decimal; ProcMethods: Option; Quantity: array[4] of Decimal; Dimesion: array[6] of Code[40]; UnitAmount: array[4] of Decimal; UnitCost: Decimal): Boolean
    var
        PlanEntries: Record "Procurement Plan Entry";
        EntryNo: Integer;
    begin
        PlanEntries.Reset();
        PlanEntries.SetCurrentKey("Entry No.");
        if PlanEntries.FindLast() then
            EntryNo := PlanEntries."Entry No." + 1;

        PlanEntries.Init();
        PlanEntries."Procurement Method" := ProcMethods;
        PlanEntries."Plan Item No" := ItemNum;
        PlanEntries."Plan Item Type" := PItemType;
        PlanEntries."AGPO %" := "AGbo %"[1];
        PlanEntries.Validate(PlanEntries."AGPO %");
        PlanEntries."Youth %" := "AGbo %"[2];
        PlanEntries.Validate(PlanEntries."Youth %");
        PlanEntries."PWD %" := "AGbo %"[3];
        PlanEntries.Validate(PlanEntries."PWD %");
        PlanEntries."Women %" := "AGbo %"[4];
        PlanEntries.Validate(PlanEntries."Women %");
        PlanEntries."Entry No." := EntryNo;
        PlanEntries."Unit Cost" := UnitCost;
        PlanEntries."Global Dimension 1 Code" := Dimesion[1];
        PlanEntries.Validate(PlanEntries."Global Dimension 1 Code");
        PlanEntries."Global Dimension 1 Code" := Dimesion[2];
        PlanEntries.Validate(PlanEntries."Global Dimension 2 Code");
        PlanEntries."Shortcut Dimension 3 Code" := Dimesion[3];
        PlanEntries.Validate(PlanEntries."Shortcut Dimension 3 Code");
        PlanEntries."Shortcut Dimension 4 Code" := Dimesion[4];
        PlanEntries.Validate(PlanEntries."Shortcut Dimension 4 Code");
        PlanEntries."Shortcut Dimension 5 Code" := Dimesion[5];
        PlanEntries.Validate(PlanEntries."Shortcut Dimension 5 Code");
        PlanEntries."Shortcut Dimension 6 Code" := Dimesion[6];
        PlanEntries.Validate(PlanEntries."Shortcut Dimension 6 Code");
        PlanEntries."Q1 Quantity" := Quantity[1];
        PlanEntries.Validate("Q1 Quantity");
        PlanEntries."Q2 Quantity" := Quantity[2];
        PlanEntries.Validate("Q2 Quantity");
        PlanEntries."Q3 Quantity" := Quantity[3];
        PlanEntries.Validate("Q3 Quantity");
        PlanEntries."Q4 Quantity" := Quantity[4];
        PlanEntries.Validate("Q4 Quantity");
        PlanEntries."Q1 Amount" := UnitAmount[1];
        PlanEntries."Q2 Amount" := UnitAmount[2];
        PlanEntries."Q3 Amount" := UnitAmount[3];
        PlanEntries."Q4 Amount" := UnitAmount[4];
        If PlanEntries.Insert() then
            exit(true)
        else
            PlanEntries.Modify();
        exit(true);
    end;


    Procedure UpdateMobilityRecommendations(DocNo: Text; HOSRecommendation: Text; HOSRemarks: Text; MobilityRemarks: Text; HODRecommendation: Text; DirectorRecommendation: Text)
    begin
        Mobility.Reset();
        // Mobility.SetRange("Employee No", EmployeeNo);
        Mobility.SetRange("Document No", DocNo);
        if Mobility.Find('-') then begin
            Mobility."Professional Opinion" := HOSRecommendation;
            Mobility."Current HOS Remarks" := HOSRemarks;
            Mobility."Mobility Recommendation" := MobilityRemarks;
            Mobility."HOD Mobility Recommendation" := HODRecommendation;
            Mobility."HOD HR Recommendation" := DirectorRecommendation;
            Mobility.modify();
        end;
    end;

    procedure FunctionalCancellApprovalRequest(DocNo: code[30])
    var
        myInt: Integer;
        AnnualStrategy: Record "Annual Strategy Workplan";
        VarVariant: Variant;
        ApprovalMgt: Codeunit "Custom Approvals Codeunit";
    begin
        AnnualStrategy.Reset();
        AnnualStrategy.SetRange(No, DocNo);
        if AnnualStrategy.FindFirst() then begin
            VarVariant := AnnualStrategy;
            ApprovalMgt.RunWorkflowOnCancelApprovalRequest(VarVariant);
        end;

    end;

    procedure SuggestTechnicalPassedBids(DocNo: Code[30]): text
    var
        myInt: Integer;
        Bidregister: Record "Bid Evaluation Register";
        Procurement: Codeunit "Procurement Processing";
    begin
        Bidregister.reset;
        Bidregister.SetRange(Code, DocNo);
        if Bidregister.FindFirst() then begin
            Procurement.SuggestFinanceBids(Bidregister);
            exit('Success');
        end else
            exit('Failed')
    end;

    procedure InsertBidfinancialEvaluationRegister(IFsCode: Code[30]; AwardType: Option; CreatedBy: Text) DocNo: code[30]
    var
        myInt: Integer;
        BidEvaluation: record "Bid Evaluation Register";
        ProcurementSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        ProcurementSetup.Get();
        ProcurementSetup.TestField("Bid Opening Nos");
        DocNo := NoSeriesMgt.GetNextNo(ProcurementSetup."Bid Opening Nos", 0D, true);
        BidEvaluation.Init();
        BidEvaluation.Code := DocNo;
        BidEvaluation."IFS Code" := IFsCode;
        BidEvaluation.Validate(BidEvaluation."IFS Code");
        BidEvaluation."Evaluator Category" := BidEvaluation."Evaluator Category"::"Evaluation Committee";
        BidEvaluation."Evaluation Type" := BidEvaluation."Evaluation Type"::"Financial Evaluation";
        BidEvaluation."Award Type" := AwardType;
        BidEvaluation."Created By" := CreatedBy;
        if BidEvaluation.Insert() then
            exit(DocNo);

    end;

    procedure PosTechnicalEvaluation(DocNum: code[40]; loggedInUser: code[20])
    var
        myInt: Integer;
        BidEvalution: record "Bid Evaluation Register";
        Procurement: Codeunit "Procurement Processing";
    begin
        BidEvalution.reset;
        BidEvalution.SetRange(Code, DocNum);
        if BidEvalution.FindFirst() then
            Procurement.PosTechnicalEvaluation(BidEvalution, loggedInUser);
    end;

    procedure PostPreliminaryEvaluation(DocNum: code[40]; loggedInUser: Code[20])
    var
        myInt: Integer;
        BidEvalution: record "Bid Evaluation Register";
        Procurement: Codeunit "Procurement Processing";
    begin
        BidEvalution.reset;
        BidEvalution.SetRange(Code, DocNum);
        if BidEvalution.FindFirst() then
            Procurement.PostPreliminaryEvaluation(BidEvalution, loggedInUser);
    end;

    procedure PosFinanceEvaluation(DocNum: code[40]; loggedInUser: Code[20])
    var
        myInt: Integer;
        BidEvalution: record "Bid Evaluation Register";
        Procurement: Codeunit "Procurement Processing";
    begin
        BidEvalution.reset;
        BidEvalution.SetRange(Code, DocNum);
        if BidEvalution.FindFirst() then
            Procurement.PosFinanceEvaluation(BidEvalution, loggedInUser);
    end;

    procedure ModifyEvaluationBidRemarks(DocNo: Code[30]; EvaluationRemark: text; EvaluatioDecision: Option; EvaluationType: Option; preEvalScore: Option): Text
    var
        myInt: Integer;
        BidRegister: Record "Bid Evaluation Register";
    begin
        BidRegister.Reset();
        BidRegister.SetRange(Code, DocNo);
        if BidRegister.FindFirst() then begin
            BidRegister."Technical Evaluation  Decision" := EvaluatioDecision;
            BidRegister."Tender Evaluation Comm Remarks" := EvaluationRemark;
            BidRegister."Evaluation Type" := EvaluationType;
            BidRegister."Preliminary Evaluation Score" := preEvalScore;
            BidRegister.Modify();
        end;

    end;

    procedure BidfinancialEvaluationsRankings(DocNo: code[30]; MarketValu: Decimal; EvaluationCommiteeRemark: Text; EvalutionReco: Option; Ranking: code[100])
    var
        myInt: Integer;
        Rankings: record "Finance Evaluation Line";
    begin
        Rankings.Reset();
        Rankings.SetRange("Document ID", DocNo);
        if Rankings.FindFirst() then begin
            Rankings."Market Price" := MarketValu;
            Rankings."Evaluation Committee Recomm" := EvalutionReco;
            Rankings."Evaluation Committee Remarks" := EvaluationCommiteeRemark;
            Rankings."Tech Evaluation Ranking" := Ranking;
            Rankings.Modify();
        end;

    end;

    procedure BidScoreEvaluationEntry(DocNo: Code[30]; LIneNu: Integer; Findings: code[50]; Remarks: Text): Text
    var
        myInt: Integer;
        BidsScore: Record "Bid Evaluation Score Entry";
    begin
        BidsScore.Reset();
        BidsScore.SetRange(Code, DocNo);
        BidsScore.SetRange("Line No", LIneNu);
        if BidsScore.FindFirst() then begin
            BidsScore."Response Value" := Findings;
            BidsScore.validate(BidsScore."Response Value");
            BidsScore.Remarks := Remarks;
            BidsScore.Modify();
        end;
    end;

    procedure InsertBidTechnicalEvaluationRegister(IFsCode: Code[30]; PreliminaryBid: code[30]; EvaluationDate: date; CreatedBy: text[100]; EvaluatorCat: Option) DocNo: code[30]
    var
        myInt: Integer;
        BidEvaluation: record "Bid Evaluation Register";
        ProcurementSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        ProcurementSetup.Get();
        ProcurementSetup.TestField("Bid Opening Nos");
        DocNo := NoSeriesMgt.GetNextNo(ProcurementSetup."Bid Opening Nos", 0D, true);
        BidEvaluation.Init();
        BidEvaluation.Code := DocNo;
        BidEvaluation."Evaluation Date" := EvaluationDate;
        BidEvaluation."Evaluator Category" := EvaluatorCat;
        BidEvaluation."Evaluation Type" := BidEvaluation."Evaluation Type"::"Technical Evaluation";
        BidEvaluation."IFS Code" := IFsCode;
        BidEvaluation."Created by" := CreatedBy;
        BidEvaluation.Validate(BidEvaluation."IFS Code");
        BidEvaluation."Preliminary Evaluation No" := PreliminaryBid;
        BidEvaluation.Validate(BidEvaluation."Preliminary Evaluation No");
        if BidEvaluation.Insert() then
            exit(DocNo);
    end;

    procedure InsertBidPreliminaryEvaluationRegister(IFsCode: Code[30]; BidNo: code[30]; EvaluationDate: date; CreatedBy: text[100]; EvaluatorCate: Option) DocNo: code[30]
    var
        myInt: Integer;
        BidEvaluation: record "Bid Evaluation Register";
        ProcurementSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        ProcurementSetup.Get();
        ProcurementSetup.TestField("Bid Opening Nos");
        DocNo := NoSeriesMgt.GetNextNo(ProcurementSetup."Bid Opening Nos", 0D, true);
        BidEvaluation.Init();
        BidEvaluation.Code := DocNo;
        BidEvaluation."IFS Code" := IFsCode;
        BidEvaluation.Validate(BidEvaluation."IFS Code");
        BidEvaluation."Bid No." := BidNo;
        BidEvaluation."Created by" := CreatedBy;
        BidEvaluation.Validate(BidEvaluation."Bid No.");
        BidEvaluation."Evaluation Date" := EvaluationDate;
        BidEvaluation."Evaluator Category" := EvaluatorCate;
        BidEvaluation."Evaluation Type" := BidEvaluation."Evaluation Type"::"Preliminary Evaluation";
        if BidEvaluation.Insert() then
            exit(DocNo);

    end;

    procedure InsertLeaveRecall(LeaveNo: Text; RecalledDays: Decimal; RecalledDate: Date; RecallReason: Text) DocNo: Text
    begin
        HRSetup.Get();
        HRSetup.TestField("Leave Recall Nos");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Leave Recall Nos", 0D, true);
        leaveApplications.Get(LeaveNo);
        LeaveRecall.Init;
        LeaveRecall."Recall No" := DocNo;
        LeaveRecall.Validate("Employee No", leaveApplications."Employee No");
        LeaveRecall.Validate("Application No", leaveApplications."Application Code");
        LeaveRecall."Days Recalled" := RecalledDays;
        LeaveRecall.Validate("Recall Date From", RecalledDate);
        LeaveRecall."Reason for Recall" := RecallReason;
        LeaveRecall.Validate(Status, LeaveRecall.Status::Released);
        LeaveRecall.Insert;
    end;

    procedure FunctionalsendApprovalRequest(DocNo: Code[30])
    var
        myInt: Integer;
        VarVariant: Variant;
        ApprovalMgt: codeunit "Custom Approvals Codeunit";
        AnnualStragy: Record "Annual Strategy Workplan";
    begin
        AnnualStragy.Reset();
        AnnualStragy.SetRange(No, DocNo);
        if AnnualStragy.FindFirst() then begin
            VarVariant := AnnualStragy;
            ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant);
            ApprovalMgt.RunWorkflowOnSendApprovalRequest(VarVariant);
        end;

    end;

    procedure GeneratePASReport(DocumentNo: Code[20]) FileContentsB64: Text;
    var
        // AnnualWorkplan: Record "Workplan Budget Per Item";
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Perfomance: Record "Perfomance Contract Header";
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        ResponseObject: JsonObject;
    begin
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        Perfomance.Reset;
        Perfomance.SetRange(Perfomance.No, DocumentNo);
        if Perfomance.FindFirst() then begin
            RecRef.GetTable(Perfomance);
            Report.SaveAs(Report::"Performance Appraisal System", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);
        end;
    end;

    procedure GeneratePMMUReport(DocumentNo: Code[20]) FileContentsB64: Text;
    var
        // AnnualWorkplan: Record "Workplan Budget Per Item";
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Perfomance: Record "Perfomance Contract Header";
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        ResponseObject: JsonObject;
    begin
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        Perfomance.Reset;
        Perfomance.SetRange(Perfomance.No, DocumentNo);
        if Perfomance.FindFirst() then begin
            RecRef.GetTable(Perfomance);
            Report.SaveAs(Report::"PMMU Report", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);
        end;
    end;


    procedure GeneratePASEmpReport(adminUnit: Code[20]; DocStage: integer) FileContentsB64: Text;
    var
        // AnnualWorkplan: Record "Workplan Budget Per Item";
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Perfomance: Record "Perfomance Contract Header";
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        ResponseObject: JsonObject;
        DimensionValue: Record "Dimension Value";
    begin
        DimensionValue.reset();
        DimensionValue.setRange(Code, adminUnit);
        if DimensionValue.FindFirst() then begin
            TempBlob.CreateInStream(BlobInStream);
            TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
            Perfomance.Reset;
            Perfomance.SetRange(Perfomance."Admin unit", DimensionValue.Code);
            Perfomance.setRange("Document Stage", DocStage);
            if Perfomance.FindFirst() then begin
                RecRef.GetTable(Perfomance);
                // Report.SaveAs(Report::"PAS Report", '', ReportFormat::Pdf, BlobOutStream, RecRef);
                FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
                exit(FileContentsB64);
            end;
        end;
    end;

    procedure GenerateExpenseRequisition(DocumentNo: Code[20]) FileContentsB64: Text;
    var
        ExpenseRFQ: Record "Expense Requisition";
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        ResponseObject: JsonObject;
    begin
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        ExpenseRFQ.Reset;
        ExpenseRFQ.SetRange(ExpenseRFQ."No.", DocumentNo);
        if ExpenseRFQ.FindFirst() then begin
            RecRef.GetTable(ExpenseRFQ);
            // Report.SaveAs(Report::"Expense Requisition", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);
        end;
    end;

    procedure SendLeaveRecallApproval(employeeNo: Code[50]; DocNumber: Code[50])
    var

        CustomApproval: Codeunit "Custom Approvals Codeunit";
        Var_Variant: Variant;
    begin
        LeaveRecall.Reset();
        LeaveRecall.SetRange("Recall No", DocNumber);
        if LeaveRecall.Find('-') then begin
            Var_Variant := LeaveRecall;
            if CustomApproval.CheckApprovalsWorkflowEnabled(Var_Variant) then
                CustomApproval.OnSendDocForApproval(Var_Variant);
        end
    end;

    procedure CancelLeaveRecallApproval(employeeNo: Code[50]; DocNumber: Code[50]) status: Text
    var
        tbl_payments: Record Payments;
        CustomApproval: Codeunit "Custom Approvals Codeunit";
        Var_Variant: Variant;
    begin
        LeaveRecall.Reset();
        LeaveRecall.SetRange("Recall No", DocNumber);
        if LeaveRecall.Find('-') then begin
            Var_Variant := LeaveRecall;
            CustomApproval.OnCancelDocApprovalRequest(Var_Variant);
            status := 'success*Your approval request was successfully cancelled';
        end else begin
            status := 'danger* You could not cancel for approval. Either it is not open, or your are not the requestor.';
        end;

    end;

    procedure SendProcurementPlanApproval(DocNumber: Code[50])
    var

        CustomApproval: Codeunit "Custom Approvals Codeunit";
        Var_Variant: Variant;
        Proc_Plan: Record "Procurement Plan";
    begin
        Proc_Plan.Reset();
        Proc_Plan.SetRange("Code", DocNumber);
        if Proc_Plan.Find('-') then begin
            Var_Variant := Proc_Plan;
            if CustomApproval.CheckApprovalsWorkflowEnabled(Var_Variant) then
                CustomApproval.OnSendDocForApproval(Var_Variant);
        end
    end;


    procedure CancelProcurementPlanApproval(DocNumber: Code[50])
    var

        CustomApproval: Codeunit "Custom Approvals Codeunit";
        Var_Variant: Variant;
        Proc_Plan: Record "Procurement Plan";
    begin
        Proc_Plan.Reset();
        Proc_Plan.SetRange("Code", DocNumber);
        if Proc_Plan.Find('-') then begin
            Var_Variant := Proc_Plan;
            if Proc_Plan."Approval Status" = Proc_Plan."Approval Status"::"Pending Approval" then
                CustomApproval.OnCancelDocApprovalRequest(Var_Variant);
        end
    end;





    Procedure SendSMS(Phone: Code[20]; TextMessage: Text[200])
    Begin
        SMS.SendSMS('254' + DelChr(Phone, '<', '0'), TextMessage);
    End;

    Procedure GetNextApprover(DocNo: Text; TableID: Integer) ApproverID: Text
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Document No.", DocNo);
        ApprovalEntry.SetRange("Table ID", TableID);
        ApprovalEntry.SetFilter(Status, '=%1', ApprovalEntry.Status::Open);
        if ApprovalEntry.Find('-') then
            ApproverID := ApprovalEntry."Approver ID";
    end;

    procedure getCtsOrder(docId: Integer): Text
    var
        smsSetup: Record "SMS Setup";
        CourtOrderUrl: Text;
    begin
        smsSetup.get();
        smsSetup.TestField(smsSetup.CourtOrderUrl);
        CourtOrderUrl := smsSetup.CourtOrderUrl + Format(docId);
        exit(CourtOrderUrl)
    end;

    procedure validateBankAccount(accountNumber: Text; bankCode: Text): Text;
    var
        Client: HttpClient;
        JMessage: JsonObject;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        RequestHeader: HttpHeaders;
        ContentHeader: HttpHeaders;
        Res: Text;
        JResponse: JsonObject;
        JsonRes: JsonObject;
        Jtoken: JsonToken;
        Token: Text;
        RequestId: Guid;
        StatusCode: Text;
        valueJtoken: JsonToken;
        PayeeAccName: Text;
        LogMesssage: Text;
        EntryNo: Integer;
        LastLogNo: Integer; // Variable to hold last log number
        BankAccName: Text;


    begin
        Clear(Client);
        Clear(JMessage);
        Clear(Request);
        Clear(Content);
        Clear(RequestHeader);
        Clear(ContentHeader);
        Clear(Response);
        Clear(Res);
        Clear(JResponse);
        Clear(Token);
        Clear(Jtoken);
        Clear(JsonRes);
        Clear(StatusCode);
        Clear(valueJtoken);
        PayeeAccName := '';
        getUrls();
        Logs.Reset();
        if Logs.FindLast() then
            LastLogNo := Logs."Entry No"
        else
            LastLogNo := 0;

        Logs.Init();
        EntryNo := LastLogNo + 1; // Assign unique log number
        Logs."Entry No" := EntryNo;
        LastLogNo := EntryNo;
        RequestId := CreateGUID();
        JMessage := constuctValidationPayload(accountNumber, bankCode);
        Content.WriteFrom(Format(JMessage));
        Content.GetHeaders(ContentHeader);
        ContentHeader.Remove('Content-Type');
        ContentHeader.Add('Content-Type', 'application/json');
        Request.GetHeaders(RequestHeader);
        Request.Content(Content);
        Request.Method('POST');
        Client.SetBaseAddress(ValidationUrl);

        if Client.Send(Request, Response) then begin
            if Response.Content().ReadAs(Res) then begin
                if Response.IsSuccessStatusCode then begin
                    If Jtoken.ReadFrom(Res) then begin
                        if Jtoken.IsObject then begin
                            JResponse := Jtoken.AsObject();
                            StatusCode := ExtractTextFromJson(JResponse, valueJtoken, 'statusCode');
                            BankAccName := ExtractTextFromJson(JResponse, valueJtoken, 'accountName');
                            // JResponse.WriteTo(LogMesssage);
                            // Message(LogMesssage);
                            if (StatusCode = '0') then begin
                                PayeeAccName := BankAccName;
                                exit(PayeeAccName);
                            end;

                            if (StatusCode = '1') then begin
                                // PayeeAccName := BankAccName;
                                exit('INVALID');
                            end



                        end;

                    end;
                end;
            end;

        end else begin
            Logs."Status Message" := GetLastErrorText();
            Logs.Insert();
        end;
        exit(PayeeAccName);


    end;

    local procedure constuctValidationPayload(accountNumber: Text; bankCode: Text): JsonObject
    var
        Payload: JsonObject;
        requestId: Guid;
    begin
        requestId := CreateGuid();

        Payload.add('requestId', requestId);
        Payload.add('action', 'ACCOUNTVALIDATION');
        Payload.add('companyCode', 'KE0010001');
        Payload.add('primaryAccountNumber', accountNumber);
        Payload.add('beneficiaryBankCode', bankCode);
        exit(Payload);

    end;


    Procedure getUrls()
    var
        HrSetup: Record "Human Resources Setup";
        SMSSetup: Record "SMS Setup";

    begin
        SMSSetup.get();
        SMSSetup.TestField(SMSSetup.ValidationApi);
        ValidationUrl := SMSSetup.ValidationApi;


    end;



    Procedure ExtractTextFromJson(resObj: JsonObject; resToken: JsonToken; value: text): Text;
    var
        result: text;
    begin
        if resObj.get(value, resToken) then begin
            result := resToken.AsValue().AsText();
            exit(result)
        end
        else
            exit('');
    end;




    procedure GenerateAndSendOTP(UserID: Code[20]; DocumentNo: Code[20]; TableId: integer; OTPType: Option)
    var
        OTP: Text[10];
        Emp: Record Employee;
        SequenceNo: Integer;
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.Setrange("Table ID", TableId);
        ApprovalEntry.Setrange("Document No.", DocumentNo);
        ApprovalEntry.Setrange(Status, ApprovalEntry.Status::Open);
        ApprovalEntry.Setrange("Approver ID", UserID);
        if ApprovalEntry.Find('-') then
            SequenceNo := ApprovalEntry."Sequence No."
        else
            SequenceNo := 0;
        Emp.reset();
        Emp.setRange("user id", UserID);
        Emp.findFirst();
        OTP := generateOTP.GenerateAndSendOTP(UserID, Emp."Phone No.", DocumentNo);
        generateOTP.StoreOTP(UserId, Emp."Phone No.", DocumentNo, OTP, TableId, OTPType, SequenceNo);

    end;

    procedure ValidateOTP(UserEnteredOTP: Text[10]; UserId: Code[20]): Boolean;
    var
        validatedOTP: Boolean;
        OTPTable: Record "OTP";
    begin
        OTPTable.reset();
        OTPTable.setRange("User ID", UserId);
        OTPTable.FindLast();
        if (OTPTable."OTP Code" = UserEnteredOTP) and (OTPTable."Expiration Time" > CurrentDateTime) then
            exit(true)
        else
            exit(false);
    end;






    procedure insertAppointmentComittee2(docType: Option; docDate: Date; Desc: Text;
    AppEffectiveDate: Date; endDate: Date; Venue: Text; brief: Text): Code[20];
    var
        commiteeRec: Record "Commitee Appointment Voucher";
        HumanResourcesSetup: Record "Human Resources Setup";
        DocNo: Code[20];

    begin
        HumanResourcesSetup.get();
        DocNo := NoSeriesMgt.GetNextNo(HumanResourcesSetup."Committee Terminate Nos.", 0D, true);
        commiteeRec.init();

        commiteeRec."Document No." := DocNo;
        commiteeRec."Document Date" := docDate;
        commiteeRec.Description := Desc;
        commiteeRec."Appointment Effective Date" := AppEffectiveDate;
        commiteeRec."Tenure End Date" := endDate;
        commiteeRec.Venue := Venue;
        commiteeRec."Additional Brief" := brief;
        if commiteeRec.Insert() then
            exit(commiteeRec."Document No.")
        else
            exit('');

    end;

    // procedure UpdateAppointmentComittee2(DocNo: Code[20]; docType: Option; docDate: Date; Desc: Text;
    // AppEffectiveDate: Date; endDate: Date; Venue: Text; brief: Text): Code[20];
    // var
    //     commiteeRec: Record "Commitee Appointment Voucher";
    // begin
    //     pasCoreValues.Reset();
    //     pasCoreValues.setRange("Performance Contract Header", DocNo);
    //     if pasCoreValues.FindFirst() then begin
    //         pasCoreValues.init;
    //         pasCoreValues."Core Value" := coreValue;
    //         pasCoreValues."Appraisee Comments" := AppraiseeComments;
    //         pasCoreValues."Appraisers Comments" := AppraisersComments;
    //         if pasCoreValues.Insert() then
    //             exit('Success')
    //         else
    //             exit('false');
    //     end;
    // end;

    procedure InsertPASValues(
     DocNo: Code[100];
     StrategicPlanID: Code[30];
     coreValue: Code[255];
     AppraiseeComments: Text[250];
     AppraisersComments: Text[250];
     BehavioralExpectation: Text[250];
     JointAssessment: Decimal;
     selfAssessment: Decimal;
     Description: Text[250]
 ): Text;
    var
        pasCoreValues: Record "PAS Core Values";
        pasCoreHeader: Record "Perfomance Contract Header";
        LineNo: Integer;
    begin
        pasCoreHeader.Reset();

        pasCoreHeader.SetRange(No, DocNo);
        if NOT pasCoreHeader.FindFirst then
            exit('Document Not Found');

        pasCoreValues.Reset();
        if pasCoreValues.FindLast() then
            LineNo := pasCoreValues."Line No." + 1
        else
            LineNo := 1;

        pasCoreValues.Init();
        pasCoreValues."Performance Contract Header" := DocNo;
        pasCoreValues."Line No." := LineNo;
        pasCoreValues."Strategic Plan ID" := StrategicPlanID;
        pasCoreValues."Core Value" := coreValue;
        pasCoreValues."Appraisee Comments" := AppraiseeComments;
        pasCoreValues."Appraisers Comments" := AppraisersComments;
        pasCoreValues."Behavioural expectation" := BehavioralExpectation;
        pasCoreValues.Description := Description;
        pasCoreValues."Joint Assessment" := JointAssessment;
        pasCoreValues."Self Assessment" := selfAssessment;

        if pasCoreValues.Insert() then
            exit('Success')
        else
            exit('Failed');
    end;

    procedure UpdatePASValues(
        DocNo: Code[100];
        StrategicPlanID: Code[30];
        coreValue: Code[255];
        LineNo: integer;
        AppraiseeComments: Text[250];
        AppraisersComments: Text[250];
        BehavioralExpectation: Text[250];
        JointAssessment: Decimal;
        selfAssessment: Decimal;
        Score: Decimal;
        Description: Text[250]


    ): Text;
    var
        pasCoreValues: Record "PAS Core Values";

    begin
        pasCoreValues.reset();
        pasCoreValues.SetRange("Performance Contract Header", DocNo);
        pasCoreValues.SetRange("Strategic Plan ID", StrategicPlanID);
        pasCoreValues.SetRange("Line No.", LineNo);

        if pasCoreValues.FindFirst() then begin
            if coreValue <> '' then
                pasCoreValues."Core Value" := coreValue;
            if AppraiseeComments <> '' then
                pasCoreValues."Appraisee Comments" := AppraiseeComments;
            if AppraisersComments <> '' then
                pasCoreValues."Appraisers Comments" := AppraisersComments;
            pasCoreValues."Behavioural expectation" := BehavioralExpectation;
            pasCoreValues."Joint Assessment" := JointAssessment;
            pasCoreValues."Self Assessment" := selfAssessment;
            pasCoreValues.Description := Description;
            pasCoreValues.Score := Score;


            if pasCoreValues.Modify() then
                exit('Success')
            else
                exit('Failed');
        end
        else
            exit('Record not found');
    end;

    procedure InsertPerfomanceTargetsLines(
           ContractNo: Code[100];
           Activity: Text[250];
           PasActivity: Text[250];
           IndividualTarget: Text[250];
           Weight: Decimal;
           Target: Decimal;
           indicator: Text[250];
           KeyPerformanceIndicator: Code[250];
           UnitofMeasure: Code[50];
           SelfAssessmentTarget: Decimal;
           JointTarget: Decimal;
           WeightedScore: Decimal;
           PMMUNumber: Code[20]
           ): Text[100];
    var
        performanceTarget: Record "Performance Targets";
        lastEntryNumber: Integer;
    begin

        performanceTarget.reset();
        if performanceTarget.Find('-') then
            lastEntryNumber := performanceTarget.Count + 1;
        if lastEntryNumber = 0 then lastEntryNumber := 1;

        performanceTarget.init();
        performanceTarget."Entry No." := lastEntryNumber + 1;

        performanceTarget."Contract No." := ContractNo;
        performanceTarget.Activity := Activity;
        performanceTarget."PAS Activity" := PasActivity;
        performanceTarget."Individual Target" := IndividualTarget;
        performanceTarget.Weight := Weight;
        performanceTarget.Target := Target;
        performanceTarget."Performance Indicator" := indicator;
        performanceTarget."Key Performance Indicator" := KeyPerformanceIndicator;
        performanceTarget."Unit of Measure" := UnitofMeasure;
        performanceTarget."Self Assessment Target" := SelfAssessmentTarget;
        performanceTarget.validate("Joint/Agreed Target", JointTarget);
        performanceTarget."Weighted Score" := WeightedScore;
        performanceTarget."PMMU No." := PMMUNumber;

        if performanceTarget.Insert() then
            exit('Success')
        else
            exit('Failed');
    end;

    // procedure InsertReallocationHeader(budgetCode: Code[30]; purpose: Text; postingDate: date; consolidationTemplate: Code[50]; quarter: Integer) DocNo: code[30]
    // var

    //     ReallocationHeader: record "Budget Reallocation Header";
    //     ReallocationSetup: Record "General Ledger Setup";
    //     NoSeriesMgt: Codeunit NoSeriesManagement;
    // begin
    //     ReallocationSetup.Get();
    //     ReallocationSetup.TestField("Budget Reallocation Nos.");
    //     DocNo := NoSeriesMgt.GetNextNo(ReallocationSetup."Budget Reallocation Nos.", 0D, true);
    //     ReallocationHeader.Init();
    //     ReallocationHeader."Document No" := DocNo;
    //     ReallocationHeader."Budget Code" := budgetCode;
    //     ReallocationHeader.Validate(ReallocationHeader."Budget Code");
    //     ReallocationHeader.Description := purpose;
    //     ReallocationHeader."Posting Date" := postingDate;
    //     ReallocationHeader."Consolidation Template" := consolidationTemplate;
    //     ReallocationHeader.Validate(ReallocationHeader."Consolidation Template");
    //     ReallocationHeader.Quarter := quarter;
    //     ReallocationHeader.Validate(ReallocationHeader.Quarter);
    //     if ReallocationHeader.Insert() then
    //         exit(DocNo);
    // end;

    // procedure InsertReallocationLines(documentNo: Code[30]; budgetLine: Code[30]; geographical: Text; adminUnit: Code[30]; vote: Code[50]; programme: Code[50]; class: Code[50]; fundingSource: Code[50]; amount: decimal)
    // var
    //     LineNo: Integer;
    //     ReallocationLines: record "Budget Modification Lines";
    // begin
    //     ReallocationLines.Reset();
    //     ReallocationLines.SetRange("Document No", documentNo);
    //     if ReallocationLines.FindSet() then
    //         LineNo := ReallocationLines.Count + 1;
    //     if LineNo = 0 then
    //         LineNo := 1;
    //     ReallocationLines.Init;
    //     ReallocationLines."Line No" := LineNo;
    //     ReallocationLines."Document No" := documentNo;
    //     ReallocationLines."G/L Account No" := budgetLine;
    //     ReallocationLines.Validate(ReallocationLines."G/L Account No");
    //     ReallocationLines."Global Dimension 1 Code" := geographical;
    //     ReallocationLines.Validate(ReallocationLines."Budget Code");
    //     ReallocationLines."Global Dimension 2 Code" := adminUnit;
    //     ReallocationLines."Shortcut Dimension 3 Code" := vote;
    //     ReallocationLines."Shortcut Dimension 4 Code" := programme;
    //     ReallocationLines."Shortcut Dimension 5 Code" := class;
    //     ReallocationLines."Shortcut Dimension 6 Code" := fundingSource;
    //     ReallocationLines.Amount := amount;
    //     ReallocationLines.Validate(ReallocationLines."Global Dimension 1 Code");
    //     ReallocationLines.Validate(ReallocationLines."Global Dimension 2 Code");
    //     ReallocationLines.Validate(ReallocationLines."Shortcut Dimension 3 Code");
    //     ReallocationLines.Validate(ReallocationLines."Shortcut Dimension 4 Code");
    //     ReallocationLines.Validate(ReallocationLines."Shortcut Dimension 5 Code");
    //     ReallocationLines.Validate(ReallocationLines."Shortcut Dimension 6 Code");
    //     ReallocationLines.Validate(ReallocationLines.Amount);
    //     ReallocationLines.Insert();
    // end;

    // procedure InsertAllocationLines(documentNo: Code[30]; sourceLine: Integer; budgetLine: Code[30]; geographical: Text; adminUnit: Code[30]; vote: Code[50]; programme: Code[50]; class: Code[50]; fundingSource: Code[50]; amount: decimal)
    // var
    //     LineNo: Integer;
    //     ReallocationLines: record "Budget Reallocation Line";
    // begin
    //     ReallocationLines.Reset();
    //     ReallocationLines.SetRange("Document No.", documentNo);
    //     if ReallocationLines.FindSet() then
    //         LineNo := ReallocationLines.Count + 1
    //     else
    //         LineNo := 1;
    //     ReallocationLines.Init;
    //     ReallocationLines."Line No." := LineNo;
    //     ReallocationLines."Document No." := documentNo;
    //     ReallocationLines."Source Line No" := sourceLine;
    //     ReallocationLines."G/L Account No" := budgetLine;
    //     ReallocationLines.Validate(ReallocationLines."G/L Account No");
    //     ReallocationLines."Global Dimension 1 Code" := geographical;
    //     ReallocationLines.Validate(ReallocationLines."Budget Code");
    //     ReallocationLines."Global Dimension 2 Code" := adminUnit;
    //     ReallocationLines."Shortcut Dimension 3 Code" := vote;
    //     ReallocationLines."Shortcut Dimension 4 Code" := programme;
    //     ReallocationLines."Shortcut Dimension 5 Code" := class;
    //     ReallocationLines."Shortcut Dimension 6 Code" := fundingSource;
    //     ReallocationLines.Amount := amount;
    //     ReallocationLines.Validate(ReallocationLines."Global Dimension 1 Code");
    //     ReallocationLines.Validate(ReallocationLines."Global Dimension 2 Code");
    //     ReallocationLines.Validate(ReallocationLines."Shortcut Dimension 3 Code");
    //     ReallocationLines.Validate(ReallocationLines."Shortcut Dimension 4 Code");
    //     ReallocationLines.Validate(ReallocationLines."Shortcut Dimension 5 Code");
    //     ReallocationLines.Validate(ReallocationLines."Shortcut Dimension 6 Code");
    //     ReallocationLines.Validate(ReallocationLines.Amount);
    //     ReallocationLines.Insert();
    // end;

    procedure UpdatePerfomanceTargetsLines(
    ContractNo: Code[100];
    LineNo: Integer;
    Activity: Text[250];
    PasActivity: Text[250];
    IndividualTarget: Text[250];
    Weight: Decimal;
    Target: Decimal;
    indicator: Text[250];
    KeyPerformanceIndicator: Code[250];
           UnitofMeasure: Code[50];
           SelfAssessmentTarget: Decimal;
           JointTarget: Decimal;
           WeightedScore: Decimal;
            PMMUNumber: Code[20]
): Text[100];
    var
        performanceTarget: Record "Performance Targets";
    begin
        performanceTarget.reset();
        performanceTarget.SetRange("Contract No.", ContractNo);
        performanceTarget.SetRange("Entry No.", LineNo);
        performanceTarget.SetRange("PMMU No.", PMMUNumber);


        if performanceTarget.FindFirst() then begin
            performanceTarget.Activity := Activity;
            performanceTarget."PAS Activity" := PasActivity;
            performanceTarget."Individual Target" := IndividualTarget;
            performanceTarget.Weight := Weight;
            performanceTarget.Target := Target;
            performanceTarget."Performance Indicator" := indicator;
            performanceTarget."Key Performance Indicator" := KeyPerformanceIndicator;
            performanceTarget."Unit of Measure" := UnitofMeasure;
            performanceTarget."Self Assessment Target" := SelfAssessmentTarget;
            performanceTarget.validate("Joint/Agreed Target", JointTarget);
            performanceTarget."Weighted Score" := WeightedScore;
            if performanceTarget.Modify() then
                exit('Success')
            else
                exit('Failed');
        end
        else
            exit('Record not found');
    end;

    procedure PerfomSendToSuperVisor(ContractNo: Code[100])
    var
        PerformanceTargets: Record "Performance Targets";
        PerfomanceContract: Record "Perfomance Contract Header";
    begin
        PerfomanceContract.reset();
        PerfomanceContract.setRange(No, ContractNo);
        if PerfomanceContract.FindFirst() then begin
            PerfomanceContract.TestField("Document is At Supervision", false);

            PerformanceTargets.Reset;
            PerformanceTargets.SetRange("Contract No.", PerfomanceContract.No);
            if PerformanceTargets.FindSet then begin
                repeat
                    PerformanceTargets.TestField(Activity);
                    PerformanceTargets.TestField("PAS Activity");
                    PerformanceTargets.TestField(Target);
                    PerformanceTargets.TestField("Performance Indicator");
                    PerformanceTargets.TestField(Weight);
                until PerformanceTargets.Next = 0;
            end;

            PerfomanceContract."Document is At Supervision" := true;
            PerfomanceContract.Modify;
        end

    end;


    procedure SendPMMUApproval(DocNo: Text)
    begin
        PMMU.Reset();
        PMMU.SetRange(No, DocNo);
        if PMMU.find('-') then begin
            VarVariant := PMMU;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end

    end;

    procedure CancelPMMUApproval(DocNo: Text)
    begin
        PMMU.Reset();
        PMMU.SetRange(No, DocNo);
        if PMMU.find('-') then begin
            VarVariant := PMMU;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
        end;

    end;

    procedure UpdatePmmuLine(
    DocNumber: Code[40];
    LineNo: Integer;
    STajPlan: Code[40];
    Quantity: array[4] of Decimal;
    Outcome: Code[30];
    Strategies: Code[30];
    StrategyOutput: Code[40];
    UnitofMeasure: Code[40];
    BaselineTarget: Code[100];
    StrategicOb: Code[30];
    Perspective: Code[30];
    Comments: Text
): Text
    var
        PMMUActivities: Record "PMMU Activities";
    begin
        if (DocNumber = '') or (LineNo = 0) then
            exit('Error: Document Number or Line Number is missing.');
        PMMUActivities.reset();
        PMMUActivities.SetRange("Contract No.", DocNumber);
        PMMUActivities.SetRange("Entry No.", LineNo);
        PMMUActivities.SetRange("Strategy Plan ID", STajPlan);
        if not PMMUActivities.FindFirst() then
            exit('Error: Line with the specified Line No. does not exist.');

        PMMUActivities.Outcome := Outcome;
        PMMUActivities."Strategic Objective" := StrategicOb;
        PMMUActivities.Strategies := Strategies;
        PMMUActivities.Perspectives := Perspective;
        PMMUActivities."Strategy Output Code" := StrategyOutput;
        PMMUActivities.Weight := Quantity[1];
        PMMUActivities.Score := Quantity[2];
        PMMUActivities."Achieved Target" := Quantity[3];
        PMMUActivities.Target := Quantity[4];
        PMMUActivities."Baseline Target" := BaselineTarget;
        PMMUActivities."Unit of Measure" := UnitofMeasure;
        PMMUActivities.Comments := Comments;

        if PMMUActivities.Modify() then
            exit('Success: Line updated successfully.')
        else
            exit('Error: Line update failed due to an unknown issue.');
    end;


    procedure insertPMMULinesActivities(activities: Text[1000]; StrategyOutput: Code[40]; ContractNo: Code[20]; LineNumber: Integer; StrategyPlanId: Code[50]; weight: Decimal; achievedTarget: Decimal)
    var
        PMMUOutputActivities: Record "PMMU Output Activities";
        entryNo: Integer;
        index: Integer;


    begin



        PMMUOutputActivities.Reset();
        if PMMUOutputActivities.Find('-') then
            entryNo := PMMUOutputActivities.Count + 1;
        if entryNo = 0 then entryNo := 1;
        PMMUOutputActivities.Init();
        PMMUOutputActivities.Entry := entryNo;
        PMMUOutputActivities.Activities := activities;
        PMMUOutputActivities."Strategy Output Code" := StrategyOutput;
        PMMUOutputActivities."Contract No." := ContractNo;
        PMMUOutputActivities."Entry No." := LineNumber;
        PMMUOutputActivities."Strategy Plan ID" := StrategyPlanId;
        PMMUOutputActivities."Achieved Targets" := achievedTarget;
        PMMUOutputActivities."Sub Weights" := weight;

        PMMUOutputActivities.Insert();

    end;


    // procedure sendBudgetRelocationForApproval(DocNo: Code[20])

    // var
    //     budgetRelocation: Record "Budget Reallocation Header";

    // begin
    //     budgetRelocation.Reset();
    //     budgetRelocation.SetRange("Document No", DocNo);
    //     if budgetRelocation.find('-') then begin
    //         VarVariant := budgetRelocation;
    //         if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
    //             CustomApprovalMgt.OnSendDocForApproval(VarVariant);
    //     end;
    // end;

    // procedure CancelBudgetRelocationApproval(DocNo: Code[20])
    // var
    //     budgetRelocation: Record "Budget Reallocation Header";

    // begin
    //     budgetRelocation.Reset();
    //     budgetRelocation.SetRange("Document No", DocNo);
    //     if budgetRelocation.find('-') then begin
    //         VarVariant := budgetRelocation;
    //         if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
    //             CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
    //     end;
    // end;

    // procedure insertPMMULinesActivities(activities: array[20] of Text[1000]; StrategyOutput: Code[40]; ContractNo: Code[20]; LineNumber: Integer; StrategyPlanId: Code[50])
    // var
    //     PMMUOutputActivities: Record "PMMU Output Activities";
    //     entryNo: Integer;
    //     index: Integer;
    //     lengthOfArr: Integer;


    // begin
    //     lengthOfArr := ArrayLen(activities);


    //     for index := 1 to lengthOfArr - 1 do begin

    //         PMMUOutputActivities.Reset();
    //         if PMMUOutputActivities.FindLast() then
    //             entryNo := PMMUOutputActivities."Entry No."
    //         else
    //             entryNo := 0;
    //         PMMUOutputActivities.Init();
    //         PMMUOutputActivities.Activities := activities[index];
    //         PMMUOutputActivities."Entry No." := entryNo + 1;
    //         PMMUOutputActivities."Strategy Output Code" := StrategyOutput;
    //         PMMUOutputActivities."Contract No." := ContractNo;
    //         PMMUOutputActivities."Entry No." := LineNumber;

    //         PMMUOutputActivities.Insert();
    //         index := index + 1;
    //     end;

    // end;

    procedure DeleteWorkplanLines(documentNo: Code[50]; StrategyNo: code[30]; KraId: Code[20]; CoreStrategyId: Code[20];
         StrategyID: Code[20]; ActivityId: Code[50])
    var
        WorkplanLines: Record "Strategy Workplan Lines";
        Workplan: Record "Annual Strategy Workplan";
    begin
        WorkplanLines.SetRange(No, documentNo);
        if Workplan.Get(documentNo) then
            if Workplan."Approval Status" <> Workplan."Approval Status"::Open then
                Error('You cannot delete a Workplan Line for a Workplan that is not Open');
        WorkplanLines.SetRange("Strategy Plan ID", StrategyNo);
        WorkplanLines.SetRange("KRA ID", KraId);
        WorkplanLines.SetRange("Core Strategy ID", CoreStrategyId);
        WorkplanLines.SetRange("Strategy ID", StrategyID);
        WorkplanLines.SetRange("Activity ID", ActivityId);
        if WorkplanLines.FindSet() then
            WorkplanLines.DeleteAll(true);
    end;

    // procedure exportWorkplan(PlanCode: Code[30]) FileContentsB64: Text
    // var
    //     Workplan: Record "Annual Strategy Workplan";
    //     PLan: Page "Draft Workplan Card";
    //     Ous: OutStream;
    //     Base64: Codeunit "Base64 Convert";
    // begin
    //     if Workplan.Get(PlanCode) then begin
    //         FileContentsB64 := Plan.exportToExcel(Workplan);
    //     end;
    // end;



    procedure insertPASTrainingNeeds(PasNo: Code[20]; TrainingNeed: Text[100]; Remarks: Text[100]): Text;
    var
        pasTrainingNeeds: Record "PAS Training Needs";
        entryNumber: Integer;
    begin
        pasTrainingNeeds.Reset();
        pasTrainingNeeds.SetRange("PAS No.", PasNo);
        if pasTrainingNeeds.FindSet() then begin
            if pasTrainingNeeds.Count() >= 2 then
                error('Only two training needs are allowed');
            if pasTrainingNeeds.FindLast() then
                entryNumber := pasTrainingNeeds."Line No."
            else
                entryNumber := 1000;
        end;

        pasTrainingNeeds.Init();
        pasTrainingNeeds."PAS No." := PasNo;
        pasTrainingNeeds."Line No." := entryNumber + 1000;
        pasTrainingNeeds."Training Need" := TrainingNeed;
        pasTrainingNeeds."Supervisors Remarks" := Remarks;

        if pasTrainingNeeds.Insert(false) then
            exit('Success')
        else
            exit('Failed');
    end;


    procedure updatePASTrainingNeeds(PasNo: Code[20]; TrainingNeed: Text[100]; Remarks: Text[100]; LineNo: Integer): Text;
    var
        pasTrainingNeeds: Record "PAS Training Needs";
    begin

        pasTrainingNeeds.reset();
        pasTrainingNeeds.setRange("PAS No.", PasNo);
        pasTrainingNeeds.setRange("Line No.", LineNo);
        if pasTrainingNeeds.FindFirst() then begin
            pasTrainingNeeds."PAS No." := PasNo;
            pasTrainingNeeds."Training Need" := TrainingNeed;
            pasTrainingNeeds."Supervisors Remarks" := Remarks;
            if pasTrainingNeeds.Modify() then
                exit('Success')
            else
                exit('failed');
        end;
    end;






    procedure IsSuperVisor(empNo: Code[100]; superVisorNo: Code[20]) Supervisor: Boolean
    var
        Emp: Record Employee;
    begin
        if Emp.Get(empNo) then begin
            Supervisor := Emp.Supervisor = superVisorNo;
        end;
    end;

    procedure SuperVisorActions(superVisorNo: Code[20]; resEmployee: Code[100]; docNo: Code[100]; actionType: Integer): Text;
    var
        PCHeader: Record "Perfomance Contract Header";

    begin

        PCHeader.reset();
        PCHeader.setRange(No, docNo);
        if PCHeader.FindFirst() then begin
            PCHeader.TestField("Document Stage", PCHeader."Document Stage"::"Sent To Supervisor");
            if not IsSuperVisor(resEmployee, superVisorNo) then
                Error('You are not the supervisor of the responsible employee! Only the supervisor is allowed to update the document stage!');
            if actionType = 0 then
                PCHeader."Document Stage" := PCHeader."Document Stage"::"Returned To Employee";
            if actionType = 1 then
                PCHeader."Document Stage" := PCHeader."Document Stage"::"Mid-Year Review";
            if actionType = 2 then
                PCHeader."Document Stage" := PCHeader."Document Stage"::"Completed Mid-Year Review";
            if PCHeader.Modify() then
                exit('Document stage marked as %1!' + Format(PCHeader."Document Stage"))
            else
                exit('Could Not Modify The Object');

        end;
    end;

    // procedure importWorkplan(base64excel: Text; PlanCode: Code[30])
    // var
    //     Workplan: Record "Annual Strategy Workplan";
    //     PLan: Page "Draft Workplan Card";
    //     Ous: OutStream;
    //     Base64: Codeunit "Base64 Convert";
    // begin
    //     if Workplan.Get(PlanCode) then begin
    //         Plan.ImportfromExcel(Workplan, base64excel);
    //     end;

    // end;

    procedure StartPMMUEvaluation(DocNo: Code[100]): Boolean;

    var
        PCH: Record "Perfomance Contract Header";
        isModified: Boolean;

    begin
        isModified := false;
        PCH.setRange(No, DocNo);
        if PCH.FindFirst() then begin
            PCH.TestField("PMMU/PAS Stage", PCH."PMMU/PAS Stage"::Evaluation);
            PCH."Approval Status" := PCH."Approval Status"::Open;
            if PCH.Modify() then isModified := true;
        end

        else begin
            Error('Document Not Found!');
        end;

        exit(isModified);

    end;


    procedure UpdateExpenseRequisition(DocumentNo: Code[20];
                                       Description: Text[100];
                                       "Global Dimension 1 Code": Code[20];
                                       "Global Dimension 2 Code": Code[20];
                                       "Activity Code": Code[20];
                                       "Requires Imprest": Boolean;
                                       "Imprest Type": Option;
                                       "Start Date": Date;
                                       "No Of Days": Integer;
                                       Subject: Text[100];
                                       ObjectiveTxt: Text[250];
                                       "Requires Direct Payment": Boolean;
                                       "Requires PRN": Boolean;
                                       "Procurement Plan ID": Code[20];
                                       "PRN Type": Option;
                                       "Location Code": Code[10];
                                       "Requisition Product Group": Code[20];
                                       "PP Plan Category": Text[100];
                                       "Created By": Code[20]; DirectPaymentType: Option) DocNo: Code[20]

    var
        "Corporate Strategy": Text[100];
        "Reporting Period": Text[100];
        Workplan: Text[100];

        ObjBigTxt: BigText;
        Instr: InStream;
        OuStr: OutStream;

    begin
        ExpenseRequisition.Reset();
        ExpenseRequisition.SetRange("No.", DocumentNo);
        if ExpenseRequisition.FindFirst() then begin
            ExpenseRequisition.Description := Description;
            ExpenseRequisition."Global Dimension 1 Code" := "Global Dimension 1 Code";
            ExpenseRequisition."Holders Admin Unit" := "Global Dimension 2 Code";
            ExpenseRequisition.Validate("Global Dimension 2 Code", "Global Dimension 2 Code");
            ExpenseRequisition.Validate("Global Dimension 1 Code");
            "Corporate Strategy" := WorkplanMgt.GetCurrentCorporateStrategy();
            "Reporting Period" := WorkplanMgt.GetCurrentStrategyImplementationYear("Corporate Strategy");
            ExpenseRequisition."Corporate Strategy" := "Corporate Strategy";
            ExpenseRequisition."Reporting Period" := "Reporting Period";
            ExpenseRequisition.Validate("Reporting Period");
            ExpenseRequisition.Workplan := WorkplanMgt.GetCurrentWorkplan("Corporate Strategy", "Reporting Period", "Global Dimension 1 Code", "Global Dimension 2 Code");
            ExpenseRequisition.Validate(Workplan);
            ExpenseRequisition.Date := Today;
            ExpenseRequisition."Direct Payment Type" := DirectPaymentType;
            ExpenseRequisition.Validate("Activity Code", "Activity Code");
            //ExpenseRequisition."Activity Code" := "Activity Code";
            ExpenseRequisition."Requires Imprest" := "Requires Imprest";
            ExpenseRequisition."Imprest Type" := "Imprest Type";
            ExpenseRequisition."Start Date" := "Start Date";
            if ("No Of Days" <> 0) then
                ExpenseRequisition.Validate("No Of Days", "No Of Days");
            ExpenseRequisition.Subject := Subject;

            ExpenseRequisition.CalcFields(Objective);
            ExpenseRequisition.Objective.CreateInStream(Instr);
            ObjBigTxt.Read(Instr);
            if format(ObjBigTxt) <> ObjectiveTxt then begin
                ExpenseRequisition.Objective.CreateOutStream(OuStr);
                OuStr.WriteText(ObjectiveTxt);
            end;

            ExpenseRequisition."Requires Direct Payment" := "Requires Direct Payment";
            ExpenseRequisition."Requires PRN" := "Requires PRN";
            ExpenseRequisition."Procurement Plan ID" := "Procurement Plan ID";
            ExpenseRequisition."PRN Type" := "PRN Type";
            ExpenseRequisition."Location Code" := "Location Code";
            ExpenseRequisition."PP Plan Category" := "PP Plan Category";
            ExpenseRequisition."Created By" := "Created By";
            ExpenseRequisition."Date Created" := CurrentDateTime;
            if ExpenseRequisition.Modify() then
                exit(ExpenseRequisition."No.")
            else
                exit('');


        end;
    end;

    procedure UpdateEmployeeActions(docNo: Code[20]; TheAction: Integer; UserId: Code[20]): Text;

    var
        PCH: Record "Perfomance Contract Header";
    begin
        PCH.Reset();
        PCH.setRange(No, docNo);
        if PCH.FindFirst() then begin
            PCH.TestField("Created By", UserId);

            if TheAction = 0 then begin
                PCH.TestField("Document Stage", PCH."Document Stage"::" ");
                PCH."Document Stage" := PCH."Document Stage"::"Sent To Supervisor";
                if PCH."Document Stage" = PCH."Document Stage"::"Sent To Supervisor" then
                    PCH."Document is At Supervision" := true;


            end;

            if TheAction = 1 then begin
                PCH.TestField("Document Stage", PCH."Document Stage"::"Returned To Employee");
                PCH."Document Stage" := PCH."Document Stage"::"Returned to Supervisor";
                if PCH."Document Stage" = PCH."Document Stage"::"Returned to Supervisor" then
                    PCH."Document is At Supervision" := true;


            end;
            if PCH.Modify() then exit('Document has been Modified');


        end
        else
            exit('Doc Not Found');
    end;



    procedure InsertDirectExpense(DocumentNo: Text; supplierInvDate: Date; supplierInvNo: Text[30]; ExpenseDescription: Text; GLAccount: Text; Quantity: Decimal; Rate: Decimal; Destination: Text; VoteItem: Text;
    LineNo: Integer; Type: Option; supplier: Code[20])

    var

        ExpenseReqAllocation: Record "Expense Req. Allocation";
    begin

        ExpenseReqAllocation.Init();
        ExpenseReqAllocation."Document No." := DocumentNo;
        ExpenseReqAllocation."Source Line No." := LineNo;
        ExpenseReqAllocation.Type := Type;
        ExpenseReqAllocation."Expense Description" := ExpenseDescription;
        ExpenseReqAllocation."G/L Account" := GLAccount;
        ExpenseReqAllocation."Supplier" := Supplier;
        ExpenseReqAllocation."Supplier Invoice No." := supplierInvNo;
        ExpenseReqAllocation."Supplier Invoice Date" := supplierInvDate;
        ExpenseReqAllocation.Quantity := Quantity;
        ExpenseReqAllocation.Validate(Rate, Rate);
        ExpenseReqAllocation.Insert(true);
    end;

    procedure InsertContractPayment(DocumentNo: Text; contractNumber: Code[50]; lpoNumber: Code[50]; itemNumber: Code[50]; supplierInvDate: Date; supplierInvNo: Text[30]; ExpenseDescription: Text; GLAccount: Text; Quantity: Decimal; Rate: Decimal; Destination: Text; VoteItem: Text;
    LineNo: Integer; Type: Option; supplier: Code[20])
    var
        ExpenseReqAllocation: Record "Expense Req. Allocation";
    begin
        ExpenseReqAllocation.Init();
        ExpenseReqAllocation."Document No." := DocumentNo;
        ExpenseReqAllocation."Source Line No." := LineNo;
        ExpenseReqAllocation."Contract No" := contractNumber;
        ExpenseReqAllocation."Lpo No" := lpoNumber;
        ExpenseReqAllocation.Validate("Lpo No", lpoNumber);
        ExpenseReqAllocation."Item To Line pay" := itemNumber;
        ExpenseReqAllocation.Validate("Item To Line pay", itemNumber);
        ExpenseReqAllocation.Type := Type;
        ExpenseReqAllocation."Expense Description" := ExpenseDescription;
        ExpenseReqAllocation."G/L Account" := GLAccount;
        ExpenseReqAllocation."Supplier" := Supplier;
        ExpenseReqAllocation."Supplier Invoice No." := supplierInvNo;
        ExpenseReqAllocation."Supplier Invoice Date" := supplierInvDate;
        ExpenseReqAllocation.Quantity := Quantity;
        ExpenseReqAllocation.Validate(Rate, Rate);
        ExpenseReqAllocation.Insert();
    end;

    procedure DeleteExpenseReqLine(DocNo: Code[20]; LineNumber: Integer; sourceLineNo: Integer)
    var
        ExpenseReqAllocation: Record "Expense Req. Allocation";

    begin

        ExpenseReqAllocation.Reset();
        ExpenseReqAllocation.SetRange("Document No.", DocNo);
        ExpenseReqAllocation.SetRange("Line No.", LineNumber);
        ExpenseReqAllocation.SetRange("Source Line No.", sourceLineNo);
        if ExpenseReqAllocation.FindSet() then begin
            ExpenseReqAllocation.Delete();
        end;
    end;

    procedure sendPasforApproval(DocNo: Code[20])
    var
        PASTable: Record "Perfomance Contract Header";
    begin

        PASTable.Reset();
        PASTable.SetRange(No, DocNo);
        if PASTable.find('-') then begin
            VarVariant := PASTable;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end;

    end;


    procedure cancelPasApproval(DocNo: Code[20])
    var
        PASTable: Record "Perfomance Contract Header";
    begin

        PASTable.Reset();
        PASTable.SetRange(No, DocNo);
        if PASTable.find('-') then begin
            VarVariant := PASTable;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);

        end;

    end;


    // procedure GenerateClaimsReport(DocNo: Code[20]) BaseImage: Text
    // var
    //     paymentRep: Record Payments;
    // begin
    //     TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
    //     paymentRep.Reset;
    //     paymentRep.SetRange(paymentRep."No.", DocNo);
    //     if paymentRep.Find('-') then begin
    //         RecRef.GetTable(paymentRep);
    //         Report.SaveAs(Report::F022Report, '', ReportFormat::Pdf, OutStr, RecRef);
    //         FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('FO22Voucher_%1.Pdf', paymentRep."No."), TRUE);
    //         TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
    //         BaseImage := Base64Convert.ToBase64(InStr);
    //         exit(BaseImage);
    //     end;
    // end;


    procedure DeletePerfomanceTargetsLines(
        ContractNo: Code[100];
        LineNo: Integer

    ): Text[100];
    var
        performanceTarget: Record "Performance Targets";
    begin
        performanceTarget.reset();
        performanceTarget.SetRange("Contract No.", ContractNo);
        performanceTarget.SetRange("Entry No.", LineNo);

        if performanceTarget.FindFirst() then begin
            performanceTarget.Delete();
        end
        else
            exit('Record not found');
    end;


    procedure DeletePASValues(
        DocNo: Code[100];
        StrategicPlanID: Code[30];
        LineNo: integer

    ): Text;
    var
        pasCoreValues: Record "PAS Core Values";

    begin
        pasCoreValues.reset();
        pasCoreValues.SetRange("Performance Contract Header", DocNo);
        pasCoreValues.SetRange("Strategic Plan ID", StrategicPlanID);
        pasCoreValues.SetRange("Line No.", LineNo);

        if pasCoreValues.FindFirst() then begin
            if pasCoreValues.Delete() then
                exit('Success')
            else
                exit('Failed');
        end
        else
            exit('Record not found');
    end;


    procedure DeletePASTrainingNeeds(PasNo: Code[20]; LineNo: Integer): Text;
    var
        pasTrainingNeeds: Record "PAS Training Needs";
    begin

        pasTrainingNeeds.reset();
        pasTrainingNeeds.setRange("PAS No.", PasNo);
        pasTrainingNeeds.setRange("Line No.", LineNo);
        if pasTrainingNeeds.FindFirst() then begin

            if pasTrainingNeeds.Delete() then
                exit('Success')
            else
                exit('failed');
        end;
    end;

    procedure EditActivities(WrkCode: code[20]; Activities: Text[1080]; Outputs: Text; permomance: Text[1080]; AnnualTarget: Text[50]; Lineno: Integer; LineCode: Code[20])
    var
        myInt: Integer;
        WorkplanActivities: Record "Workplan Activity";
        Workplan: Record "Annual Strategy Workplan";
        DocNo: code[30];
    begin
        if Workplan.Get(WrkCode) then
            if Workplan."Approval Status" <> Workplan."Approval Status"::Open then
                Error('You cannot edit Activities for a Workplan that is not Open');
        WorkplanActivities.Reset();
        WorkplanActivities.SetRange("Strategic Plan ID", WrkCode);
        WorkplanActivities.SetRange(Code, LineCode);
        WorkplanActivities.SetRange("Line N0.", Lineno);
        WorkplanActivities.FindFirst();
        WorkplanActivities."Annual Target" := AnnualTarget;
        WorkplanActivities.Outputs := Outputs;
        WorkplanActivities."Performance Measures" := permomance;
        WorkplanActivities.Descriptions := Activities;
        WorkplanActivities.modify();
    end;



    // procedure GenerateOutwardReport(StartDate: DateTime; EndDate: DateTime; reportType: Integer; paid: Boolean; failed: Boolean; senttoBank: Boolean; geo: Text[50]) BaseImage: Text
    // var
    //     paymentRep: Record "Outward Payment Buffer";
    //     dimensionValue: Record "Dimension Value";

    // begin
    //     TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
    //     paymentRep.Reset;
    //     paymentRep.SetFilter(paymentRep.TransInitiatedDate, '%1..%2', StartDate, EndDate);
    //     if (paid = true) then paymentRep.SetRange(paymentRep.paid, true);
    //     if (failed = true) then paymentRep.SetRange(paymentRep.failed, true);
    //     if (senttoBank = true) then paymentRep.SetRange(paymentRep.sentToBank, true);
    //     if (senttoBank = false) then paymentRep.SetRange(paymentRep.sentToBank, false);
    //     if (geo <> '') then begin
    //         dimensionValue.reset();
    //         dimensionValue.SetRange(Code, geo);
    //         if dimensionValue.FindFirst() then
    //             paymentRep.SetRange(paymentRep.GeoCode, dimensionValue."Bank Acc ID");
    //     end;
    //     if paymentRep.Find('-') then begin
    //         RecRef.GetTable(paymentRep);
    //         if (reportType = 0) then Report.SaveAs(Report::"Outward Bank Statement", '', ReportFormat::Pdf, OutStr, RecRef);
    //         if (reportType = 1) then Report.SaveAs(Report::"Outward Bank Statement", '', ReportFormat::Excel, OutStr, RecRef);
    //         FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('OutwardPayment_%1.Pdf', 'outward'), TRUE);
    //         TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
    //         BaseImage := Base64Convert.ToBase64(InStr);
    //         exit(BaseImage);
    //     end;
    // end;

    procedure DeleteBudgetAmounts("Strategy Plan ID": Code[20];
    "KRA ID": Code[20];
    "Core Strategy ID": Code[20];
    "Strategy ID": Code[20];
    "Activity ID": Code[20];
    "Input Line No.": Integer;
    "Line No.": Code[20];
    "Budget Item": Code[20])
    var
        BudgetLine: Record "Workplan Budget Line";
        Workings: Record "Workplan Workings";
        Workplan: Record "Annual Strategy Workplan";
    begin
        if Workplan.Get("Strategy Plan ID") then
            if Workplan."Approval Status" <> Workplan."Approval Status"::Open then
                Error('You cannot delete Budget Line for a Workplan that is not Open');
        BudgetLine.Reset();
        BudgetLine.SetRange("Strategy Plan ID", "Strategy Plan ID");
        BudgetLine.SetRange("KRA ID", "KRA ID");
        BudgetLine.SetRange("Core Strategy ID", "Core Strategy ID");
        BudgetLine.SetRange("Strategy ID", "Strategy ID");
        BudgetLine.SetRange("Activity ID", "Activity ID");
        BudgetLine.SetRange("Input Line No.", "Input Line No.");
        BudgetLine.SetRange("Line No.", "Line No.");
        BudgetLine.SetRange("Budget Item", "Budget Item");
        BudgetLine.FindFirst();
        BudgetLine.Delete(true);
    end;

    // procedure generateCommitmentReport() 
    // begin

    // end;

    procedure generateCommitmentReport(reportType: Integer; startDate: Date; endDate: Date) BaseImage: Text
    var
        ExpenseReq: Record "Expense Req. Allocation";
        commitmentEntries: Record "Commitment Entries";
    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        commitmentEntries.Reset();
        commitmentEntries.setFilter("Commitment Date", '%1..%2', startDate, endDate);
        if commitmentEntries.Find('-') then begin
            ExpenseReq.Reset;
            // if commitmentEntries.Find('-') then begin
            RecRef.GetTable(ExpenseReq);
            if (reportType = 0) then Report.SaveAs(Report::"Commitment Entries", '', ReportFormat::Pdf, OutStr, RecRef);
            if (reportType = 1) then Report.SaveAs(Report::"Commitment Entries", '', ReportFormat::Excel, OutStr, RecRef);
            FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('commitmentreport.Pdf', ''), TRUE);
            TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
            exit(BaseImage);
        end;
        // end;
    end;



    Procedure SuggestRFQBids(BidNo: Text) success: Boolean
    var
        IFS: Record "Standard Purchase Code";
        BidEvaluation: Record "Bid Evaluation Register";
        Procurement: Codeunit "Procurement Processing";
    begin
        BidEvaluation.get(BidNo);
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Invitation For Supply No", BidEvaluation."IFS Code");
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::Quote);
        if PurchaseHeader.FindSet then
            IFS.Reset;
        IFS.SetRange(Code, BidEvaluation."IFS Code");
        IFS.SetRange("Special RFQ", true);
        if IFS.FindSet then begin
            Procurement.FnSuggestRFQBids(BidEvaluation, PurchaseHeader);
            //Procurement.FnSuggestRFQBi(Rec,PurchaseHeader);
            success := True;
        end else begin
            success := False;
        end;

    end;

    // procedure GenerateWarrantReport(documentNumber: Code[50]) BaseImage: Text
    // var
    //     paymentRec: Record "Payments";
    // begin
    //     TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
    //     paymentRec.Reset;
    //     paymentRec.SetRange(paymentRec."No.", documentNumber);
    //     if paymentRec.FindSet() then begin
    //         RecRef.GetTable(paymentRec);
    //         Report.SaveAs(Report::"Imprest Warranty", '', ReportFormat::Pdf, OutStr, RecRef);
    //         FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('Warranty%1.Pdf', 'outward'), TRUE);
    //         TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
    //         BaseImage := Base64Convert.ToBase64(InStr);
    //         exit(BaseImage);
    //     end;
    // end;

    procedure updatePMMULinesActivities(entryNo: Integer; activities: Text[1000]; StrategyOutput: Code[40]; ContractNo: Code[20]; LineNumber: Integer; StrategyPlanId: Code[50]; weight: Decimal; achievedTarget: Decimal): Text;
    var
        PMMUOutputActivities: Record "PMMU Output Activities";


    begin



        PMMUOutputActivities.Reset();
        PMMUOutputActivities.SetRange("Contract No.", ContractNo);
        PMMUOutputActivities.SetRange("Strategy Output Code", StrategyOutput);
        PMMUOutputActivities.SetRange("Entry No.", LineNumber);
        PMMUOutputActivities.SetRange("Strategy Plan ID", StrategyPlanId);
        PMMUOutputActivities.setRange(Entry, entryNo);
        if PMMUOutputActivities.FindFirst() then begin
            PMMUOutputActivities.Activities := activities;
            PMMUOutputActivities."Achieved Targets" := achievedTarget;
            PMMUOutputActivities."Sub Weights" := weight;
            if PMMUOutputActivities.Modify() then
                exit('Updated')
            else begin
                exit('Not Updated');
            end;
        end
        else begin
            Error('Document Not Found');
        end;

    end;

    // procedure GenerateVoteBookReport(StartDate: Date; EndDate: Date; budget: Code[50]; class: Code[10]; adminunit: Code[30]; reportType: Integer) BaseImage: Text
    // var
    //     BudgetEntry: Record "G/L Budget Entry";
    //     Tempblob: Codeunit "Temp Blob";
    //     OutStr: OutStream;
    //     InsStr: InStream;
    //     Base64Convert: Codeunit "Base64 Convert";
    //     VoteBookReport: Report "Budget VoteBook";
    // begin
    //     Tempblob.CreateOutStream(OutStr);
    //     VoteBookReport.setAdminUnit(adminunit);
    //     VoteBookReport.setBudgetCode(budget);
    //     VoteBookReport.setClass(class);
    //     VoteBookReport.setDates(StartDate, EndDate);
    //     if (reportType = 0) then VoteBookReport.SaveAs('', ReportFormat::Pdf, OutStr);
    //     if (reportType = 1) then VoteBookReport.SaveAs('', ReportFormat::Excel, OutStr);
    //     Tempblob.CreateInstream(InsStr);
    //     BaseImage := Base64Convert.ToBase64(InsStr);
    //     exit(BaseImage);

    // end;


    procedure UpdateBidOpeningLine(DocNo: Text; VendNo: Text; CompleteBidSub: Boolean; FinalBidResult: Option; Remarks: Text)
    var
        BidRegisterL: Record "Bid Opening Register Line";

    begin
        BidRegisterL.Reset();
        BidRegisterL.SetRange(Code, DocNo);
        BidRegisterL.SetRange("Vendor No.", VendNo);
        if BidRegisterL.find('-') then begin
            BidRegisterL."Complete Bid Doc Submitted" := CompleteBidSub;
            BidRegisterL."Final Bid Opening Result" := FinalBidResult;
            BidRegisterL."Tender Opening Com Remarks" := Remarks;
            BidRegisterL.Modify();
        end

    end;

    Procedure ModifyBidTabulationHeader(DocNo: Text; Remarks: Text[2000])
    var
        BidTab: Record "Bid Tabulation Header";
    begin
        BidTab.Reset();
        BidTab.SetRange("Code", DocNo);
        If BidTab.find('-') then begin
            BidTab."General Procurement Remarks" := Remarks;
            BidTab.Modify();
        end;

    end;

    Procedure SubmitFinalEvalutionReport(DocNo: Text) Submitted: Boolean
    var
        BidTab: Record "Bid Tabulation Header";
        BidTabulationLine: Record "Bid Tabulation Line";
    begin
        BidTab.Reset();
        BidTab.SetRange("Code", DocNo);
        If BidTab.find('-') then begin
            if BidTab."Award Type" = BidTab."award type"::"Single Award" then begin
                BidTabulationLine.Reset;
                BidTabulationLine.SetRange("Tabulation ID", BidTab.Code);
                BidTabulationLine.SetRange("Tabulation Type", BidTabulationLine."tabulation type"::"Evaluation Report");
                BidTabulationLine.SetRange("Evaluation Committee Recomm", BidTabulationLine."evaluation committee recomm"::Awarded);
                if not BidTabulationLine.FindSet then begin

                    if BidTab."Document Status" = BidTab."document status"::Submitted then begin
                        Submitted := true;
                    end;
                    if BidTab."Document Status" <> BidTab."document status"::Submitted then begin
                        BidTab.TestField("General Procurement Remarks");
                        BidTab."Document Status" := BidTab."document status"::Submitted;
                        BidTab.Modify(true);
                        Submitted := true;
                    end;



                end else begin
                    if BidTab."Document Status" = BidTab."document status"::Submitted then begin
                        Submitted := true;
                    end;
                    if BidTab."Document Status" <> BidTab."document status"::Submitted then begin
                        BidTab.TestField("General Procurement Remarks");
                        //BidTab."Document Status" := "document status"::Submitted;

                        BidTab."Document Status" := BidTab."document status"::Submitted;

                        BidTab.Modify(true);
                        Submitted := true;
                    end;
                end;
            end;

            if BidTab."Award Type" = BidTab."award type"::"Multiple Award" then begin
                if BidTab."Document Status" = BidTab."document status"::Submitted then begin
                    Submitted := true;
                end;
                if BidTab."Document Status" <> BidTab."document status"::Submitted then begin
                    BidTab.TestField("General Procurement Remarks");
                    BidTab."Document Status" := BidTab."document status"::Submitted;
                    BidTab.Modify(true);
                    Submitted := true;
                end;
            end;
        end;
    end;

    procedure ProceedToProffessionalOpinion(DocNo: Text; UserId: Text)
    var
        Procurement: Codeunit "Procurement Processing";
        BidTab: Record "Bid Tabulation Header";
    Begin
        BidTab.Reset();
        BidTab.SetRange("Code", DocNo);
        If BidTab.find('-') then begin
            BidTab.TestField("Procurement Method");
            UserSetup.Reset;
            UserSetup.SetRange("User ID", UserId);
            if UserSetup.FindSet then begin
                //  IF  UserSetup."HOD Supply Chain"= FALSE THEN
                //    ERROR('You Do Not Have Rights To Create a Professional Opinion,Kindly Contact Head Of Supply Chain Department!!!');
                //  END ELSE

                Procurement.PostFinalEvaluationReport(BidTab);
                BidTab."Opinion Generated" := true;
                BidTab.Modify(true);
            end;
        end;
    End;

    procedure GenerateAwardNotice(DocNo: Text)
    var
        Procurement: Codeunit "Procurement Processing";
        BidTab: Record "Bid Tabulation Header";
    begin
        BidTab.Reset();
        BidTab.SetRange("Code", DocNo);
        If BidTab.find('-') then begin
            Procurement.PostProffesionOpinion(BidTab);
        end;
    end;

    procedure SendAwardLetter(DocNo: Text)
    var
        Procurement: Codeunit "Procurement Processing";
        BidTab: Record "Bid Tabulation Header";
    begin
        BidTab.Reset();
        BidTab.SetRange("Code", DocNo);
        If BidTab.find('-') then begin
            Procurement.FnNotifyTenderAwarded(BidTab);
        end;
    end;

    procedure FnSendTenderCommitteNotification(DocNum: code[30])
    var
        myInt: Integer;
        IFstendercommt: Record "IFS Tender Committee";
        Procurement: Codeunit "Procurement Processing";
    // Procurement.FnSendTenderCommitteNotification(Rec);
    begin
        IFstendercommt.reset;
        IFstendercommt.SetRange("Document No.", DocNum);
        if IFstendercommt.FindFirst() then
            Procurement.FnSendTenderCommitteNotification(IFstendercommt);
    end;


    procedure CreatePurchaseContract(DocNo: Text; UserId: Text; optionSelected: integer): Code[20]
    var
        Procurement: Codeunit "Procurement Processing";
        BidTab: Record "Bid Tabulation Header";
        docNumber: Code[20];
    begin
        BidTab.Reset();
        BidTab.SetRange("Code", DocNo);
        If BidTab.find('-') then begin
            UserSetup.Reset;
            UserSetup.SetRange("User ID", UserId);
            UserSetup.SetRange("Procurement Manager", true);
            if UserSetup.FindSet then begin

                if BidTab."Award Type" = BidTab."award type"::"Multiple Award" then begin

                    Procurement.PostNoticeOfAWardIndividualWards1(BidTab);
                end else begin
                    // docNumber := Procurement.PostNoticeOfAWard(BidTab, optionSelected);
                    exit(docNumber);
                end;
            end else begin
                Error('ERROR!! You dont have sufficient rights to generate a purchase contract');

            end;

            BidTab.Posted := true;
            BidTab."Posted By" := UserId;
            BidTab."Posted Date" := Today;
            BidTab.Modify(false);
        end;
    end;


    procedure SendRegretLetter(DocNo: Text)
    var
        Procurement: Codeunit "Procurement Processing";
        BidTab: Record "Bid Tabulation Header";
    begin
        BidTab.Reset();
        BidTab.SetRange("Code", DocNo);
        If BidTab.find('-') then begin
            Procurement.FnNotifyTenderRegretsWhereNoAward(BidTab);
        end;
    end;

    procedure SendBidTabulationHeaderForApprval(DocNo: Code[30])
    var
        myInt: Integer;
        Procurement: Codeunit "Procurement Processing";
        BidTab: Record "Bid Tabulation Header";
        ApprovalMgt: codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
    begin
        BidTab.Reset();
        BidTab.SetRange("Code", DocNo);
        If BidTab.find('-') then begin
            VarVariant := BidTab;
            if ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                ApprovalMgt.RunWorkflowOnSendApprovalRequest(VarVariant);
        end;

    end;

    procedure CancelBidTabulationHeaderapproval(DocNo: Code[30])
    var
        myInt: Integer;
        EftHeader: Record "EFT Header";
        ApprovalMgt: codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        BidTab: Record "Bid Tabulation Header";
    begin
        BidTab.Reset();
        BidTab.SetRange("Code", DocNo);
        If BidTab.find('-') then begin
            VarVariant := BidTab;
            ApprovalMgt.RunWorkflowOnCancelApprovalRequest(VarVariant);
        end;

    end;

    procedure getAdminUnitCode(adminUnit: Code[20]): Text;
    var
        DimensionValue: Record "Dimension Value";
    begin
        DimensionValue.reset();
        DimensionValue.setRange(Code, adminUnit);
        if DimensionValue.FindFirst() then
            exit(DimensionValue.name);
    end;



    procedure GenerateLPOReport(documentNumber: Code[50]) BaseImage: Text
    var
        purchaseHeader: Record "Purchase Header";
    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        purchaseHeader.Reset;
        purchaseHeader.SetRange(purchaseHeader."No.", documentNumber);
        if purchaseHeader.FindSet() then begin
            RecRef.GetTable(purchaseHeader);
            // Report.SaveAs(Report::"LPO Report", '', ReportFormat::Pdf, OutStr, RecRef);
            FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('LPO%1.Pdf', purchaseHeader."No."), TRUE);
            TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
            exit(BaseImage);
        end;
    end;

    procedure AddContractNo(contractNo: Code[30]; LineNo: integer; DocNo: Code[20])

    var
        purchaseLine: Record "Purchase Line";


    begin
        purchaseLine.reset();
        purchaseLine.setRange("Document No.", DocNo);
        purchaseLine.setRange("Line No.", LineNo);
        if purchaseLine.FindFirst() then begin
            purchaseLine.reset();
            // purchaseLine."Contract No to pay" := contractNo;
            purchaseLine.Modify();
        end;
    end;

    procedure PostPurchaseInvoice(DocumentNo: Code[20]): Code[20]
    var
        purchaseHeader: Record "Purchase Header";
        Noseries: Codeunit NoSeriesManagement;
        PayableSetup: Record "Purchases & Payables Setup";

    begin
        purchaseHeader.Reset();
        purchaseHeader.SetRange(purchaseHeader."No.", DocumentNo);
        purchaseHeader.SetRange(purchaseHeader."Document Type", purchaseHeader."Document Type"::Invoice);
        if purchaseHeader.findset() then begin
            purchaseHeader.Receive := true;
            purchaseHeader.Invoice := true;
            purchaseHeader.Modify();
            Codeunit.run(Codeunit::"Purch.-Post", purchaseHeader);
        end;
    end;


    procedure PostPurchaseOrder(DocumentNo: Code[20]): Code[20]
    var
        purchaseHeader: Record "Purchase Header";
        Noseries: Codeunit NoSeriesManagement;
        PayableSetup: Record "Purchases & Payables Setup";
        NextNo: Code[20];
    begin
        purchaseHeader.Reset();
        purchaseHeader.SetRange(purchaseHeader."No.", DocumentNo);
        purchaseHeader.SetRange(purchaseHeader."Document Type", purchaseHeader."Document Type"::Order);
        if purchaseHeader.findset() then begin
            purchaseHeader.Receive := true;
            purchaseHeader.Invoice := true;
            purchaseHeader.Modify();
            PayableSetup.Get();
            NextNo := NoSeriesMgt.GetNextNo(PayableSetup."Posted Invoice Nos.", 0D, false);
            Codeunit.run(Codeunit::"Purch.-Post", purchaseHeader);
            exit(NextNo);
        end;
    end;

    Procedure FnUpdatePurchaseHeader(DocNo: Code[20]; VendorNo: code[20]; VendorInvoiceNo: Code[50]; DueDate: Date; PostingDate: Date): boolean
    var
        PurchHeader: Record "Purchase Header";
    begin
        PurchHeader.Reset;
        PurchHeader.get(PurchHeader."Document Type"::Order, DocNo);
        PurchHeader.Validate("Buy-from Vendor No.", VendorNo);
        PurchHeader.Validate("Vendor Invoice No.", VendorInvoiceNo);
        PurchHeader.validate("Posting Date", PostingDate);
        PurchHeader.validate("Due Date", DueDate);
        exit(PurchHeader.Modify(true));
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeRecreatePurchLinesHandler', '', false, false)]
    local procedure "Purchase Header_OnBeforeRecreatePurchLinesHandler"(var PurchHeader: Record "Purchase Header"; xPurchHeader: Record "Purchase Header"; ChangedFieldName: Text[100]; var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;

    Procedure FnUpdatePurchaseRequisition(DocNo: Code[20]; VendorNo: code[20]): boolean
    var
        PurchHeader: record "Purchase Header";
    begin
        PurchHeader.get(PurchHeader."Document Type"::"Purchase Requisition", DocNo);
        PurchHeader.validate("Buy-from Vendor No.", VendorNo);
        exit(PurchHeader.Modify(true));
    end;

    Procedure FnInserImprestSurrender(DocNo: Code[20]; VendorNo: code[20]): boolean
    var
        PurchHeader: record "Purchase Header";
    begin
        PurchHeader.get(PurchHeader."Document Type"::"Purchase Requisition", DocNo);
        PurchHeader.validate("Buy-from Vendor No.", VendorNo);
        exit(PurchHeader.Modify(true));
    end;

    procedure FnEditPurchaseLineDescription(DocNo: code[20]; LineNo: Integer; Description: text[250]; dcost: decimal; quantity: integer): Boolean
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        totalCost: decimal;
    begin
        totalCost := quantity * dcost;
        PurchaseLine.get(PurchaseLine."Document Type"::order, DocNo, LineNo);
        PurchaseLine.Description := Description;
        PurchaseLine."Direct Unit Cost" := dcost;
        PurchaseLine."Line Amount" := totalCost;
        exit(PurchaseLine.Modify());
    end;

    procedure FnPublishLPO(DocNo: code[20]): boolean
    var
        Purchaseheader: Array[2] of Record "Purchase Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text[2047];
        Subject: Text[100];
        Vendor: record Vendor;
    begin
        Purchaseheader[1].reset;
        Purchaseheader[1].get(Purchaseheader[1]."Document Type"::Order, DocNo);
        // Purchaseheader[1].Published := true;
        vendor.get(Purchaseheader[1]."Buy-from Vendor No.");
        Subject := 'Genereated PUrchase Oredr';
        Body := 'Dear ' + Format(vendor.name) +
         '<br><br>Please find attached purchase order for your action.' +
         '<br><br>Regards<br>Supply Chain<br>Judiciary of Kenya';
        EmailMessage.Create(vendor."E-Mail", subject, Body);
        EmailMessage.AddAttachment('LPO', 'PDF', GenerateLPOReport(Purchaseheader[1]."No."));
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        exit(Purchaseheader[1].modify);
    end;

    procedure FnSendLPOViaMail(DocNo: code[20]): boolean
    var
        Purchaseheader: Array[2] of Record "Purchase Header";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text[2047];
        Subject: Text[100];
        Vendor: record Vendor;
    begin
        Purchaseheader[1].reset;
        Purchaseheader[1].get(Purchaseheader[1]."Document Type"::Order, DocNo);
        vendor.get(Purchaseheader[1]."Buy-from Vendor No.");
        Subject := 'Genereated PUrchase Oredr';
        Body := 'Dear ' + Format(vendor.name) +
         '<br><br>Please find attached purchase order for your action.' +
         '<br><br>Regards<br>Supply Chain<br>Judiciary of Kenya';
        EmailMessage.Create(vendor."E-Mail", subject, Body);
        EmailMessage.AddAttachment('LPO', 'PDF', GenerateLPOReport(Purchaseheader[1]."No."));
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure fnProcPlanReport(documentNumber: Code[50]) BaseImage: Text
    var
        ProcurementPlan: Record "Procurement Plan";
    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        ProcurementPlan.Reset;
        ProcurementPlan.SetRange(ProcurementPlan.Code, documentNumber);
        if ProcurementPlan.FindSet() then begin
            RecRef.GetTable(ProcurementPlan);
            // Report.SaveAs(Report::"Consolidate Annual plan", '', ReportFormat::Pdf, OutStr, RecRef);
            // Report.SaveAs(Report::"Functional Procurement Plan", '', ReportFormat::Pdf, OutStr, RecRef);
            FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('procPlan%1.Pdf', ProcurementPlan.Code), TRUE);
            TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
            exit(BaseImage);
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeCreateDim', '', false, false)]
    local procedure "Purchase Header_OnBeforeCreateDim"(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean; var DefaultDimSource: List of [Dictionary of [Integer, Code[20]]])
    begin
        IsHandled := true;
    end;

    // procedure UpdateBankName(docNo: Code[20]) Result: Boolean;
    // var
    //     isSucess: Boolean;
    //     payments: Record Payments;


    // begin
    //     payments.reset();
    //     payments.setRange("No.", docNo);
    //     if payments.FindFirst() then begin
    //         payments.TestField(Status, payments.Status::Open);
    //         isSucess := payments.UpdateBankName(payments."Payee", payments.ValidatedBankName);
    //         if (isSucess) then begin
    //             payments."Payee" := payments.ValidatedBankName;
    //             payments.Modify();
    //         end
    //         else
    //             Error('No Matching Records Founds')
    //     end;
    // end;

    // procedure updateClaimsBank(docNo: Code[20])
    // var
    //     isSucess: Boolean;
    //     payment: Record "Payments";
    //     pvLines: Record "PV Lines";


    // begin
    //     payment.reset();
    //     payment.setRange("No.", docNo);
    //     payment.TestField(Status, payment.Status::Open);

    //     if payment.findFirst() then begin
    //         pvLines.Reset();
    //         pvLines.setRange(No, payment."No.");
    //         if pvLines.FindSet() then
    //             repeat
    //                 isSucess := payment.UpdateBankName(pvLines."Payee Bank Acc Name", pvLines.rbankName);
    //                 if (isSucess) then begin
    //                     pvLines."Payee Bank Acc Name" := pvLines.rbankName;
    //                     pvLines.Modify();
    //                     // Message('Updated Successfuly');
    //                 end
    //                 else
    //                     Error('No Matching Records Founds');


    //             until pvLines.next = 0;
    //     end


    // end;

    // procedure updateHrBankDetails(PJNumber: Code[20]; bankCode: Code[20]; bankBranch: Code[20]; accountNumber: Code[100])
    // var
    //     employee: Record Employee;
    //     outwardPayment: Codeunit OutwardPayment;
    //     invalidAccount: Text;
    //     payeeAccName: Text;
    //     smsSetup: Record "SMS Setup";
    //     Resources: Record Resource;
    // begin
    //     smsSetup.get();
    //     smsSetup.TestField(smsSetup.AllowUpdateBDetails);
    //     invalidAccount := 'INVALID';
    //     payeeAccName := outwardPayment.validateBankAccount(accountNumber, bankCode);
    //     if (payeeAccName = invalidAccount) then begin
    //         Error('The Account Number is Invalid');
    //     end
    //     else begin
    //         employee.reset();
    //         employee.SetRange("No.", PJNumber);
    //         if employee.FindFirst() then begin
    //             employee."Employee's Bank 2" := bankCode;
    //             employee.Validate("Employee's Bank 2");
    //             employee."Bank Branch 2" := bankBranch;
    //             employee.Validate("Bank Branch 2");
    //             employee."Bank Account No. 2" := accountNumber;
    //             employee."Payee Bank Acc Name" := payeeAccName;
    //             employee.Modify();
    //         end;
    //         Resources.reset();
    //         Resources.setRange("No.", PJNumber);
    //         if (Resources.findFirst()) then begin
    //             Resources.CalcFields("Job Group");
    //             Resources.Name := payeeAccName;
    //             Resources.Modify();
    //         end


    //     end;
    // end;

    // procedure InsertDutystationTrainingNeeds(DutyStation: Text; Comment: Text) DocNo: Text
    // var
    //     HRSetup: Record "Human Resources Setup";
    //     CMS: Record "Cash Management Setup";
    // begin
    //     CMS.Get();
    //     DStationTNeeds.Reset();
    //     DStationTNeeds.Setrange("Duty Station", DutyStation);
    //     DStationTNeeds.Setrange("Financial Year", CMS."Current Budget");
    //     if not DStationTNeeds.Find('-') then begin
    //         HRSetup.Get;
    //         HRSetup.TestField(HRSetup."Duty Station Training Nos.");
    //         DocNo := NoSeriesMgt.GetNextNo(HRSetup."Duty Station Training Nos.", 0D, true);

    //         DStationTNeeds.Init();
    //         DStationTNeeds."No." := DocNo;
    //         DStationTNeeds."Financial Year" := CMS."Current Budget";
    //         DStationTNeeds.Validate("Duty Station", DutyStation);
    //         DStationTNeeds.Comment := Comment;
    //         DStationTNeeds.Insert();
    //     end else
    //         DocNo := DStationTNeeds."No.";

    // end;

    // procedure SubmitDutyStationTrainingNeeds(DocNo: Text)
    // var
    //     TrainingNeeds: Record "Training Needs Requests";
    // begin
    //     DStationTNeeds.Reset();
    //     DStationTNeeds.Setrange("No.", DocNo);
    //     if DStationTNeeds.Find('-') then begin
    //         if DStationTNeeds.Submitted then
    //             Error('The training needs have already been submitted');
    //         TrainingNeeds.Reset();
    //         TrainingNeeds.SetRange("Financial Year", DStationTNeeds."Financial Year");
    //         TrainingNeeds.SetRange("Duty Station", DStationTNeeds."Duty Station");
    //         if TrainingNeeds.FindSet() then begin
    //             TrainingNeeds.ModifyAll(Submitted, true);
    //         end;
    //         DStationTNeeds.Submitted := true;
    //         DStationTNeeds.Modify();
    //     end;
    // end;

    // procedure SubmitTrainingNeeds(DocNo: Text)
    // var
    //     TrainingNeeds: Record "Training Needs Header";
    //     TrainingNeedsRequests: Record "Training Needs Requests";
    // begin
    //     TrainingNeeds.Reset();
    //     TrainingNeeds.SetRange("Code", DocNo);
    //     //TrainingNeeds.SetRange("Duty Station", DStationTNeeds."Duty Station");
    //     if TrainingNeeds.FindSet() then begin
    //         TrainingNeeds.Submitted := true;
    //         TrainingNeeds.Modify;
    //         TrainingNeedsRequests.Init();
    //         TrainingNeedsRequests."Course ID" := TrainingNeeds."Course ID";
    //         TrainingNeedsRequests.Description := TrainingNeeds."Course Description";
    //         TrainingNeedsRequests.Department := TrainingNeeds.Department;
    //         TrainingNeedsRequests."Duty Station" := TrainingNeeds."Duty Station";
    //         TrainingNeedsRequests."Employee No" := TrainingNeeds."Employee No";
    //         TrainingNeedsRequests."Employee Name" := TrainingNeeds."Employee Name";
    //         TrainingNeedsRequests."Job Title" := TrainingNeeds."Job Title";
    //         TrainingNeedsRequests.Source := TrainingNeeds.Source;
    //         TrainingNeedsRequests."Financial Year" := TrainingNeeds."Financial Year";
    //         TrainingNeedsRequests."Training Header No." := TrainingNeeds.Code;
    //         TrainingNeedsRequests.Insert(true);
    //     end;

    // end;

    procedure fnInsertImprestHeader(empID: Code[50]; empNo: Code[20]; startDate: Date; endDate: Date; purpose: Text; activityDate: Date; impDeadline: Date; imprestType: Integer) status: Text
    var
        ImprestHeader: Record "Request Header1";
        SuccessMsg: Label 'success*Imprest Header inserted successfully.';
        ErrMsg: Label 'danger*Imprest Header was not added. Please try again!';
        Emp: Record Employee;
        TransTypeFin: Record "Transactions Type Finance";
        TransType: Code[20];
        UserSetup: Record "User Setup";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get();

        TransTypeFin.Reset();
        if TransTypeFin.FindFirst() then
            TransType := TransTypeFin.Code;

        Emp.Reset();
        Emp.SetRange("No.", empNo);
        if Emp.FindFirst() then begin
            ImprestHeader.Init();
            ImprestHeader."No." := NoSeriesMgt.GetNextNo(SalesSetup."Imprest Nos.", 0D, true);
            ImprestHeader.Validate("Employee No", empNo);
            ImprestHeader."Trip Start Date" := startDate;
            ImprestHeader.Validate("Trip Expected End Date", endDate);
            ImprestHeader."Purpose of Imprest" := purpose;
            ImprestHeader."Activity Date" := activityDate;
            ImprestHeader."Deadline for Imprest Return" := impDeadline;
            ImprestHeader."Imprest Type" := imprestType;
            ImprestHeader.Type := ImprestHeader.Type::Imprest;
            // ImprestHeader."Transaction Type" := transType;
            ImprestHeader."Transaction Type" := TransType;
            ImprestHeader."User ID" := empID;
            ImprestHeader."Request Date" := Today;
            if UserSetup.Get(empID) then
                ImprestHeader."Customer A/C" := UserSetup."Customer A\C";
            if ImprestHeader.Insert() then
                status := ImprestHeader."No."
            else
                status := ErrMsg;

            exit(status);
        end;
    end;

    procedure fnUpdateImprestHeader(docNo: code[20]; empNo: Code[20]; startDate: Date; endDate: Date; purpose: Text; activityDate: Date; imprestType: Integer) status: Text
    var
        ImprestHeader: Record "Request Header1";
        NotFoundErr: Label 'danger*Imprest document was not found. Please contact administrator for assistance!';
        SuccessMsg: Label 'success*Imprest updated successfully.';
        ErrMsg: Label 'danger*Imprest was not added. Please try again!';
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange("No.", docNo);
        ImprestHeader.SetRange("Employee No", empNo);
        if ImprestHeader.FindFirst() then begin
            ImprestHeader."Trip Start Date" := startDate;
            ImprestHeader.Validate("Trip Expected End Date", endDate);
            ImprestHeader."Purpose of Imprest" := purpose;
            ImprestHeader."Activity Date" := activityDate;
            ImprestHeader."Imprest Type" := imprestType;
            if ImprestHeader.Modify() then
                status := ImprestHeader."No."
            else
                status := ErrMsg;
        end else begin
            status := (NotFoundErr);
        end;

        exit(status);
    end;

    procedure fnDeleteImprestHeader(docNo: Code[20]; empNo: Code[20]) status: Text
    var
        ImprestHeader: Record "Request Header1";
        NotFoundErr: Label 'danger*Imprest document was not found. Please contact administrator for assistance!';
        SuccessMsg: Label 'success*Imprest deleted successfully.';
        ErrMsg: Label 'danger*Imprest was not deleted. Please try again!';
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange("No.", docNo);
        ImprestHeader.SetRange("Employee No", empNo);
        if ImprestHeader.FindFirst() then begin
            if ImprestHeader.Delete(true) then
                status := SuccessMsg
            else
                status := ErrMsg;
        end else begin
            status := NotFoundErr;
        end;

        exit(status);
    end;

    procedure fnInsertImprestLines(docNo: Code[20]; transType: Code[20]; quantity: Decimal; price: Decimal; UoM: Code[10]): Boolean
    var
        ImprestLines: Record "Request Lines1";
        SuccessMsg: Label 'success*Imprest Line inserted successfully.';
        ErrMsg: Label 'danger*Imprest Line was not added. Please try again!';
        LineNo: Integer;
    begin
        ImprestLines.Init();
        ImprestLines.Validate("Document No", docNo);
        ImprestLines."Line No." := getReqLines1LineNo(docNo);
        ImprestLines.Validate("Transaction Type", transType);
        // ImprestLines.Description := description;
        ImprestLines.Validate(Quantity, quantity);
        ImprestLines."Unit of Measure" := UoM;
        ImprestLines.Validate("Unit Price", price);
        if ImprestLines.Insert(true) then
            exit(true);
    end;

    local procedure getReqLines1LineNo(docNo: Code[20]): Integer
    var
        ImprestLines: Record "Request Lines1";
        lineNo: Integer;
    begin
        lineNo := 0;
        ImprestLines.Reset;
        ImprestLines.SetRange("Document No", docNo);
        if ImprestLines.FindSet then begin
            repeat
                if ImprestLines."Line No." > lineNo then begin
                    lineNo := ImprestLines."Line No.";
                end;
            until ImprestLines.Next = 0;
        end;
        exit(lineNo + 1);
    end;

    procedure fnUpdateImprestLines(docNo: Code[20]; lineNo: Integer; transType: Code[20]; quantity: Decimal; price: Decimal; UoM: Code[10]): Boolean
    var
        ImprestLines: Record "Request Lines1";
        SuccessMsg: Label 'success*Imprest Line updated successfully.';
        ErrMsg: Label 'danger*Imprest Line was not updated. Please try again!';
        NotFoundErr: Label 'danger*Imprest Line was not found. Please contact administrator for assistance!';
    begin
        ImprestLines.Reset();
        ImprestLines.SetRange("Document No", docNo);
        ImprestLines.SetRange("Line No.", lineNo);
        if ImprestLines.FindFirst() then begin
            ImprestLines.Validate("Document No", docNo);
            ImprestLines.Validate("Transaction Type", transType);
            // ImprestLines.Description := description;
            ImprestLines.Validate(Quantity, quantity);
            ImprestLines."Unit of Measure" := UoM;
            ImprestLines.Validate("Unit Price", price);
            if ImprestLines.Modify() then
                exit(true);
        end;

    end;

    procedure fnDeleteImprestLines(docNo: Code[20]; lineNo: Integer): Boolean
    var
        ImprestLines: Record "Request Lines1";
        SuccessMsg: Label 'success*Imprest Line deleted successfully.';
        ErrMsg: Label 'danger*Imprest Line was not deleted. Please try again!';
        NotFoundErr: Label 'danger*Imprest Line was not found. Please contact administrator for assistance!';
    begin
        ImprestLines.Reset();
        ImprestLines.SetRange("Document No", docNo);
        ImprestLines.SetRange("Line No.", lineNo);
        if ImprestLines.FindSet() then begin
            if ImprestLines.Delete() then
                exit(true);
        end;
    end;

    procedure fnInsertImprestSurrender(empID: Code[50]; empNo: Code[20]; impNo: Code[20]) Status: Text
    var
        ImprestHeader: Record "Request Header1";
        SalesSetup: Record "Sales & Receivables Setup";
        UserSetup: Record "User Setup";
        SuccessMsg: Label 'success*Imprest Header inserted successfully.';
        ErrMsg: Label 'danger*Imprest Header was not added. Please try again!';
    begin
        SalesSetup.Get();

        ImprestHeader.Init();
        ImprestHeader."No." := NoSeriesMgt.GetNextNo(SalesSetup."Claim Nos.", 0D, true);
        ImprestHeader."Employee No" := empNo;
        ImprestHeader.Validate("Employee No");
        ImprestHeader."Imprest/Advance No" := impNo;
        ImprestHeader.Validate("Imprest/Advance No");
        ImprestHeader.Type := ImprestHeader.Type::"Claim-Accounting";
        ImprestHeader."Request Date" := Today;
        ImprestHeader."User ID" := empID;
        UserSetup.Reset();
        UserSetup.SetRange("User ID", empID);
        if UserSetup.FindFirst() then
            ImprestHeader."Customer A/C" := UserSetup."Customer A\C";
        if ImprestHeader.Insert() then begin
            Status := ImprestHeader."No."
        end else
            Status := ErrMsg
    end;

    procedure fnUpdateImprestSurrenderLines(docNo: Code[20]; lineNo: Integer; amtSpent: Decimal): Boolean
    var
        ImprestLines: Record "Request Lines1";
        SuccessMsg: Label 'success*Imprest Line inserted successfully.';
        ErrMsg: Label 'danger*Imprest Line was not added. Please try again!';
        NotFoundErr: Label 'danger*Imprest Line was not found. Please contact administrator for assistance!';
    begin
        ImprestLines.Reset();
        ImprestLines.SetRange("Document No", docNo);
        ImprestLines.SetRange("Line No.", lineNo);
        if ImprestLines.FindFirst() then begin
            ImprestLines.Validate("Actual Spent", amtSpent);
            if ImprestLines.Modify() then
                exit(true);
        end;
    end;

    procedure fnGetEmpImprests(empNo: Code[20]) data: Text
    var
        ImprestHeader: Record "Request Header1";
        NotFound: Label 'No matching entries found.';
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange("Employee No", empNo);
        if ImprestHeader.FindSet() then
            data += ImprestHeader."No." + '*' + format(ImprestHeader."Request Date") + '*' + ImprestHeader."Purpose of Imprest" + '*' + format(ImprestHeader."Total Amount Requested") + '::::'
        else
            data := NotFound
    end;

    procedure fnSendImprestForApproval(docNo: Code[20]): Boolean
    var
        Imprest: Record "Request Header1";
        Imprest1: Record "Request Header1";
        ImprestLines: Record "Request Lines1";
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        Var_Variant: Variant;
        NoWorkflowEnabledErr: label 'danger*No related approval workflow is enabled.';
        FailedErr: label 'danger*Approval request failed. Please try again.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
        SuccMsg: label 'success*Approval request sent successfully.';
    begin
        Imprest.Reset();
        Imprest.SetRange("No.", docNo);
        Imprest.SetRange(Status, Imprest.Status::Open);
        Imprest.SetRange(Posted, false);
        if Imprest.FindFirst() then begin

            Var_Variant := Imprest;

            if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(Var_Variant) then begin
                CustomApprovals.OnSendDocForApproval(Var_Variant);

                if Imprest1.Get(Imprest."No.") then begin
                    if (Imprest1.Status = Imprest1.Status::"Pending Approval") OR (Imprest1.Status = Imprest1.Status::Released) then
                        exit(true)
                end;

            end;
        end;

    end;

    procedure fnCancelImprestApproval(docNo: Code[20]): Boolean
    var
        Imprest: Record "Request Header1";
        Imprest1: Record "Request Header1";
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        Var_Variant: Variant;
        NoWorkflowEnabledErr: label 'danger*No related approval workflow is enabled.';
        FailedErr: label 'danger*Request to cancel the document for approval failed. Please try again.';
        NotFoundErr: Label 'danger*The document selected could not be found.';
        SuccMsg: label 'success*Approval request was cancelled successfully.';
    begin
        Imprest.Reset();
        Imprest.SetRange("No.", docNo);
        Imprest.SetRange(Status, Imprest.Status::"Pending Approval");
        Imprest.SetRange(Posted, false);
        if Imprest.FindFirst() then begin

            Var_Variant := Imprest;
            CustomApprovals.OnCancelDocApprovalRequest(Var_Variant);

            if Imprest1.Get(Imprest."No.") then begin
                if Imprest1.Status = Imprest1.Status::Open then
                    exit(true)
            end;

        end;

    end;

    procedure fnCreatePurchRequisition(empNo: Code[20]; requisitionNo: Code[20]; productGroup: Option Goods,Services,Works; location: Code[10]; planningCategory: Code[20]) status: Text
    var
        PurchaseHeader: Record "Purchase Header";
        userSetup: Record "User Setup";
        procSetup: Record "Procurement Setup";
        RequestorId: code[50];
    begin
        procSetup.Get();

        userSetup.reset();
        userSetup.setRange("Employee No.", empNo);
        if userSetup.FindFirst() then
            RequestorId := userSetup."USER ID";

        if requisitionNo = '' then begin
            PurchaseHeader.Init();
            PurchaseHeader."No." := NoSeriesMgt.GetNextNo(procSetup."Purchase Req No", 0D, true);
            PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::"Purchase Requisition");
            PurchaseHeader.Validate("Requisition Type", PurchaseHeader."requisition type"::Project);
            PurchaseHeader."Document Date" := Today;
            PurchaseHeader."Location Code" := location;
            PurchaseHeader."Requisition Product Group" := productGroup;
            PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::Standard;
            PurchaseHeader."Requester ID" := RequestorId;
            PurchaseHeader.Validate("Request-By No.", empNo);
            PurchaseHeader."Procurement Plan ID" := procSetup."Default Procurement Plan";
            PurchaseHeader.Validate("PP Planning Category", planningCategory);
            PurchaseHeader."Order Date" := Today;
            PurchaseHeader."Responsibility Center" := location;
            if PurchaseHeader.Insert() then
                status := PurchaseHeader."No."
            else
                status := 'danger*PRN was not created. Please try again.'
        end else begin
            PurchaseHeader.Reset();
            PurchaseHeader.SetRange("No.", requisitionNo);
            PurchaseHeader.SetRange("Request-By No.", empNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            if PurchaseHeader.FindFirst() then begin
                PurchaseHeader."Location Code" := location;
                PurchaseHeader."Requisition Product Group" := productGroup;
                PurchaseHeader."Procurement Plan ID" := procSetup."Default Procurement Plan";
                PurchaseHeader.Validate("PP Planning Category", planningCategory);
                if PurchaseHeader.Modify() then
                    status := PurchaseHeader."No."
                else
                    status := 'danger*PRN was not updated. Please try again.'
            end else begin
                status := 'danger*A PRN with the No. ' + requisitionNo + 'does not exist. Either the document open or you are not the owner.'
            end;
        end;

        exit(status);
    end;

    procedure fnCreatePurchRequisitionLines(docNo: Code[20]; pplanEntryNo: Integer; quantity: Decimal; technicalSpec: Text): Boolean
    var
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
        NextLineNo: Integer;
    begin
        PurchaseHeader.Reset();
        PurchaseHeader.SetRange("No.", docNo);
        PurchaseHeader.SetRange(status, PurchaseHeader.Status::Open);
        if PurchaseHeader.FindFirst() then begin

            // PurchaseLine.Reset();
            // if PurchaseLine.FindLast() then
            //     NextLineNo := PurchaseLine."Line No." + 1
            // else
            //     NextLineNo := 1;

            PurchaseLine.Init();
            PurchaseLine."Document Type" := PurchaseHeader."Document Type";
            PurchaseLine."Document No." := docNo;
            PurchaseLine."Line No." := getPurchaseLineNo(docNo, PurchaseHeader."Document Type");
            PurchaseLine."Procurement Plan ID" := PurchaseHeader."Procurement Plan ID";
            PurchaseLine."PP Planning Category" := PurchaseHeader."PP Planning Category";
            PurchaseLine."Requisition Product Group" := PurchaseHeader."Requisition Product Group";
            PurchaseLine."Procurement Plan Entry No" := pplanEntryNo;
            PurchaseLine.Validate("Procurement Plan Entry No");
            PurchaseLine.Quantity := quantity;
            PurchaseLine."Technical Specifications" := technicalSpec;
            PurchaseLine.Validate(Quantity);
            PurchaseLine.Validate("Direct Unit Cost");
            if PurchaseLine.Insert() then
                exit(true);
        end;

    end;

    procedure fnUpdatePurchRequisitionLine(docNo: Code[20]; lineNo: Integer; pplanEntryNo: Integer; quantity: Decimal; technicalSpec: Text) status: Text
    var
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document No.", docNo);
        PurchaseLine.SetRange("Line No.", lineNo);
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::"Purchase Requisition");
        if PurchaseHeader.FindFirst() then begin
            PurchaseLine.Validate("Procurement Plan Entry No", pplanEntryNo);
            PurchaseLine.Validate(Quantity, quantity);
            PurchaseLine."Technical Specifications" := technicalSpec;
            if PurchaseLine.Modify() then
                status := 'success*Your Requisition Line has been updated successfully.'
            else
                status := 'danger*Your Requisition Line could not be updated. Please try again.';
        end else begin
            status := 'danger*The Purchase Line does not exist.'
        end;

        exit(status);
    end;

    procedure fnDeletePurchRequisitionLine(docNo: Code[20]; lineNo: Integer) status: Text
    var
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document No.", docNo);
        PurchaseLine.SetRange("Line No.", lineNo);
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::"Purchase Requisition");
        if PurchaseHeader.FindFirst() then begin
            if PurchaseLine.Delete() then
                status := 'success*Your Requisition Line has been deleted successfully.'
            else
                status := 'danger*Your Requisition Line could not be deleted. Please try again.';
        end else begin
            status := 'danger*The Purchase Line does not exist.'
        end;

        exit(status);
    end;

    procedure fnCreateStoreRequisition(empNo: Code[20]; requisitionNo: Code[20]; location: Code[10]; description: Text) status: Text
    var
        PurchaseHeader: Record "Purchase Header";
        userSetup: Record "User Setup";
        procSetup: Record "Procurement Setup";
        RequestorId: code[50];
    begin
        procSetup.Get();

        userSetup.reset();
        userSetup.setRange("Employee No.", empNo);
        if userSetup.FindFirst() then
            RequestorId := userSetup."USER ID";

        if requisitionNo = '' then begin
            PurchaseHeader.Init();
            PurchaseHeader."No." := NoSeriesMgt.GetNextNo(procSetup."Store Req No", 0D, true);
            PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::"Store Requisition");
            PurchaseHeader.Validate("Requisition Type", PurchaseHeader."requisition type"::"Internal Use");
            PurchaseHeader."Document Date" := Today;
            PurchaseHeader."Posting Date" := Today;
            PurchaseHeader."Order Date" := Today;
            PurchaseHeader."Location Code" := location;
            PurchaseHeader."Requester ID" := RequestorId;
            PurchaseHeader.Validate("Request-By No.", empNo);
            PurchaseHeader."Responsibility Center" := location;
            PurchaseHeader.Description := description;
            if PurchaseHeader.Insert() then
                status := PurchaseHeader."No."
            else
                status := 'danger*Store Requisition was not created. Please try again.'
        end else begin
            PurchaseHeader.Reset();
            PurchaseHeader.SetRange("No.", requisitionNo);
            PurchaseHeader.SetRange("Request-By No.", empNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            if PurchaseHeader.FindFirst() then begin
                PurchaseHeader."Location Code" := location;
                PurchaseHeader.Description := description;
                if PurchaseHeader.Modify() then
                    status := PurchaseHeader."No."
                else
                    status := 'danger*Store Requisition was not updated. Please try again.'
            end else begin
                status := 'danger*A Store Requisition with the No. ' + requisitionNo + 'does not exist. Either the document open or you are not the owner.'
            end;
        end;

        exit(status);

    end;

    procedure fnCreateStoreReqLine(docNo: Code[20]; /* itemCategory: Code[20]; */ itemNo: Code[20]; quantity: Decimal): Boolean
    var
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
        NextLineNo: Integer;
        ItemLedg: Record "Item Ledger Entry";
        QtyStore: Decimal;
    begin
        PurchaseHeader.Reset();
        PurchaseHeader.SetRange("No.", docNo);
        PurchaseHeader.SetRange(status, PurchaseHeader.Status::Open);
        if PurchaseHeader.FindFirst() then begin

            // PurchaseLine.Reset();
            // if PurchaseLine.FindLast() then
            //     NextLineNo := PurchaseLine."Line No." + 1
            // else
            //     NextLineNo := 1;

            ItemLedg.Reset();
            ItemLedg.SetRange("Item No.", itemNo);
            if ItemLedg.FindSet() then begin
                ItemLedg.CalcSums(Quantity);
                QtyStore := ItemLedg.Quantity;

                if quantity > QtyStore then
                    exit(false);
            end;

            PurchaseLine.Init();
            PurchaseLine."Document Type" := PurchaseHeader."Document Type";
            PurchaseLine."Document No." := docNo;
            PurchaseLine."Line No." := getPurchaseLineNo(docNo, PurchaseHeader."Document Type");
            // PurchaseLine.Validate(Category, PurchaseLine.Category::Item);
            // PurchaseLine."Item Category" := itemCategory;
            PurchaseLine.Validate("Service/Item Code", itemNo);
            PurchaseLine.Validate("Qty. Requested", quantity);
            PurchaseLine."Quantity To  Issue" := quantity;
            PurchaseLine.Validate(Quantity);
            if PurchaseLine.Insert() then
                exit(true);
        end;
    end;

    procedure fnUpdateStoreReqLine(docNo: Code[20]; lineNo: Integer; /* itemCategory: Code[20]; */ itemNo: Code[20]; quantity: Decimal) status: Text
    var
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document No.", docNo);
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::"Store Requisition");
        PurchaseLine.SetRange("Line No.", lineNo);
        if PurchaseLine.FindFirst() then begin
            // PurchaseLine.Validate("Item Category", itemCategory);
            PurchaseLine.Validate("Service/Item Code", itemNo);
            PurchaseLine.Validate("Qty. Requested", quantity);
            PurchaseLine."Quantity To  Issue" := quantity;
            if PurchaseLine.Modify() then
                status := 'success*Your Requisition Line has been updated successfully.'
            else
                status := 'danger*Your Requisition Line could not be updated. Please try again.';
        end else begin
            status := 'danger*The Requisition Line does not exist.'
        end;

        exit(status);

    end;

    procedure fnDeleteStoreReqLine(docNo: Code[20]; lineNo: Integer) status: Text
    var
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document No.", docNo);
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::"Store Requisition");
        PurchaseLine.SetRange("Line No.", lineNo);
        if PurchaseLine.FindFirst() then begin
            if PurchaseLine.Delete() then
                status := 'success*Your Requisition Line has been deleted successfully.'
            else
                status := 'danger*Your Requisition Line could not be deleted. Please try again.';
        end else begin
            status := 'danger*The Requisition Line does not exist.'
        end;

        exit(status);

    end;

    procedure fnSendStoreReqApproval(DocNo: Code[20]): Boolean
    var
        StoreReqHeader: Record "Purchase Header";
        StoreReqLine: Record "Purchase Line";
        StoreReqHeader1: Record "Purchase Header";
    begin
        StoreReqHeader.Reset();
        StoreReqHeader.SetRange("No.", DocNo);
        StoreReqHeader.SetRange(Status, StoreReqHeader.Status::Open);
        if StoreReqHeader.FindFirst() then begin
            StoreReqLine.Reset();
            StoreReqLine.SetRange("Document Type", StoreReqLine."Document Type"::"Store Requisition");
            StoreReqLine.SetRange("Document No.", StoreReqHeader."No.");
            StoreReqLine.SetRange(Type, StoreReqLine.Type::Item);
            if StoreReqLine.FindSet() then begin
                repeat
                    if StoreReqLine."Qty. Requested" < 1 then
                        Exit(false);

                // if StoreReqLine."Qty. Requested" > StoreReqLine."Quantity In Store" then
                //     Error('Quantity Requested is more than the available quantity.');

                // if StoreReqLine."Quantity To  Issue" = 0 then begin
                //     if StoreReqLine."Qty. Requested" > 0 then begin
                //         StoreReqLine."Quantity To  Issue" := StoreReqLine."Qty. Requested";
                //         StoreReqLine.Modify();
                //     end;
                // end;

                until StoreReqLine.Next() = 0;

                if ApprovalsMgmt.CheckPurchaseApprovalPossible(StoreReqHeader) then
                    ApprovalsMgmt.OnSendPurchaseDocForApproval(StoreReqHeader);

                StoreReqHeader1.Reset();
                StoreReqHeader1.SetRange("No.", DocNo);
                StoreReqHeader1.SetFilter(Status, '<>%1', StoreReqHeader1.Status::Open);
                if StoreReqHeader1.FindFirst() then
                    exit(true);
            end;
        end;
    end;

    procedure fnCancelStoreReqApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        CustomApprovalEntry: Record "Approval Entry";
        tbl_purchaseHeader: Record "Purchase Header";
    begin
        tbl_purchaseHeader.Reset;
        tbl_purchaseHeader.SetRange("Request-By No.", employeeNo);
        tbl_purchaseHeader.SetRange(Status, tbl_purchaseHeader.Status::"Pending Approval");
        tbl_purchaseHeader.SetRange("No.", requisitionNo);
        tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."document type"::"Store Requisition");
        if tbl_purchaseHeader.FindSet then begin
            CustomApprovalEntry.Reset;
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", tbl_purchaseHeader."No.");
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", tbl_purchaseHeader.RecordId);
            if CustomApprovalEntry.FindSet then
                repeat
                    CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                    CustomApprovalEntry.Modify(true);
                until CustomApprovalEntry.Next = 0;
            tbl_purchaseHeader.Status := tbl_purchaseHeader.Status::Open;
            if tbl_purchaseHeader.Modify(true) then
                status := 'success*Your approval request was successfully cancelled';

        end else begin
            status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or is no longer pending approval';
        end;
        exit(status);
    end;

    procedure fnInsertClaimHeader(EmpNo: Code[20]; surrenderNo: Code[20]) status: Text
    var
        ClaimHeader: Record "Request Header1";
        ClaimLines: Record "Request Lines1";
    begin
        ClaimHeader.Init();
        ClaimHeader.Type := ClaimHeader.Type::Refund;
        ClaimHeader.Validate("Employee No", EmpNo);
        ClaimHeader.Validate("Surrender No.", surrenderNo);
        if ClaimHeader.Insert(true) then begin
            ClaimHeader.Validate("Surrender No.", surrenderNo);
            status := ClaimHeader."No."
        end else
            status := 'danger*Claim not inserted';

        exit(status);
    end;

    procedure fnUpdateClaimHeader(DocNo: Code[20]; surrenderNo: Code[20]): Boolean
    var
        ClaimHeader: Record "Request Header1";
        ClaimLines: Record "Request Lines1";
    begin
        ClaimHeader.Reset();
        ClaimHeader.SetRange("No.", DocNo);
        ClaimHeader.SetRange(Type, ClaimHeader.Type::Refund);
        if ClaimHeader.FindFirst() then begin
            ClaimHeader.Validate("Surrender No.", surrenderNo);
            if ClaimHeader.Modify() then
                exit(true);
        end;
    end;

    procedure fnDeleteClaimHeader(DocNo: Code[20]; surrenderNo: Code[20]): Boolean
    var
        ClaimHeader: Record "Request Header1";
        ClaimLines: Record "Request Lines1";
    begin
        ClaimHeader.Reset();
        ClaimHeader.SetRange("No.", DocNo);
        ClaimHeader.SetRange(Type, ClaimHeader.Type::Refund);
        if ClaimHeader.FindFirst() then begin
            ClaimLines.Reset();
            ClaimLines.SetRange("Document No", ClaimHeader."No.");
            if ClaimLines.FindSet() then
                ClaimLines.DeleteAll();
            if ClaimHeader.Delete() then
                exit(true);
        end;
    end;

    procedure fnInsertEmpQualification(EmpNo: Code[20]; QualificationCode: Code[20]; FromDate: Date; ToDate: Date; Type: Integer; Institution: Text) Status: Text
    var
        Emp: Record Employee;
        EmpQualification: Record "Employee Qualification";
    begin
        Emp.Reset();
        Emp.SetRange("No.", EmpNo);
        if Emp.FindFirst() then begin
            EmpQualification.Init();
            EmpQualification."Employee No." := EmpNo;
            EmpQualification."Qualification Code" := QualificationCode;
            EmpQualification."From Date" := FromDate;
            EmpQualification."To Date" := ToDate;
            EmpQualification.Type := Type;
            EmpQualification."Institution/Company" := Institution;
            EmpQualification.Validate("Qualification Code");
            if EmpQualification.Insert() then
                Status := format(EmpQualification."Line No.")
            else
                Status := 'danger*Qualification not inserted';

            exit(status);
        end;
    end;

    procedure fnUploadEmpQualificationDocs()
    var
        Emp: Record Employee;
        EmpQualification: Record "Employee Qualification";
    begin

    end;

    procedure fnInsertHelpDeskIssue(empID: Code[50]; empNo: Code[20]; helpCategory: Code[30]; helpSubCategory: Code[30]; assetNo: Code[20]; issueDescription: Text[2048]) status: Text
    var
        ICTHelp: Record "ICT Helpdesk";
        SalesSetup: Record "ICT Helpdesk Global Parameters";
        Employee: Record Employee;
    begin
        SalesSetup.Get;

        ICTHelp.Init();
        ICTHelp."Job No." := NoSeriesMgt.GetNextNo(SalesSetup."ICT Helpdesk Nos.", 0D, true);
        ICTHelp."HelpDesk Category" := helpCategory;
        ICTHelp."Helpdesk subcategory" := helpSubCategory;
        ICTHelp."ICT Inventory" := assetNo;
        ICTHelp."Description of the issue" := issueDescription;
        ICTHelp."Requesting Officer" := empID;
        ICTHelp.Status := ICTHelp.Status::Open;
        ICTHelp."Request Date" := Today;
        ICTHelp."Request Time" := Time;
        Employee.Reset;
        Employee.SetRange("No.", empNo);
        if Employee.FindFirst() then begin
            ICTHelp."Employee No" := Employee."No.";
            ICTHelp."Requesting Officer Name" := Employee.FullName();
            ICTHelp."Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
            ICTHelp."Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
            ICTHelp.Email := Employee."E-Mail";
            ICTHelp.Phone := Employee."Phone No.";
            ICTHelp.EXT := Employee."Ext.";
        end;
        if ICTHelp.Insert() then
            status := ICTHelp."Job No."
        else
            status := 'danger*Helpdesk Issue not inserted.';
    end;

    procedure fnUpdateHelpDeskIssue(docNo: Code[20]; helpCategory: Code[30]; helpSubCategory: Code[30]; issueDescription: Text[2048]): Boolean
    var
        ICTHelp: Record "ICT Helpdesk";
    begin
        ICTHelp.Reset();
        ICTHelp.SetRange("Job No.", docNo);
        if ICTHelp.FindFirst() then begin
            ICTHelp."HelpDesk Category" := helpCategory;
            ICTHelp."Helpdesk subcategory" := helpSubCategory;
            // ICTHelp."ICT Inventory" := assetNo;
            ICTHelp."Description of the issue" := issueDescription;
            if ICTHelp.Modify() then
                exit(true);
        end;
    end;

    procedure fnSendHelpDeskRequest(docNo: Code[20]): Boolean
    var
        ICTHelp: Record "ICT Helpdesk";
        Emp: Record Employee;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        EmailSubject1: Text;
        EmailBody1: Text;
        EmailRecepient1: List of [Text];
        HelpDeskCategory: Record "ICT Helpdesk Category";
        UserSetup: Record "User Setup";
    begin
        ICTHelp.Reset();
        ICTHelp.SetRange("Job No.", docNo);
        if ICTHelp.FindFirst() then begin
            ICTHelp.TestField("HelpDesk Category");
            ICTHelp.TestField("Description of the issue");
            ICTHelp."Request Date" := Today;
            ICTHelp."Request Time" := Time;
            ICTHelp.Status := ICTHelp.Status::Pending;
            if ICTHelp.Modify() then begin
                HelpDeskCategory.Reset();
                HelpDeskCategory.SetRange(Code, ICTHelp."HelpDesk Category");
                if HelpDeskCategory.FindFirst() then begin
                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", HelpDeskCategory."Category Head");
                    if UserSetup.FindFirst() then begin
                        Emp.Reset();
                        Emp.SetRange("No.", UserSetup."Employee No.");
                        if Emp.Find('-') then begin
                            Emp.TestField("Company E-Mail");
                            EmailRecepient.Add(Emp."Company E-Mail");

                            EmailSubject := 'ICT HELPDESK REQUEST';

                            EmailBody := '<br>Kindly login to the ERP System and attend to the ICT Issue ' + ICTHelp."Description of the issue" + ' from ' + ICTHelp."Requesting Officer Name" + '.' + '</br>';
                            EmailBody += '<br>Best Regards,' + '</br>';
                            EmailBody += 'ERP AUTOMATIC MAILS';

                            EmailMessage.Create(
                                EmailRecepient,
                                EmailSubject,
                                EmailBody,
                                true
                            );

                            Email.Send(EmailMessage);
                        end;
                    end;

                end;
                Emp.Reset;
                Emp.SetRange("No.", ICTHelp."Requesting Officer");
                if Emp.Find('-') then begin
                    Emp.TestField("Company E-Mail");
                    EmailRecepient1.Add(Emp."Company E-Mail");

                    EmailSubject1 := 'ICT HELPDESK REQUEST';

                    EmailBody1 := '<br>Your issue has been received by ICT department Issue No. ' + ICTHelp."Job No." + ' from ' + ICTHelp."Requesting Officer Name" + '.' + '</br>';
                    EmailBody1 += '<br>Best Regards,' + '</br>';
                    EmailBody1 += 'ERP AUTOMATIC MAILS';

                    EmailMessage.Create(
                        EmailRecepient1,
                        EmailSubject1,
                        EmailBody1,
                        true
                    );

                    Email.Send(EmailMessage);

                    exit(true);
                end;
            end;
        end;
    end;

    procedure fnLogin(username: Text; passKey: Text): Boolean
    var
        UserSetup: Record "User Setup";
        CryptoMgmt: Codeunit "Cryptography Management";
    begin
        UserSetup.Reset();
        UserSetup.SetRange("User ID", username);
        UserSetup.SetRange(Password, CryptoMgmt.GenerateHash(passKey, 4));
        if UserSetup.FindFirst() then
            exit(true)
    end;

    procedure fnResetUserPassword(username: Text)
    var
        UserSetup: Record "User Setup";
    begin

    end;

    procedure fnChangeUserPassword(username: Text; newPassword: Text): Boolean
    var
        UserSetup: Record "User Setup";
        CryptoMgmt: Codeunit "Cryptography Management";
    begin
        UserSetup.Reset();
        UserSetup.SetRange("User ID", username);
        if UserSetup.FindFirst() then begin
            UserSetup.Password := CryptoMgmt.GenerateHash(newPassword, 4);
            if UserSetup.Modify() then
                exit(true)
        end;
    end;

    procedure fnCheckPasswordExists(username: Text): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Reset();
        UserSetup.SetRange("User ID", username);
        if UserSetup.FindFirst() then begin
            if UserSetup.Password <> '' then
                exit(true)
        end;
    end;

    procedure fnSendOTP(username: Text): Boolean
    var
        OTPCode: Text;
        RecRef: RecordRef;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        CompInfo: Record "Company Information";
        LicensingPortal: Codeunit "Licensing Portal";
        OTP: Record OTP;
        User: Record "User Setup";
    begin
        CompInfo.Get();
        User.Reset();
        User.SetRange("User ID", username);
        if User.FindFirst() then begin
            EmailSubject := 'PPRA ESS Portal OTP';

            User.TestField("E-Mail");
            EmailRecepient.Add(User."E-Mail");

            Clear(OTPCode);
            OTPCode := LicensingPortal.fnGenerateOTP();

            RecRef.GetTable(User);

            if LicensingPortal.fnStoreOTP(User."User ID", User."E-Mail", User."Phone No.", User."User ID", OTPCode, OTP."OTP Type"::Login, RecRef.Number) then begin

                EmailBody := 'Hello ' + User.UserName + ',';
                EmailBody += '<BR><BR>Your OTP Code is: <B>' + OTPCode + '</B>';
                EmailBody += '<BR><BR>Regards,';
                EmailBody += '<BR>' + CompInfo.Name;

                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                Email.Send(EmailMessage);

                exit(true);
            end;
        end;
    end;

    procedure fnVerifyOTP(username: Text; otpCode: Text[10]): Boolean
    var
        CurrentDT: DateTime;
        ExpiredErr: Label 'danger*The OTP Code entered has already expired. Please request another.';
        OTPFailErr: Label 'danger*OTP verification failed. Please enter valid OTP or request another code.';
        SuccMsg: Label 'success*OTP verification successful.';
        CurrUserID: Code[20];
        PortalUsers: Record "User Setup";
        OTP: Record OTP;
    begin
        PortalUsers.Reset();
        PortalUsers.SetRange("User ID", username);
        if PortalUsers.FindFirst() then begin
            OTP.Reset();
            OTP.SetRange("User ID", PortalUsers."User ID");
            OTP.SetRange("E-Mail", PortalUsers."E-Mail");
            OTP.SetRange("Phone Number", PortalUsers."Phone No.");
            OTP.SetRange("Used", false);
            if OTP.FindLast() then begin
                OTP.Validate(enteredOtp, otpCode);
                if OTP.Modify() then begin
                    if OTP."OTP Code" = OTP.enteredOtp then begin
                        Clear(CurrentDT);
                        CurrentDT := CurrentDateTime;
                        if CurrentDT >= OTP."Expiration Time" then begin
                            // status := ExpiredErr;
                        end else begin
                            OTP.Used := true;
                            if OTP.Modify() then
                                exit(true)
                            //     status := SuccMsg
                            // else
                            //     status := OTPFailErr
                        end;
                    end else begin
                        // status := OTPFailErr;
                    end;
                end else begin
                    // status := OTPFailErr;
                end;
            end else begin
                // status := OTPFailErr;
            end;
        end else begin
            // status := OTPFailErr
        end;

        // exit(status);
    end;

    procedure fnGenerateImprestReport(DocNo: Code[20]) BaseImage: Text
    var
        Imprest: Record "Request Header1";
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        RecRef: RecordRef;
        FileMgmt: Codeunit "File Management";
        Base64: Codeunit "Base64 Convert";
    begin
        Imprest.Reset();
        Imprest.SetRange("No.", DocNo);
        if Imprest.FindSet() then begin
            RecRef.GetTable(Imprest);
            TempBlob.CreateOutStream(OutStr);
            Report.SaveAs(Report::"Imprest-Claim Voucher", '', ReportFormat::Pdf, OutStr, RecRef);
            FileMgmt.BLOBExport(TempBlob, STRSUBSTNO('ImprestClaim_%1.Pdf', Imprest."No."), TRUE);
            TempBlob.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64.ToBase64(InStr);
        end;
    end;

    procedure fnGenerateImpSurrenderReport(DocNo: Code[20]) BaseImage: Text
    var
        Imprest: Record "Request Header1";
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        RecRef: RecordRef;
        FileMgmt: Codeunit "File Management";
        Base64: Codeunit "Base64 Convert";
    begin
        Imprest.Reset();
        Imprest.SetRange("No.", DocNo);
        if Imprest.FindSet() then begin
            RecRef.GetTable(Imprest);
            TempBlob.CreateOutStream(OutStr);
            Report.SaveAs(Report::"Imprest-Surrender Voucher", '', ReportFormat::Pdf, OutStr, RecRef);
            FileMgmt.BLOBExport(TempBlob, STRSUBSTNO('ImprestSurrender_%1.Pdf', Imprest."No."), TRUE);
            TempBlob.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64.ToBase64(InStr);
        end;
    end;
}
