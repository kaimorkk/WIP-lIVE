

page 69448 "HSE Plan"
{
    PageType = Card;
    SourceTable = "HSE Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Plan Type"; Rec."Plan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Management Plan ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Safety Rules&Regulations Temp"; Rec."Safety Rules&Regulations Temp")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety Rules&Regulations Temp field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Primary Mission"; Rec."Primary Mission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Mission field.';
                }
                field("Overall Safety Manager"; Rec."Overall Safety Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Safety Manager field.';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Start Date field.';
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning End Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
            }
            part(Control21; "HSE Plan Lines")
            {
                Caption = 'Hazard Identification & Analysis';
                SubPageLink = "Plan ID" = field("Plan ID"),
                              "Risk Management Plan ID" = field("Risk Management Plan ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Copy OSH Plan")
            {
                ApplicationArea = Basic;
                Image = CopyDocument;
                ToolTip = 'Executes the Copy OSH Plan action.';
                trigger OnAction()
                begin

                    Message('Document Copied successfully and OSH Plan No %1 Created', Rec."Plan ID");
                end;
            }
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                RunObject = Page "HSE Plan Sections";
                RunPageLink = "Plan ID" = field("Plan ID"),
                              "Section Type" = filter(Overview);
                ToolTip = 'Executes the Overview action.';
            }
            action("Goals & Objectives")
            {
                ApplicationArea = Basic;
                Image = GanttChart;
                RunObject = Page "HSE Plan Sections";
                RunPageLink = "Plan ID" = field("Plan ID"),
                              "Section Type" = filter(Objective);
                ToolTip = 'Executes the Goals & Objectives action.';
            }
            action("Guiding Principles")
            {
                ApplicationArea = Basic;
                Image = "Action";
                RunObject = Page "HSE Plan Sections";
                RunPageLink = "Plan ID" = field("Plan ID"),
                              "Section Type" = filter("Guiding Principle");
                ToolTip = 'Executes the Guiding Principles action.';
            }
            action("Roles & Responsibilities")
            {
                ApplicationArea = Basic;
                Image = RollUpCosts;
                RunObject = Page "HSE Roles";
                ToolTip = 'Executes the Roles & Responsibilities action.';
            }
            action("Hazard Identification Methods")
            {
                ApplicationArea = Basic;
                Image = MoveDown;
                RunObject = Page "Hazard Identification Methods";
                ToolTip = 'Executes the Hazard Identification Methods action.';
            }
            action("Legal Instruments & Standards")
            {
                ApplicationArea = Basic;
                Image = StepInto;
                RunObject = Page "OSH Legal Instruments";
                ToolTip = 'Executes the Legal Instruments & Standards action.';
            }
            action("OSH Trainings Calendar")
            {
                ApplicationArea = Basic;
                Image = Track;
                RunObject = Page "HSE Plan Calendars";
                RunPageLink = "OSH Activity Type" = const("OSH Training");
                ToolTip = 'Executes the OSH Trainings Calendar action.';
            }
            action("OSH Meetings Calendar")
            {
                ApplicationArea = Basic;
                Image = Calendar;
                RunObject = Page "HSE Plan Calendars";
                RunPageLink = "OSH Activity Type" = const("OSH Meeting");
                ToolTip = 'Executes the OSH Meetings Calendar action.';
            }
            action("Emergency Drills Calendar")
            {
                ApplicationArea = Basic;
                Image = Calendar;
                RunObject = Page "HSE Plan Calendars";
                RunPageLink = "OSH Activity Type" = filter("Emergency Drill"),
                              "Plan ID" = field("Plan ID");
                ToolTip = 'Executes the Emergency Drills Calendar action.';
            }
            action("Safety Inspections Claendar")
            {
                ApplicationArea = Basic;
                Image = Calendar;
                RunObject = Page "HSE Plan Calendars";
                RunPageLink = "OSH Activity Type" = const("OSH Inspection"),
                              "Plan ID" = field("Plan ID");
                ToolTip = 'Executes the Safety Inspections Claendar action.';
            }
            action("Safety Rules & Regulations Categories")
            {
                ApplicationArea = Basic;
                Caption = 'Safety Rules & Regulations Categories';
                Image = ServiceAgreement;
                RunObject = Page "OSH Rule Template Categories";
                ToolTip = 'Executes the Safety Rules & Regulations Categories action.';
            }
            action("Emergency Contacts")
            {
                ApplicationArea = Basic;
                Image = "Action";
                RunObject = Page "HSE Plan Emergency Contacts";
                RunPageLink = "Plan ID" = field("Plan ID");
                ToolTip = 'Executes the Emergency Contacts action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Plan ID", Rec."Plan ID");
                    if Rec.FindSet then
                        Report.Run(69451, true, true, Rec);//Enter The correct report ID and replace 5000
                end;
            }
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify(true);
                        Message('Approved Successfully');

                        // //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                        //  //ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        //TESTFIELD(Status,Status::Open);
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                        Message('Cancelled Successfully');
                        // //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                        // //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action16)
                {
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify(true);
                        Message('Released Successfully');
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        // usersetup.GET(USERID);
                        // usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        // TESTFIELD("Reasons to Reopen");
                        // ReopenPV.PerformManualReopen(Rec);
                        Rec.TestField(Status, Rec.Status::Released);
                        //TESTFIELD(Status,Status::Open);
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                        Message('Reopened Successfully');
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Copy OSH Plan_Promoted"; "Copy OSH Plan")
                {
                }
            }
            group(Category_Category4)
            {
                actionref(Overview_Promoted; Overview)
                {
                }
                actionref("Goals & Objectives_Promoted"; "Goals & Objectives")
                {
                }
                actionref("Guiding Principles_Promoted"; "Guiding Principles")
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category5)
            {
                actionref("Roles & Responsibilities_Promoted"; "Roles & Responsibilities")
                {
                }
                actionref("Hazard Identification Methods_Promoted"; "Hazard Identification Methods")
                {
                }
                actionref("Legal Instruments & Standards_Promoted"; "Legal Instruments & Standards")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Re&lease_Promoted"; "Re&lease")
                {
                }
                actionref("Re&open_Promoted"; "Re&open")
                {
                }
            }
            group(Category_Category6)
            {
                actionref("OSH Trainings Calendar_Promoted"; "OSH Trainings Calendar")
                {
                }
                actionref("Emergency Drills Calendar_Promoted"; "Emergency Drills Calendar")
                {
                }
                actionref("Safety Inspections Claendar_Promoted"; "Safety Inspections Claendar")
                {
                }
                actionref("OSH Meetings Calendar_Promoted"; "OSH Meetings Calendar")
                {
                }
            }
            group(Category_Category7)
            {
                actionref("Safety Rules & Regulations Categories_Promoted"; "Safety Rules & Regulations Categories")
                {
                }
                actionref("Emergency Contacts_Promoted"; "Emergency Contacts")
                {
                }
            }
            group(Category_Category8)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

