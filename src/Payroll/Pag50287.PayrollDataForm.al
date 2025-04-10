page 52193640 "Payroll Data Form"
{
    Caption = 'Payroll Data Form';
    PageType = Card;
    SourceTable = "prBasic pay PCA";
    SourceTableView = where("Document Type" = filter("Payroll Data"));


    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Rec.Status = Rec.Status::Open;
                Caption = 'General';
                field("Change Advice Serial No."; Rec."Change Advice Serial No.")
                {
                    Caption = 'No';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Change Advice Serial No. field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }

                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                    trigger OnValidate()
                    begin

                        Message(Format(STRPOS("Employee Name", '.')));
                    end;
                }
                field("Employee Status"; Rec."Employee Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Status field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Implementing Unit"; Rec."Implementing Unit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit field.';
                }
                field("Duty Station"; Rec."Duty Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }

            }
            group(Bank)
            {
                Caption = 'Bank Details';
                Editable = Rec.Status = Rec.Status::Open;
                field("Change Bank Details"; Rec."Change Bank Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Change Bank Details field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Bank Branch Name"; Rec."Bank Branch Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Branch Name field.';
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Branch field.';
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account Number field.';
                }
                field("Employee's Bank"; Rec."Employee's Bank")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee''s Bank field.';
                }
            }
            group(Payroll)
            {
                Caption = 'Payroll Details';
                Editable = Rec.Status = Rec.Status::Open;
                field("Increment Date"; Rec."Increment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Increment Date field.';
                }
                field("Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incremental Month field.';
                }
                field("Current Job Grade"; Rec."Current Job Grade")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Job Grade field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field(Present; Rec.Present)
                {
                    Caption = 'Salary Notch';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Present field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }

                field("Exit Status"; Rec."Exit Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Status field.';
                }

                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Source Document"; Rec."Source Document")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Document field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
            }
            part(Control6; "prEmployee Trans PCA")
            {
                Caption = 'Payroll Data Form Lines';
                Editable = Rec.Status = Rec.Status::Open;
                //Editable = not Rec."Change Bank Details";
                SubPageLink = "Employee Code" = field("Employee Code"),
                              "Change Advice Serial No." = field("Change Advice Serial No."),
                              "Payroll Period" = field("Payroll Period"),
                              "Document Type" = field("Document Type");
                ApplicationArea = All;
            }
        }
        area(FactBoxes)
        {
            part(Attachments; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50763),
                              "No." = field("Change Advice Serial No.");
            }
            systempart(Control3; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {

        area(processing)
        {
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                ApplicationArea = Basic;
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                ApplicationArea = all;

                trigger OnAction()
                var
                    // ApprovalMgt: Codeunit "Approvals Management";
                    showmessage: Boolean;
                    ManualCancel: Boolean;
                    State: Option Open,"Pending Approval",Cancelled,Approved;
                    DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                    tableNo: Integer;
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    PayPeriod: Record "PR Payroll Periods";
                    docAttachment: Record "Document Attachment";
                begin
                    PayPeriod.Get(Rec."Payroll Period");
                    if PayPeriod.Processing then
                        Error('The payroll for this period is being reconciled and thus, cannot have any new entries.');
                    // docAttachment.Reset();
                    // docAttachment.SetRange("No.", Rec."Change Advice Serial No.");
                    // if not docAttachment.FindFirst() then Error('Attach supporting document(s) Before sending for approval');

                    //Release the Imprest for Approval
                    Rec.TestField(Status, Rec.Status::Open);
                    if Rec."Change Bank Details" then begin
                        Rec.TestField("Employee's Bank");
                        Rec.TestField("Bank Account Number");
                        Rec.TestField("Bank Branch");
                    end;
                    Rec.TestField("Source Document");
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    CurrPage.Close();
                end;
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                ApplicationArea = all;

                trigger OnAction()
                var
                    //  ApprovalMgt: Codeunit "Approvals Management";
                    showmessage: Boolean;
                    ManualCancel: Boolean;
                    State: Option Open,"Pending Approval",Cancelled,Approved;
                    DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                    tableNo: Integer;
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin

                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }

            group(ActionGroup26)
            {
                Caption = 'Post';
                Visible = Inaonekana;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Changes';
                    Image = Process;
                    Visible = Inaonekana;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Approved);
                        Rec.TestField(Rec."Source Document");
                        if Rec.Status <> Rec.Status::Approved then Error('Payroll Data Form must be approved to continue');
                        //Ian Casper****Added to use paychange to update employee bank details****
                        if not Rec."Change Bank Details" then begin
                            //Get
                            mPayrollCode := '';
                            dim1 := '';
                            dim2 := '';
                            dim3 := '';
                            dim4 := '';

                            //-------------------------------------------
                            mPayrollCode := '';

                            UserSetup.Reset;
                            UserSetup.SetRange(UserSetup."User ID", UserId);
                            if UserSetup.Find('-') then begin
                                //  mPayrollCode := UserSetup."Payroll Code";
                            end;

                            objEmp.Reset;
                            objEmp.SetRange(objEmp."No.", Rec."Employee Code");
                            if objEmp.Find('-') then begin
                                // mPayrollCode:=objEmp."Payroll Code";
                                dim1 := objEmp."Global Dimension 1 Code";
                                dim2 := objEmp."Department Code";
                                // dim3 := objEmp.Schools;
                                // dim4 := objEmp.Section;
                            end;

                            objPayrollPeriod.Reset;
                            objPayrollPeriod.SetRange(objPayrollPeriod.Closed, false);
                            if objPayrollPeriod.Find('-') then begin
                                // if objPayrollPeriod."Lock PCA" = true then
                                //   Error('Posting has been locked for the current ' + objPayrollPeriod."Period Name" + ' payroll period');
                                if Rec."Payroll Period" <> objPayrollPeriod."Date Opened" then Error('You cannot post this PCA for this payroll period, kindly change the payroll period');
                                intMonth := objPayrollPeriod."Period Month";
                                intYear := objPayrollPeriod."Period Year";
                                dtPAyrollPeriod := objPayrollPeriod."Date Opened";
                            end;

                            if Confirm('Are you Sure you want to post these change for employee ' + Rec."Employee Code" + '-' + Rec."Employee Name") then begin
                                objEmp.Reset;
                                objEmp.SetRange(objEmp."No.", Rec."Employee Code");
                                if objEmp.Find('-') then begin

                                    objEmp.Status := "Employee Status";
                                    if "Increment Date" <> 0D Then
                                        objEmp."Increment Date" := "Increment Date";
                                    if "Incremental Month" <> '' Then
                                        objEmp."Incremental Month" := "Incremental Month";
                                    if "Current Job Grade" <> '' Then
                                        objEmp."Current Job Grade" := "Current Job Grade";
                                    if "Salary Scale" <> '' Then
                                        objEmp.Validate("Salary Scale", "Salary Scale");
                                    if Present <> '' Then
                                        objEmp.Validate(Present, Present);
                                    if "Basic Pay" <> 0 Then
                                        objEmp."Basic Pay" := "Basic Pay";
                                    if "Exit Status" <> 0 Then
                                        objEmp.Validate("Exit Status", "Exit Status");
                                    if "Employee's Bank" <> '' Then
                                        objEmp.Validate("Employee's Bank", "Employee's Bank");
                                    if "Bank Branch" <> '' Then
                                        objEmp."Bank Branch" := "Bank Branch";
                                    if "Bank Account Number" <> '' Then
                                        objEmp."Bank Account No." := "Bank Account Number";
                                    objEmp.Modify(false);


                                end;

                                objSalCard.Reset;
                                objSalCard.SetRange(objSalCard."Employee Code", Rec."Employee Code");
                                if objSalCard.Find('-') then begin //-------------if old employee then Check changes to the basic pay and update-------------

                                    objSalCard."Basic Pay" := Rec."Basic Pay";
                                    objSalCard."Pays NSSF" := Rec."Pays NSSF";
                                    objSalCard."Pays NHIF" := Rec."Pays NHIF";
                                    objSalCard."Pays PAYE" := Rec."Pays PAYE";
                                    objSalCard."Pays NITA" := Rec."Pays NITA";
                                    Rec.Effected := true;
                                    objSalCard.Modify;
                                    //end;
                                end else begin                     //-------------if new employee insert prsalary card---------------------------------------
                                    objSalCard.Init;
                                    objSalCard."Employee Code" := Rec."Employee Code";
                                    objSalCard."Basic Pay" := Rec."Basic Pay";
                                    objSalCard."Payment Mode" := objSalCard."payment mode"::"Bank Transfer";
                                    objSalCard."Pays NSSF" := true;
                                    objSalCard."Pays NHIF" := true;
                                    objSalCard."Pays PAYE" := true;
                                    objSalCard."Suspend Pay" := false;
                                    objSalCard."Suspension Date" := 0D;
                                    objSalCard."Suspension Reasons" := '';
                                    // objSalCard.Pos := 'PAYROLL';

                                    objSalCard.Insert;
                                end;
                                //-------------if transaction is new insert new-------------------------------------------
                                objEmpTransPCA.Reset;
                                objEmpTransPCA.SetRange(objEmpTransPCA."Employee Code", Rec."Employee Code");
                                objEmpTransPCA.SetRange(objEmpTransPCA."Payroll Period", Rec."Payroll Period");
                                objEmpTransPCA.SetRange(objEmpTransPCA."Change Advice Serial No.", Rec."Change Advice Serial No.");
                                if objEmpTransPCA.Find('-') then begin
                                    repeat
                                    begin

                                        dim1 := objEmpTransPCA."Global Dimension 1 Code";
                                        dim2 := objEmpTransPCA."Global Dimension 2 Code";
                                        dim3 := objEmpTransPCA."Shortcut Dimension 3 Code";
                                        dim4 := objEmpTransPCA."Shortcut Dimension 4 Code";

                                        if dim1 = '' then dim1 := objEmp."Global Dimension 1 Code";
                                        if dim2 = '' then dim2 := objEmp."Department Code";
                                        // if dim3 = '' then dim3 := objEmp.Schools;
                                        // if dim4 = '' then dim4 := objEmp.Section;

                                        /*objEmpTrans.RESET;
                                        objEmpTrans.SETRANGE(objEmpTrans."Employee Code",objEmpTransPCA."Employee Code");
                                        objEmpTrans.SETRANGE(objEmpTrans."Payroll Period",objEmpTransPCA."Payroll Period");
                                        objEmpTrans.SETRANGE(objEmpTrans."Transaction Code",objEmpTransPCA."Transaction Code");
                                        objEmpTrans.SETRANGE(objEmpTrans."Payroll Code",mPayrollCode);
                               //         objEmpTrans.SETRANGE(objEmpTrans."Global Dimension 2 Code",dim2);
                                        IF objEmpTrans.FIND('-') THEN BEGIN
                                 //         objEmpTrans.CALCFIELDS(objEmpTrans."PI Approval Status");
                                 //          IF objEmpTrans."PI Approval Status"<>objEmpTrans."PI Approval Status"::Open THEN ERROR('You cannot post changes to since the is NOT open');
                                        END; */

                                        objEmpTrans.Reset;
                                        objEmpTrans.SetRange(objEmpTrans."Employee Code", objEmpTransPCA."Employee Code");
                                        objEmpTrans.SetRange(objEmpTrans."Payroll Period", objEmpTransPCA."Payroll Period");
                                        objEmpTrans.SetRange(objEmpTrans."Transaction Code", objEmpTransPCA."Transaction Code");
                                        // objEmpTrans.SetRange(objEmpTrans."Payroll Code", mPayrollCode);
                                        if objEmpTrans.Find('-') then begin
                                            if Confirm('The transaction code ' + objEmpTransPCA."Transaction Name" + ' already exists. Do you wish to change it from ' + Format(objEmpTrans.Amount) + ' to this amount ' + Format(objEmpTransPCA.SubTotal)) then begin

                                                objEmpTrans."Employee Code" := objEmpTransPCA."Employee Code";
                                                objEmpTrans."Transaction Code" := objEmpTransPCA."Transaction Code";
                                                objEmpTrans.Validate("Transaction Code");
                                                objEmpTrans."Period Month" := intMonth;
                                                objEmpTrans."Period Year" := intYear;
                                                objEmpTrans."Payroll Period" := dtPAyrollPeriod;
                                                objEmpTrans."Transaction Name" := objEmpTransPCA."Transaction Name";
                                                objEmpTrans.Amount := objEmpTransPCA.SubTotal;
                                                objEmpTrans.Balance := objEmpTransPCA.Balance;
                                                objEmpTrans."Payroll Period" := objEmpTransPCA."Payroll Period";
                                                // objEmpTrans."Payroll Code" := mPayrollCode;
                                                //objEmpTrans."Global Dimension 1 Code":=dim1;
                                                //objEmpTrans."Global Dimension 2 Code":=dim2;
                                                //objEmpTrans."Shortcut Dimension 3 Code":=dim3;
                                                //objEmpTrans."Shortcut Dimension 4 Code":=dim4;
                                                objEmpTrans."Start Date" := objEmpTransPCA."Start Date";
                                                objEmpTrans."End Date" := objEmpTransPCA."End Date";
                                                objEmpTrans.Modify;
                                            end;
                                        end else begin
                                            objEmpTrans.Init;
                                            objEmpTrans."Employee Code" := objEmpTransPCA."Employee Code";
                                            objEmpTrans."Transaction Code" := objEmpTransPCA."Transaction Code";
                                            objEmpTrans.Validate("Transaction Code");
                                            objEmpTrans."Period Month" := intMonth;
                                            objEmpTrans."Period Year" := intYear;
                                            objEmpTrans."Payroll Period" := dtPAyrollPeriod;
                                            objEmpTrans."Transaction Name" := objEmpTransPCA."Transaction Name";
                                            objEmpTrans.Amount := objEmpTransPCA.SubTotal;
                                            objEmpTrans.Balance := objEmpTransPCA.Balance;
                                            objEmpTrans."Payroll Period" := objEmpTransPCA."Payroll Period";
                                            objEmpTrans."Has Insurance Certificate" := objEmpTransPCA."Has Insurance Certificate";
                                            // objEmpTrans."Payroll Code" := mPayrollCode;
                                            //objEmpTrans."Global Dimension 1 Code":=dim1;
                                            //objEmpTrans."Global Dimension 2 Code":=dim2;
                                            //objEmpTrans."Shortcut Dimension 3 Code":=dim3;
                                            //objEmpTrans."Shortcut Dimension 4 Code":=dim4;
                                            objEmpTrans."Start Date" := objEmpTransPCA."Start Date";
                                            objEmpTrans."End Date" := objEmpTransPCA."End Date";
                                            objEmpTrans.Insert;
                                        end;
                                    end;
                                    pension := 0;
                                    pension := Payroll.fnGetSpecialTransAmount(objEmpTransPCA."Employee Code", intMonth, intYear,
            Specialtranstype::"Defined Contribution", false);
                                    if PRtrans.Get(objEmpTransPCA."Transaction Code") then
                                        if PRtrans."Basic Salary Arrears" and (pension > 0) then
                                            InsertPensionArrears(objEmpTransPCA."Employee Code", objEmpTransPCA."Transaction Code", objEmpTransPCA.SubTotal);

                                    until objEmpTransPCA.Next = 0;
                                end;
                            end;
                        end else begin
                            objEmp.Get(Rec."Employee Code");
                            objEmp."Bank Account Number" := Rec."Bank Account Number";
                            objEmp."Bank Branch" := Rec."Bank Branch";
                            objEmp."Employee's Bank" := Rec."Employee's Bank";
                            objEmp.Modify();

                        end;
                        Rec.Effected := true;
                        Rec.Status := Rec.Status::Posted;
                        Rec.Validate("Posted By", UserId);
                        Rec."Posted Date" := CurrentDateTime;
                        Rec.Modify(true);

                        Message('The changes has been uploaded to the current payroll');
                        if Confirm('Do you wish to print the payroll data form?') then begin
                            Rec.Reset();
                            Rec.SetRange("Change Advice Serial No.", Rec."Change Advice Serial No.");
                            // if Rec.Find('-') then
                            //     Report.Run(Report::"Payroll Data Form Report", false, true, Rec);
                        end;
                        CurrPage.CLOSE();

                    end;
                }

            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = PrintForm;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("Change Advice Serial No.", Rec."Change Advice Serial No.");
                    // if Rec.Find('-') then
                    //     Report.Run(Report::"Payroll Data Form Report", true, true, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(sendApproval_Promoted; sendApproval)
                {
                }
                actionref(cancellsApproval_Promoted; cancellsApproval)
                {
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec.Status <> Rec.Status::Open then Error('You cannot modify a PCA if status is not open');
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "Document Type"::"Payroll Data";
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            Rec."Payroll Period" := objPeriod."Date Opened";
            //:=objPeriod."Period Name";
            Rec."Period Month" := objPeriod."Period Month";
            Rec."Period Year" := objPeriod."Period Year";
        end;
        if Rec."User ID" = '' then
            Rec."User ID" := UserId;
    end;

    trigger OnModifyRecord(): Boolean
    begin

        // if Rec.Status <> Rec.Status::Open then Error('You cannot modify a PCA if status is not open');
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields("Department Code");
        if Rec.Status = Rec.Status::Open then begin
            Inaonekana := false;
            Isionekane := true;
        end else
            Isionekane := false;
        if Rec.Status = Rec.Status::"Pending Approval" then
            Inaonekana := false;
        if Rec.Status = Rec.Status::Approved then
            Inaonekana := true;
        if Rec.Status = Rec.Status::Posted then
            Inaonekana := false;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Open then
            Inaonekana := false;
        if Rec.Status = Rec.Status::"Pending Approval" then
            Inaonekana := false;
        if Rec.Status = Rec.Status::Approved then
            Inaonekana := true;
        if Rec.Status = Rec.Status::Posted then
            Inaonekana := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "Document Type"::"Payroll Data";
        if "Change Advice Serial No." = '' then begin
            HrSetup.Get;
            HrSetup.TestField("Payroll Data Form Nos.");
            NoSeriesMgt.InitSeries(HrSetup."Payroll Data Form Nos.", xRec."No. Series", 0D, "Change Advice Serial No.", "No. Series");
            "Change Advice Serial No." += Format(Today, 0, '.<Year4>');
        end;
        if Rec."User ID" = '' then
            Rec."User ID" := UserId;
    end;

    procedure InsertPensionArrears(EmpNo: Text; TransCode: Text; BPArrearsAmount: Decimal)
    begin
        objPayrollPeriod.Reset;
        objPayrollPeriod.SetRange(objPayrollPeriod.Closed, false);
        if objPayrollPeriod.Find('-') then begin
            intMonth := objPayrollPeriod."Period Month";
            intYear := objPayrollPeriod."Period Year";
            dtPAyrollPeriod := objPayrollPeriod."Date Opened";
        end;
        PrVital.get();
        PrVital.TestField("Pension Arrears Employee Code");
        // objEmpTrans.Reset();
        // objEmpTrans.SetRange(objEmpTrans."Employee Code", EmpNo);
        // objEmpTrans.SetRange(objEmpTrans."Transaction Code", TransCode);
        // //objEmpTrans.SetRange(objEmpTrans."Basic Salary Arrears", true);
        // If objEmpTrans.Find('-') then begin
        objEmpTrans2.Reset();
        objEmpTrans2.SetRange(objEmpTrans2."Employee Code", EmpNo);
        objEmpTrans2.SetRange(objEmpTrans2."Transaction Code", PrVital."Pension Arrears Employee Code");
        objEmpTrans2.SetRange("Period Month", intMonth);
        objEmpTrans2.SetRange("Period Year", intYear);
        objEmpTrans2.SetRange(objEmpTrans2."Payroll Period", dtPAyrollPeriod);
        if objEmpTrans2.Find('-') then begin
            objEmpTrans2."Employee Code" := EmpNo;
            objEmpTrans2."Transaction Code" := PrVital."Pension Arrears Employee Code";
            objEmpTrans2.Validate("Transaction Code");
            objEmpTrans2."Period Month" := intMonth;
            objEmpTrans2."Period Year" := intYear;
            objEmpTrans2."Payroll Period" := dtPAyrollPeriod;
            objEmpTrans2.Amount := objEmpTrans2.Amount + BPArrearsAmount * PrVital."Pension Arrears Employee" / 100;
            objEmpTrans2.Modify;
        end else begin
            objEmpTrans3.Init;
            objEmpTrans3."Employee Code" := EmpNo;
            objEmpTrans3."Transaction Code" := PrVital."Pension Arrears Employee Code";
            objEmpTrans3.Validate("Transaction Code");
            objEmpTrans3."Period Month" := intMonth;
            objEmpTrans3."Period Year" := intYear;
            objEmpTrans3."Payroll Period" := dtPAyrollPeriod;
            objEmpTrans3.Amount := BPArrearsAmount * PrVital."Pension Arrears Employee" / 100;
            objEmpTrans3.Insert;
        end;

        // end;

    end;

    var
        objPeriod: Record "pr Payroll Periods";
        uSetup: Record "User Setup";
        mPayrollCode: Code[50];
        objEmp: Record "Employee";
        PRtrans: Record "PR Transaction Codes";
        objSalCard: Record "pr Salary Card";
        objEmpTrans: Record "pr Employee Transactions";
        objEmpTrans2: Record "pr Employee Transactions";
        objEmpTrans3: Record "pr Employee Transactions";
        objEmpTransPCA: Record "prEmployee Trans PCA";
        objPayrollPeriod: Record "pr Payroll Periods";
        intMonth: Integer;
        intYear: Integer;
        dtPAyrollPeriod: Date;
        dim1: Code[50];
        dim2: Code[50];
        dim3: Code[50];
        dim4: Code[50];
        UserSetup: Record "User Setup";
        Inaonekana: Boolean;
        HrSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PrVital: record "PR Vital Setup Info";
        Isionekane: Boolean;
        pension: decimal;
        SpecialTransType: Option "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief";
        Payroll: Codeunit "PR Payroll Processing";



}
