
page 52193638 prPayChangeAdvice
{
    PageType = Card;
    SourceTable = "prBasic pay PCA";
    ApplicationArea = all;
    UsageCategory = Lists;
    SourceTableView = where("Document Type" = filter(PCA));

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Rec.Status = Rec.Status::Open;
                field(ChangeAdviceSerialNo; Rec."Change Advice Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Change Bank Details"; Rec."Change Bank Details")
                {
                    ApplicationArea = All;
                    Enabled = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Change Bank Details field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field(EmployeeCode; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Current Job Grade"; Rec."Current Job Grade")
                {
                    Editable = false;
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Current Job Grade field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    Editable = false;
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field(Present; Rec.Present)
                {
                    Editable = false;
                    Caption = 'Salary Notch';
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Present field.';
                }
                field(Designation; Rec.Designation)
                {
                    Editable = false;
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(BasicPay; Rec."Basic Pay")
                {
                    Editable = false;
                    ApplicationArea = Basic;
                }
                field(PaysNSSF; Rec."Pays NSSF")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Editable = false;
                }
                field(PaysNHIF; Rec."Pays NHIF")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;

                }
                field(PaysPAYE; Rec."Pays PAYE")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Pays NITA"; Rec."Pays NITA")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pays NITA field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Subject';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }


                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }


                field(PayrollPeriod; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
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
                field("Source Document"; Rec."Source Document")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Document field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    Caption = 'Reference Details';
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                group("Employee Payroll Status")
                {
                    Visible = Rec."Source Document" = Rec."Source Document"::Disciplinary;
                    field("Employee Status"; Rec."Employee Status")
                    {
                        ApplicationArea = All;

                    }
                    field("Employee Status II"; Rec."Employee Status II")
                    {
                        ApplicationArea = All;
                    }
                }

            }
            group("Primary Bank Details")
            {
                Caption = 'Primary Bank Details';
                Visible = Rec."Change Bank Details";
                Editable = Rec.Status = Rec.Status::Open;
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Account Number field.';
                }
                field("Employee's Bank"; Rec."Employee's Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee''s Bank field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Branch field.';
                }
                field("Bank Branch Name"; Rec."Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Branch Name field.';
                }
            }
            part(Control6; "prEmployee Trans PCA")
            {
                Visible = Rec."Source Document" <> Rec."Source Document"::Mobility;
                Editable = Rec.Status = Rec.Status::Open;
                SubPageLink = "Employee Code" = field("Employee Code"),
                              "Change Advice Serial No." = field("Change Advice Serial No."),
                              "Payroll Period" = field("Payroll Period");
                ApplicationArea = All;
            }
            part(Control61; "prEmployeeTransPCA2")
            {
                Visible = Rec."Source Document" = Rec."Source Document"::Mobility;
                Editable = Rec.Status = Rec.Status::Open;
                SubPageLink = "Employee Code" = field("Employee Code"),
                              "Change Advice Serial No." = field("Change Advice Serial No."),
                              "Payroll Period" = field("Payroll Period");
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Editable = Rec.Status = Rec.Status::Open;
                SubPageLink = "Table ID" = const(50763),
                              "No." = field("Change Advice Serial No.");
            }
            systempart(Control3; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control2; Links)
            {
                ApplicationArea = All;
            }
            systempart(Control1; MyNotes)
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
                    Lines: Record "prEmployee Trans PCA";
                begin
                    PayPeriod.Get(Rec."Payroll Period");
                    if PayPeriod.Processing then
                        Error('The payroll for this period is being reconciled and thus, cannot have any new entries.');

                    docAttachment.Reset();
                    //docAttachment.SetRange("Table ID", tableId);
                    docAttachment.SetRange("No.", Rec."Change Advice Serial No.");
                    // docAttachment.SetRange(ID, RecID);
                    if not docAttachment.find('-') then Error('Attach supporting document(s) Before sending for approval');
                    //Release the Imprest for Approvalportatt
                    Rec.TestField(Status, Rec.Status::Open);
                    if Rec."Change Bank Details" then begin
                        Rec.TestField("Employee's Bank");
                        Rec.TestField("Bank Account Number");
                        Rec.TestField("Bank Branch");
                    end;
                    Lines.Reset();
                    Lines.SetRange("Change Advice Serial No.", Rec."Change Advice Serial No.");
                    if Lines.FindSet() then
                        repeat
                            objTrans.Reset();
                            objTrans.SetRange("Transaction Code", Lines."Transaction Code");
                            objTrans.SetRange("Special Trans Deductions", objTrans."Special Trans Deductions"::"Life Insurance");
                            if objTrans.FindFirst() then begin
                                if not Confirm('There is a life insurance line on the PCA. Have you entered the correct details on the Has Insurance Certificate field? If not, please click No to go back and edit.') then
                                    Error('Process Aborted! Please go back and correct the details on the Has Insurance Certificate field');
                            end;
                        until Lines.Next() = 0;
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
                    Caption = 'Post The Changes';
                    Image = Post;
                    Visible = Inaonekana;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Approved);
                        Rec.TestField(Rec."Source Document");
                        if Rec.Status <> Rec.Status::Approved then Error('Pay Change Advice must be approved to continue');
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
                                //if objPayrollPeriod."Lock PCA" = true then
                                // Error('Posting has been locked for the current ' + objPayrollPeriod."Period Name" + ' payroll period');
                                intMonth := objPayrollPeriod."Period Month";
                                intYear := objPayrollPeriod."Period Year";
                                dtPAyrollPeriod := objPayrollPeriod."Date Opened";
                                if Rec."Payroll Period" <> objPayrollPeriod."Date Opened" then Error('You cannot post this PCA for this payroll period, kindly change the payroll period');
                            end;

                            if Confirm('Are you Sure you want to post these change for employee ' + Rec."Employee Code" + '-' + Rec."Employee Name") then begin
                                /* objEmpTrans.RESET;
                                 objEmpTrans.SETRANGE(objEmpTrans."Employee Code","Employee Code");
                                 objEmpTrans.SETRANGE(objEmpTrans."Payroll Period","Payroll Period");
                                 IF objEmpTrans.FIND('-') THEN
                                 BEGIN
                                  objEmpTrans.DELETEALL(TRUE);
                                 END;
                                */

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
                                    fnTrackChanges('Change in Basic Salary', Format(xRec."Basic Pay"), Format(Rec."Basic Pay"));
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
                                    fnTrackChanges('Change in Basic Salary', Format(xRec."Basic Pay"), Format(Rec."Basic Pay"));
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
                                            if objTrans.Get(objEmpTransPCA."Transaction Code") then begin
                                                if objTrans."Skip Transfer in Next Period" then begin
                                                    if objEmpTransPCA.Balance <= objEmpTransPCA.Amount then
                                                        objEmpTrans."Stop for Next Period" := true;
                                                end;
                                            end;

                                            objEmpTrans.Modify;
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
                                            // objEmpTrans."Payroll Code" := mPayrollCode;
                                            //objEmpTrans."Global Dimension 1 Code":=dim1;
                                            //objEmpTrans."Global Dimension 2 Code":=dim2;
                                            //objEmpTrans."Shortcut Dimension 3 Code":=dim3;
                                            //objEmpTrans."Shortcut Dimension 4 Code":=dim4;
                                            objEmpTrans."Start Date" := objEmpTransPCA."Start Date";
                                            objEmpTrans."End Date" := objEmpTransPCA."End Date";
                                            if objTrans.Get(objEmpTransPCA."Transaction Code") then begin
                                                if objTrans."Skip Transfer in Next Period" then begin
                                                    if objEmpTransPCA.Balance <= objEmpTransPCA.Amount then
                                                        objEmpTrans."Stop for Next Period" := true;
                                                end;
                                            end;
                                            objEmpTrans.Insert;
                                        end;
                                    end;
                                    pension := 0;
                                    pension := Payroll.fnGetSpecialTransAmount(objEmpTransPCA."Employee Code", intMonth, intYear, Specialtranstype::"Defined Contribution", false);
                                    if PRtrans.Get(objEmpTransPCA."Transaction Code") then
                                        if PRtrans."Basic Salary Arrears" and (pension > 0) then
                                            InsertPensionArrears(objEmpTransPCA."Employee Code", objEmpTransPCA."Transaction Code", objEmpTransPCA.SubTotal);

                                    until objEmpTransPCA.Next = 0;
                                end;
                                if Rec."Source Document" = Rec."Source Document"::Disciplinary then begin
                                    if objEmp.Get(Rec."Employee Code") then begin
                                        objEmp.Status := Rec."Employee Status";
                                        objEmp."Employee Status 2" := Rec."Employee Status II";
                                        objEmp.Modify();
                                    end;
                                end;

                                Rec.Effected := true;
                                Rec.Status := Rec.Status::Posted;
                                Rec.Validate("Posted By", UserId);
                                Rec."Posted Date" := CurrentDateTime;
                                Rec.Modify(true);


                            end;
                        end else begin
                            objEmp.Get(Rec."Employee Code");
                            objEmp."Bank Account Number" := Rec."Bank Account Number";
                            objEmp."Bank Branch" := Rec."Bank Branch";
                            objEmp."Employee's Bank" := Rec."Employee's Bank";
                            objEmp.Modify();

                        end;

                        Message('The changes has been uploaded to the current payroll');
                        if Confirm('Do you wish to print the PCA?') then begin
                            Rec.Reset();
                            Rec.SetRange("Change Advice Serial No.", Rec."Change Advice Serial No.");
                            if Rec.Find('-') then
                                Report.Run(Report::PCA, false, true, Rec);
                        end;
                        CurrPage.CLOSE();

                    end;
                }

            }
            action("Cancel Document")
            {
                ApplicationArea = All;
                Image = CancelAllLines;
                Visible = Rec.Status = Rec.Status::Approved;

                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    If Confirm('Do you wish to cancel the document?') then begin
                        Rec.Reset();
                        Rec.SetRange("Change Advice Serial No.", Rec."Change Advice Serial No.");
                        if Rec.Find('-') then
                            Rec.Status := Rec.Status::Cancelled;
                        Rec.Modify();
                        CurrPage.Close();
                    end;
                end;
            }
            action("Re-Open Document")
            {
                ApplicationArea = All;
                Image = OpenWorksheet;
                Visible = Rec.Status = Rec.Status::Posted;

                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    If Confirm('Do you wish to Reopen the document?') then begin
                        Rec.Reset();
                        Rec.SetRange("Change Advice Serial No.", Rec."Change Advice Serial No.");
                        if Rec.Find('-') then
                            Rec.Status := Rec.Status::Approved;
                        Rec.Modify();
                        CurrPage.Close();
                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print';
                Image = PrintForm;

                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("Change Advice Serial No.", Rec."Change Advice Serial No.");
                    if Rec.Find('-') then
                        Report.Run(Report::PCA, true, true, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'ENU=New', Comment = 'Generated from the PromotedActionCategories property index 0.';
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Cancel Document_Promoted"; "Cancel Document")
                {
                }
                actionref("Re-Open Document_Promoted"; "Re-Open Document")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Reports', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';

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
        if Rec.Status = Rec.Status::Open then
            Inaonekana := false;
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
        objEmpTrans2.SetRange(objEmpTrans2."Payroll Period", dtPAyrollPeriod);
        objEmpTrans2.SetRange("Period Month", intMonth);
        objEmpTrans2.SetRange("Period Year", intYear);
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
        objSalCard: Record "pr Salary Card";
        objEmpTrans: Record "pr Employee Transactions";
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
        Fichua: Boolean;
        PRtrans: Record "PR Transaction Codes";
        objEmpTrans2: Record "pr Employee Transactions";
        PrVital: record "PR Vital Setup Info";
        pension: decimal;
        SpecialTransType: Option "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief";
        Payroll: Codeunit "PR Payroll Processing";
        objEmpTrans3: Record "pr Employee Transactions";

        objTrans: Record "PR Transaction Codes";

    procedure fnTrackChanges(columnss: Code[250]; oldValue: Code[250]; NewValue: Code[250])
    var
    //  HRtracker: Record "HR Change Entries";
    begin
        // HRtracker.Init;
        // HRtracker."employee No" := "Employee Code";
        // HRtracker."Change Date" := Today;
        // HRtracker."Change Description" := columnss;
        // HRtracker."Old Value" := oldValue;
        // HRtracker."New Value" := NewValue;
        // HRtracker.UserID := UserId;
        // HRtracker.Insert;
    end;
}

#pragma implicitwith restore

