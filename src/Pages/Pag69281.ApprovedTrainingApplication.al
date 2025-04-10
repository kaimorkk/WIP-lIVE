

page 69281 "Approved Training Application"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Training Requests";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Training Plan No."; Rec."Training Plan No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Plan No. field.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Title field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start DateTime"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start DateTime field.';
                }
                field("End DateTime"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End DateTime field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Venue';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Training Venue field.';
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Provider field.';
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider Name field.';
                }
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Training Type field.';
                }
                field("Training Duration Hrs"; Rec."Training Duration Hrs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Training Duration Hrs field.';
                }
                field("Planned Budget"; Rec."Planned Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planned Budget field.';
                }
                field("Planned No. to be Trained"; Rec."Planned No. to be Trained")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planned No. to be Trained field.';
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Participants field.';
                }
                field("Training Venue Region Code"; Rec."Training Venue Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Venue Region Code field.';
                }
                field("Training Venue Region"; Rec."Training Venue Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Venue Region field.';
                }
                field("Training Responsibility Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Responsibility Code field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control21; "Training App Participants List")
            {
                SubPageLink = "Training Code" = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control1102755004; "Trainings Factbox")
            {
                SubPageLink = Code = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = Comment;
                    ToolTip = 'Executes the Comments action.';
                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    begin
                        DocumentType := Documenttype::"Training Application";

                        /*ApprovalComments.Setfilters(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.SetUpLine(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.RUN;*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        /*DocumentType:=DocumentType::"Training Application";
                        ApprovalEntries.SetRecordFilters(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalEntries.RUN;*/

                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintForm;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //TESTFIELD(Status,Status::Approved);

                        HRTrainingApplications.SetRange(HRTrainingApplications.Code, Rec.Code);
                        if HRTrainingApplications.Find('-') then
                            Report.Run(69122, true, true, HRTrainingApplications);
                    end;
                }
                action("Close Application")
                {
                    ApplicationArea = Basic;
                    Caption = 'Close Application';
                    Image = Close;
                    ToolTip = 'Executes the Close Application action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify(true);
                    end;
                }
                action("Training Participants")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Participants';
                    Image = PersonInCharge;
                    RunObject = Page "Training App Participants List";
                    RunPageLink = "Training Code" = field(Code);
                    ToolTip = 'Executes the Training Participants action.';
                }
                action(ImportParticipants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Participants';
                    ToolTip = 'Executes the Import Participants action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(69120, true, true, Rec);
                        Rec.Reset;
                    end;
                }
            }
            group("Imprest Management")
            {
                Caption = 'Imprest Management';
                action("Create Imprest Memo")
                {
                    ApplicationArea = Basic;
                    Image = Invoice;
                    ToolTip = 'Executes the Create Imprest Memo action.';
                    trigger OnAction()
                    begin
                        //Rec.TESTFIELD("Imprest Created",FALSE);
                        // CreateMemo(Rec);
                    end;
                }
            }
            group("Fee Management")
            {
                Caption = 'Fee Management';
                action("Training Costs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Costs';
                    Image = TaskList;
                    RunObject = Page "Training Cost";
                    RunPageLink = "Training ID" = field(Code);
                    ToolTip = 'Executes the Training Costs action.';
                }
                action("Create Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    Image = Invoice;
                    ToolTip = 'Executes the Create Purchase Requisition action.';
                    trigger OnAction()
                    begin
                        // CreatePurchaseReq(Rec);
                    end;
                }
            }
            group(ActionGroup9)
            {
                action("Notify Procurement")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    ToolTip = 'Executes the Notify Procurement action.';
                    trigger OnAction()
                    begin
                        // CreateNotification(Rec);
                    end;
                }
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Upload Documents';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
        area(processing)
        {
            action("Initiate Leave Request")
            {
                ApplicationArea = Basic;
                Image = AgreementQuote;
                ToolTip = 'Executes the Initiate Leave Request action.';
                trigger OnAction()
                begin
                    // if Confirm('Are you sure you want to initiate a leave request?') = true then begin
                    //     CreateLeave(Rec);
                    // end
                end;
            }
            action("Initiate Deduction Request")
            {
                ApplicationArea = Basic;
                Image = DeactivateDiscounts;
                ToolTip = 'Executes the Initiate Deduction Request action.';
                trigger OnAction()
                begin
                    // if Confirm('Are you sure you want to initiate a payroll deduction on this employee?') = true then begin
                    //     CreatePayrollNotification(Rec);
                    // end
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Initiate Leave Request_Promoted"; "Initiate Leave Request")
                {
                }
                actionref("Create Imprest Memo_Promoted"; "Create Imprest Memo")
                {
                }
                actionref("Create Purchase Requisition_Promoted"; "Create Purchase Requisition")
                {
                }
                actionref("Notify Procurement_Promoted"; "Notify Procurement")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("&Approvals_Promoted"; "&Approvals")
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
                actionref("Close Application_Promoted"; "Close Application")
                {
                }
                actionref("Training Participants_Promoted"; "Training Participants")
                {
                }
                actionref("Training Costs_Promoted"; "Training Costs")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Show', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Comments_Promoted; Comments)
                {
                }
            }
            group(Category_Category7)
            {
                actionref("Initiate Deduction Request_Promoted"; "Initiate Deduction Request")
                {
                }
            }
            group(Category_Category9)
            {
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }
    }

    trigger OnInit()
    begin
        "Course TitleEditable" := true;
        "Purpose of TrainingEditable" := true;
        "Employee DepartmentEditable" := true;
        "Employee NameEditable" := true;
        "Employee No.Editable" := true;
        "Application NoEditable" := true;
        "Responsibility CenterEditable" := true;
    end;

    var
        HREmp: Record Employee;
        EmpNames: Text[40];
        sDate: Date;
        HRTrainingApplications: Record "Training Requests";
        //ApprovalMgt: Codeunit "Approvals Mgmt.";
        ApprovalComments: Page "Approval Comments";

        "Responsibility CenterEditable": Boolean;

        "Application NoEditable": Boolean;

        "Employee No.Editable": Boolean;

        "Employee NameEditable": Boolean;

        "Employee DepartmentEditable": Boolean;

        "Purpose of TrainingEditable": Boolean;

        "Course TitleEditable": Boolean;
        HRTrainingNeed: Record "Job Advert Header";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        // OpenDoc: Codeunit "Release Approval Document";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        UserSetup: Record "User Setup";
        CashMgt: Record "Cash Management Setup";
        ImpNo: Code[30];
        NotificationManagement: Codeunit "Notification Management";
        FileLocation: Text;
        Email1: Text;
        HeaderNo: Code[30];


    procedure TESTFIELDS()
    begin
        Rec.TestField("Course Title");
        Rec.TestField("Start Date");
        Rec.TestField("End Date");
        //TESTFIELD("Duration Units");
        Rec.TestField(Duration);
        Rec.TestField("Approved Cost");
        Rec.TestField(Location);
        Rec.TestField(Commitment);
        Rec.TestField("GL Account");
    end;

    // local procedure CreatePurchaseReq(TrainingRequest: Record "Training Requests")
    // var
    //     PurchaseHeader: Record "Purchase Header";
    //     PurchaseLine: Record "Purchase Line";
    //     Text001: label 'The Purchase requisition. %1,has been succesfully created';
    //     Text002: label 'The purchase requisition for application No %1,has already been created';
    //     Text003: label 'You do not have sufficient rights of Accounts User,consult the system administrator';
    //     TrainingCost: Record "Training Cost";
    // begin
    //     Rec.TestField(Status, Rec.Status::Approved);
    //     UserSetup.Reset;
    //     UserSetup.SetRange("User ID", UserId);
    //     if UserSetup.FindSet then begin
    //         if UserSetup."Accounts User" = true then begin
    //             PurchaseHeader.Reset;
    //             PurchaseHeader.SetRange("Applies-to Doc. No.", TrainingRequest.Code);
    //             if PurchaseHeader.FindSet then begin
    //                 Error(Text002, TrainingRequest.Code);
    //             end else begin
    //                 PurchaseHeader.Init;
    //                 PurchasesPayablesSetup.Get;
    //                 PurchasesPayablesSetup.TestField("Purchase Requisition Nos.");
    //                 NoSeriesManagement.InitSeries(PurchasesPayablesSetup."Purchase Requisition Nos.", PurchaseHeader."No. Series", 0D, HeaderNo, PurchaseHeader."No. Series");
    //                 PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
    //                 PurchaseHeader."No." := HeaderNo;
    //                 PurchaseHeader."Order Date" := Today;
    //                 PurchaseHeader.Description := TrainingRequest.Description;
    //                 PurchaseHeader."Requester ID" := UserId;
    //                 PurchaseHeader."Request-By No." := UserSetup."Employee No.";
    //                 PurchaseHeader."Document Date" := Today;
    //                 PurchaseHeader."Buy-from Vendor No." := TrainingRequest.Provider;
    //                 //PurchaseHeader.VALIDATE("Request-By No.");
    //                 PurchaseHeader."Applies-to Doc. No." := TrainingRequest.Code;
    //                 PurchaseHeader."Posting Description" := TrainingRequest.Description;
    //                 PurchaseHeader.Insert;

    //                 //Insert lines
    //                 TrainingCost.Reset;
    //                 TrainingCost.SetRange("Training ID", TrainingRequest.Code);
    //                 if TrainingCost.FindSet then begin
    //                     repeat
    //                         PurchaseLine.Init;
    //                         PurchaseLine."Line No." := PurchaseLine."Line No." + 100;
    //                         PurchaseLine."Document No." := PurchaseHeader."No.";
    //                         PurchaseLine."Item Category" := TrainingCost."Item Category";
    //                         PurchaseLine."Service/Item Code" := TrainingCost."Service/Item Code";
    //                         PurchaseLine."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
    //                         PurchaseLine.Type := TrainingCost."Account Type";
    //                         PurchaseLine."No." := TrainingCost."G/L Account";
    //                         PurchaseLine.Description := TrainingCost."Cost Item";
    //                         PurchaseLine."Direct Unit Cost" := TrainingCost."Unit Cost (LCY)";
    //                         PurchaseLine.Quantity := TrainingCost.Quantity;
    //                         PurchaseLine.Insert;
    //                     until TrainingCost.Next = 0;
    //                 end;

    //                 Message(Text001, PurchaseHeader."No.");
    //                 Page.Run(70059, PurchaseHeader, PurchaseHeader."No.");
    //             end;
    //         end
    //         else
    //             Error(Text003);
    //     end
    // end;

    // local procedure CreateMemo(TrainingRequest: Record "Training Requests")
    // var
    //     ImprestReq: Record "Imprest Memo";
    //     ImprestLines: Record "Imprest Lines";
    //     TrainingPart: Record "Training Participants";
    //     Text001: label 'The Imprest  Memo %1 has  been created succesfully';
    //     Text002: label 'There are no participants who qualify for imprest';
    //     UserSetup: Record "User Setup";
    //     Email: Text;
    //     Body: Text;
    //     SMTP: Codeunit "Email Message";
    //     Email2: Text[250];
    //     CompInfo: Record "Company Information";
    //     EmailHOD: Text;
    //     ImprestOther: Decimal;
    //     CashMgt: Record "Cash Management Setup";
    //     SMTPT: Record "Email Account";
    //     ProjectMembers: Record "Project Members";
    // begin
    //     ImpNo := '';
    //     //create memo
    //     ImprestReq.Init;
    //     CashMgt.Get;
    //     CashMgt.TestField("Imprest Memo Nos");
    //     NoSeriesManagement.InitSeries(CashMgt."Imprest Memo Nos", CashMgt."Imprest Memo Nos", 0D, ImpNo, CashMgt."Imprest Memo Nos");
    //     ImprestReq."No." := ImpNo;
    //     ImprestReq."Document Type" := ImprestReq."document type"::"Imprest Memo";
    //     ImprestReq."Imprest No." := ImprestReq."No.";
    //     ImprestReq."User ID" := UserId;
    //     UserSetup.Reset;
    //     UserSetup.SetRange("User ID", UserId);
    //     if UserSetup.FindSet then begin
    //         ImprestReq.Requestor := UserSetup."Employee No.";
    //     end;
    //     ImprestReq.Validate(Requestor);
    //     ImprestReq.Date := Today;
    //     ImprestReq."Start Date" := TrainingRequest."Actual Start Date";
    //     ImprestReq."No. of days" := TrainingRequest.Duration;
    //     ImprestReq."Imprest Naration" := TrainingRequest.Location;
    //     ImprestReq."Global Dimension 1 Code" := TrainingPart."Global Dimension 1 Code";
    //     ImprestReq."Global Dimension 2 Code" := TrainingPart."Global Dimension 2 Code";
    //     ImprestReq.Subject := TrainingRequest.Description;
    //     ImprestReq.Insert;

    //     //Team Members
    //     TrainingPart.Reset;
    //     TrainingPart.SetRange("Training Code", TrainingRequest.Code);
    //     TrainingPart.SetFilter("Total Amount", '>%1', 0);
    //     if TrainingPart.FindSet then begin
    //         repeat
    //             ProjectMembers.Init;
    //             ProjectMembers."Imprest Memo No." := ImprestReq."No.";
    //             ProjectMembers."Work Type" := TrainingPart.Destination;
    //             ProjectMembers."Type of Expense" := TrainingPart.Type;
    //             ProjectMembers."No." := TrainingPart."Employee Code";
    //             //ProjectMembers.VALIDATE("No.");

    //             ProjectMembers."Time Period" := TrainingPart."No. of Days";
    //             ProjectMembers.Validate("Work Type");
    //             ProjectMembers.Validate("Time Period");
    //             ProjectMembers.Insert;
    //         //notify every employee
    //         /*
    //                 UserSetup.RESET;
    //                 UserSetup.SETRANGE("Employee No.",TrainingPart."Employee Code");
    //                 IF UserSetup.FINDSET THEN BEGIN
    //                     Email:=UserSetup."E-Mail";
    //                     //send notification email
    //                     SMTPT.GET;
    //                     Email2:=SMTPT."Email Sender Address";
    //                     Body:='IMPREST MEMO FOR'+TrainingRequest.Description;
    //                     //SMTP.Create('IMPREST MEMO',Email2,
    //                     Email,'Training  '+'No: '+TrainingRequest.Code,
    //                     'Dear '+UserSetup."Employee Name"+',<BR><BR>'+'This is to bring to your attention regarding the creation of an imprest memo relating to the training'+
    //                     ' '+TrainingRequest.Description+' '+'</b> kindly login to'
    //                     ,TRUE);

    //                     //SMTP.AddBCC(Email2);
    //                     //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>'+USERID+'<BR>'+'<BR>');
    //                     //SMTP.Send();
    //                   END;
    //                   */
    //         until TrainingPart.Next = 0;
    //         Message(Text001, ImprestReq."No.");
    //         Page.Run(57033, ImprestReq);

    //         TrainingRequest."Imprest Created" := true;
    //         TrainingRequest."Memo No." := ImprestReq."No.";
    //         TrainingRequest.Modify(true);

    //     end else
    //         Message(Text002);

    // end;

    // local procedure CreateNotification(TrainingRequest: Record "Training Requests")
    // var
    //     UserSetup: Record "User Setup";
    //     Email: Text;
    //     Body: Text;
    //     SMTP: Codeunit "Email Message";
    //     Email2: Text[250];
    //     CompInfo: Record "Company Information";
    //     EmailHOD: Text;
    //     ImprestOther: Decimal;
    //     CashMgt: Record "Cash Management Setup";
    //     SMTPT: Record "Email Account";
    // begin
    //     UserSetup.Reset;
    //     UserSetup.SetRange("Procurement Manager", true);
    //     if UserSetup.FindSet then
    //         Email := UserSetup."E-Mail";

    //     //send notification email
    //     // SMTPT.Get;
    //     // Email2 := SMTPT."Email Sender Address";
    //     // Body := 'PROCUREMENT OF ITEMS RELATING TO' + TrainingRequest.Description;
    //     // //SMTP.Create('PROCUREMENT REQUEST', Email2,
    //     // Email, 'Training  ' + 'No: ' + TrainingRequest.Code,
    //     // 'Dear ' + UserSetup."Employee Name" + ',<BR><BR>' + 'This is to bring to your attention regarding the procurement of items relating to the training' +
    //     // ' ' + TrainingRequest.Description + ' ' + '</b> dated from<b>' + Format(TrainingRequest."Start DateTime") + ' ' + '</b> to<b>' + ' '
    //     // , true);

    //     //SMTP.AddBCC(Email2);
    //     FileLocation := 'E:\ERPDocuments\' + TrainingRequest.Code + '.pdf';
    //     //Report.SaveAsPdf(69122, FileLocation, TrainingRequest);
    //     //SMTP.AddAttachment(FileLocation, FileLocation);
    //     //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>' + TrainingRequest."Employee Name" + '<BR>' + '<BR>');
    //     //SMTP.Send();
    // end;

    // local procedure CreateLeave(TrainingRequests: Record "Training Requests")
    // var
    //     HRLeaveApplication: Record "HR Leave Application";
    //     HRLeaveTypes: Record "HR Leave Types";
    //     HRSetup: Record "Human Resources Setup";
    //     LeaveNo: Code[30];
    //     UserSetup: Record "User Setup";
    //     TXT001: label 'The leave application %1,has been created successfully';
    // begin
    //     TrainingRequests.TestField(Status, TrainingRequests.Status::Approved);
    //     LeaveNo := '';

    //     HRLeaveApplication.Init;
    //     HRSetup.Get;
    //     HRSetup.TestField("Leave Application Nos.");
    //     NoSeriesManagement.InitSeries(HRSetup."Leave Application Nos.", HRSetup."Leave Application Nos.", 0D, LeaveNo, HRSetup."Leave Application Nos.");
    //     HRLeaveApplication."Application Code" := LeaveNo;
    //     UserSetup.Reset;
    //     UserSetup.SetRange("User ID", TrainingRequests."Created By");
    //     if UserSetup.FindSet then begin

    //         HRLeaveApplication."Employee No" := UserSetup."Employee No.";
    //         HRLeaveApplication.Validate("Employee No");

    //     end;
    //     //get the leave type
    //     HRLeaveTypes.Reset;
    //     HRLeaveTypes.SetRange("Posting Type", HRLeaveTypes."posting type"::"Study Leave");
    //     if HRLeaveTypes.FindFirst then begin
    //         HRLeaveApplication."Leave Type" := HRLeaveTypes.Code;
    //     end;
    //     HRLeaveApplication.Validate("Leave Type");
    //     HRLeaveApplication."Start Date" := TrainingRequests."Start Date";
    //     HRLeaveApplication.Insert;
    //     Message(TXT001, HRLeaveApplication."Application Code");
    //     Page.Run(69207, HRLeaveApplication);
    // end;

    // local procedure CreatePayrollNotification(TrainingRequest: Record "Training Requests")
    // var
    //     UserSetup: Record "User Setup";
    //     Email: Text;
    //     Body: Text;
    //     SMTP: Codeunit "Email Message";
    //     Email2: Text[250];
    //     CompInfo: Record "Company Information";
    //     EmailHOD: Text;
    //     ImprestOther: Decimal;
    //     CashMgt: Record "Cash Management Setup";
    //     SMTPT: Record "Email Account";
    // begin
    //     UserSetup.Reset;
    //     UserSetup.SetRange("Payroll View", true);
    //     if UserSetup.FindSet then
    //         Email := UserSetup."E-Mail";

    //     //send notification email
    //     // SMTPT.Get;
    //     // Email2 := SMTPT."Email Sender Address";
    //     // //SMTP.Create('PAYROLL DEDUCTION-TRAINING', Email2,
    //     // Email, 'Training  ' + 'No: ' + TrainingRequest.Code,
    //     //   UserSetup."Employee Name" + ',<BR><BR>' + 'This is to bring to your attention that the deduction from payroll for failure ' +
    //     //   'to complete training of ' + TrainingRequest.Description + ' ' + 'valued' + ' <b>Kshs.' + Format(TrainingRequest."Approved Cost") + '</b> dated from<b>' + Format(TrainingRequest."Start DateTime") + ' ' + '</b> to<b>' +
    //     //   ' ' + Format(TrainingRequest."End DateTime") + ' ' +
    //     //   'by' + ' ' + ' Employee No:' + ' ' + TrainingRequest."Employee No." + '-' + ' ' + TrainingRequest."Employee Name" + ' ' + 'should commence on the next payroll processing', true);


    //     //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>' + UserId + '<BR>' + '<BR>');
    //     //SMTP.Send();
    // end;
}

#pragma implicitwith restore

