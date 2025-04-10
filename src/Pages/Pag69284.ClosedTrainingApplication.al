

page 69284 "Closed Training Application"
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Venue';
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
                    Visible = false;
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
            part(Control11; "Attendance Register")
            {
                Caption = 'Attendance Register';
                // SubPageLink = "Training Application No." = field(Code);
                ApplicationArea = Basic;
            }
            part(Control9; "Training Feedback Suggestions")
            {
                SubPageLink = "Training Application No" = field(Code);
                ApplicationArea = Basic;
            }
            group(Evaluation)
            {
                field("Evaluation Summary"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Summary';
                    MultiLine = true;
                    Width = 200;
                    ToolTip = 'Specifies the value of the Evaluation Summary field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Evaluation Summary");
                        Rec."Evaluation Summary".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec."Evaluation Summary");
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec."Evaluation Summary".CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
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
                action("Import Attendance Register")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    ToolTip = 'Executes the Import Attendance Register action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange(Code, Rec.Code);
                        //AttendanceRegister.GetVariables(Rec);
                        //AttendanceRegister.RUN;
                    end;
                }
                action("Trainers Involved")
                {
                    ApplicationArea = Basic;
                    Image = ApplyEntries;
                    RunObject = Page "Trainers Involved";
                    RunPageLink = "Training Application No" = field(Code);
                    ToolTip = 'Executes the Trainers Involved action.';
                }
            }
            group("Report")
            {
                Caption = 'Report';
                action("Post Training Report")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    ToolTip = 'Executes the Post Training Report action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(69133, true, false, Rec);
                    end;
                }
            }
        }
        area(processing)
        {
            action("Update Employee Data")
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Update Employee Data action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to updatae the employees information with this qualification?') = true then begin
                        // UpdateEmployee(Rec);
                    end
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref("Trainers Involved_Promoted"; "Trainers Involved")
                {
                }
                actionref("Post Training Report_Promoted"; "Post Training Report")
                {
                }
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Update Employee Data_Promoted"; "Update Employee Data")
                {
                }
                actionref("Import Attendance Register_Promoted"; "Import Attendance Register")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';
            }
            group(Category_Category5)
            {
                Caption = 'Show', Comment = 'Generated from the PromotedActionCategories property index 4.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Evaluation Summary");
        Rec."Evaluation Summary".CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

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
        //OpenDoc: Codeunit "Release Approval Document";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        UserSetup: Record "User Setup";
        CashMgt: Record "Cash Management Setup";
        ImpNo: Code[30];
        NotificationManagement: Codeunit "Notification Management";
        FileLocation: Text;
        Email1: Text;
        EvaluationSummary: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;


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
    //     Text001: label 'The Invoice No. %1,has been succesfully created';
    //     Text002: label 'The Invoice for application No %1,has already been created';
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
    //                 NoSeriesManagement.InitSeries(PurchasesPayablesSetup."Purchase Requisition Nos.", PurchaseHeader."No. Series", 0D, PurchaseHeader."No.", PurchaseHeader."No. Series");
    //                 PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
    //                 PurchaseHeader."Requester ID" := UserId;
    //                 PurchaseHeader."Request-By No." := UserSetup."Employee No.";
    //                 PurchaseHeader."Document Date" := Today;
    //                 PurchaseHeader."Buy-from Vendor No." := TrainingRequest.Provider;
    //                 PurchaseHeader.Validate("Request-By No.");
    //                 PurchaseHeader."Applies-to Doc. No." := TrainingRequest.Code;
    //                 PurchaseHeader."Posting Description" := TrainingRequest.Description;
    //                 PurchaseHeader.Insert;
    //                 //Insert lines
    //                 TrainingCost.Reset;
    //                 TrainingCost.SetRange("Training ID", TrainingRequest.Code);
    //                 TrainingCost.SetRange(Procurable, true);
    //                 if TrainingCost.FindSet then begin
    //                     repeat
    //                         PurchaseLine.Init;
    //                         PurchaseLine."Line No." := PurchaseLine."Line No." + 100;
    //                         PurchaseLine."Document No." := PurchaseHeader."No.";
    //                         PurchaseLine."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
    //                         PurchaseLine.Type := TrainingCost."Account Type";
    //                         PurchaseLine."No." := TrainingCost."G/L Account";
    //                         PurchaseLine.Description := TrainingCost."Cost Item";
    //                         PurchaseLine."Direct Unit Cost" := TrainingCost."Unit Cost (LCY)";
    //                         PurchaseLine.Quantity := TrainingCost.Quantity;
    //                         PurchaseLine.Validate(Quantity);
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
    //     Text001: label 'The Imprest Requisitions have been created succesfully';
    //     Text002: label 'There are no participants added';
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
    //     ImprestReq.Reset;
    //     ImprestReq.SetRange("Imprest No.", TrainingRequest.Code);
    //     if ImprestReq.FindSet then begin
    //         Error('');
    //     end

    //     else begin
    //         ImpNo := '';
    //         //create individual imprests
    //         ImprestReq.Init;
    //         CashMgt.Get;
    //         CashMgt.TestField("Imprest Memo Nos");
    //         NoSeriesManagement.InitSeries(CashMgt."Imprest Memo Nos", CashMgt."Imprest Memo Nos", 0D, ImpNo, CashMgt."Imprest Memo Nos");
    //         ImprestReq."No." := ImpNo;
    //         ImprestReq."Document Type" := ImprestReq."document type"::"Imprest Memo";
    //         ImprestReq."Imprest No." := ImprestReq."No.";
    //         ImprestReq."User ID" := UserId;
    //         UserSetup.Reset;
    //         UserSetup.SetRange("User ID", UserId);
    //         if UserSetup.FindSet then begin
    //             ImprestReq.Requestor := UserSetup."Employee No.";
    //         end;
    //         ImprestReq.Validate(Requestor);
    //         ImprestReq.Date := Today;
    //         ImprestReq."Start Date" := TrainingRequest."Actual Start Date";
    //         ImprestReq."Global Dimension 1 Code" := TrainingPart."Global Dimension 1 Code";
    //         ImprestReq."Global Dimension 2 Code" := TrainingPart."Global Dimension 2 Code";
    //         ImprestReq.Subject := TrainingRequest.Description;
    //         ImprestReq.Insert;

    //         //Team Members
    //         TrainingPart.Reset;
    //         TrainingPart.SetRange("Training Code", TrainingRequest.Code);
    //         if TrainingPart.FindSet then begin
    //             repeat
    //                 ProjectMembers.Init;
    //                 ProjectMembers."Imprest Memo No." := ImprestReq."No.";
    //                 ProjectMembers."Work Type" := TrainingPart.Destination;
    //                 ProjectMembers."Vote Item" := TrainingPart.Type;
    //                 ProjectMembers."No." := TrainingPart."Employee Code";
    //                 ProjectMembers.Validate("No.");
    //                 ProjectMembers."Time Period" := TrainingPart."No. of Days";
    //                 ProjectMembers.Validate("Work Type");
    //                 ProjectMembers.Validate("Time Period");
    //                 ProjectMembers.Insert;
    //                 //notify every employee
    //                 UserSetup.Reset;
    //                 UserSetup.SetRange("Employee No.", TrainingPart."Employee Code");
    //                 if UserSetup.FindSet then begin
    //                     Email := UserSetup."E-Mail";
    //                     //send notification email
    //                     SMTPT.Get;
    //                     // Email2 := SMTPT."Email Sender Address";
    //                     // Body := 'IMPREST MEMO FOR' + TrainingRequest.Description;
    //                     // //SMTP.Create('IMPREST MEMO', Email2,
    //                     // Email, 'Training  ' + 'No: ' + TrainingRequest.Code,
    //                     // 'Dear ' + UserSetup."Employee Name" + ',<BR><BR>' + 'This is to bring to your attention regarding the creation of an imprest memo relating to the training' +
    //                     // ' ' + TrainingRequest.Description + ' ' + '</b> kindly login to'
    //                     // , true);

    //                     //SMTP.AddBCC(Email2);
    //                     //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>' + UserId + '<BR>' + '<BR>');
    //                     //SMTP.Send();
    //                 end;
    //             until TrainingPart.Next = 0;
    //             Message(Text001);

    //             TrainingRequest."Imprest Created" := true;
    //             TrainingRequest."Memo No." := ImprestReq."No.";
    //             TrainingRequest.Modify(true);
    //             Page.Run(57033, ImprestReq, ImprestReq."No.");
    //         end else
    //             Message(Text002);
    //     end
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
    //     SMTPT.Get;
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

    // local procedure UpdateEmployee(TrainingRequests: Record "Training Requests")
    // var
    //     EmployeeScedule: Record "Employee Scedule";
    //     EmployeeQualification: Record "Employee Qualification";
    //     TrainingCoursesSetup: Record "Training Courses Setup";
    //     UserSetup: Record "User Setup";
    // begin
    //     //check whether hr rights
    //     UserSetup.Reset;
    //     UserSetup.SetRange("User ID", UserId);
    //     if UserSetup.FindFirst then begin
    //         if UserSetup."Update Job Status" = true then begin
    //             EmployeeScedule.Reset;
    //             EmployeeScedule.SetRange(Submitted, false);
    //             EmployeeScedule.SetRange(Type, EmployeeScedule.Type::Attendance);
    //             EmployeeScedule.SetRange("Training Application No.", TrainingRequests.Code);
    //             if EmployeeScedule.FindSet then begin
    //                 repeat
    //                     TrainingCoursesSetup.Reset;
    //                     TrainingCoursesSetup.SetRange(Code, TrainingRequests."Course Title");
    //                     if TrainingCoursesSetup.FindFirst then begin
    //                         //update qualifications
    //                         EmployeeQualification.Init;
    //                         EmployeeQualification."Qualification Code" := TrainingCoursesSetup."Qualification Code";
    //                         EmployeeQualification.Validate("Qualification Code");
    //                         EmployeeQualification.Description := TrainingRequests.Description;
    //                         EmployeeQualification."From Date" := TrainingRequests."Start Date";
    //                         EmployeeQualification."To Date" := TrainingRequests."End Date";
    //                         EmployeeQualification."Specialized Domain Area" := TrainingCoursesSetup.Domain;
    //                         EmployeeQualification.Insert;

    //                     end;
    //                 until EmployeeScedule.Next = 0;
    //                 EmployeeScedule.Submitted := true;
    //                 EmployeeScedule.Modify(true);
    //             end
    //         end else
    //             Error('You do not have sufficient rights to perform this action,consult the system administrator');
    //     end
    // end;
}

#pragma implicitwith restore

