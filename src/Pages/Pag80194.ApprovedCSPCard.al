

page 80194 "Approved CSP Card"
{
    PageType = Card;
    SourceTable = "Corporate Strategic Plans";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Theme"; Rec."Primary Theme")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Theme field.';
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                }
                field("Duration (Years)"; Rec."Duration (Years)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Duration (Years) field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Implementation Status"; Rec."Implementation Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Implementation Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Reasons for Reopening"; Rec."Reasons for Reopening")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reasons for Reopening field.';
                }
            }
            group("Vision & Mission")
            {
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vision Statement field.';
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Mission Statement field.';
                }
            }
            group(Activities)
            {
            }
            part(Control14; "Strategic Initiatives")
            {
                Caption = 'Strategic Activities';
                Editable = false;
                SubPageLink = "Strategic Plan ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            group("Strategy Formulation")
            {
                Caption = 'Strategy Formulation';
                action("SWOT Matrix")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the SWOT Matrix action.';
                }
                action("Risk Matrix")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Risk Matrix action.';
                }
                action("Stakeholder Matrix")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Stakeholder Matrix action.';
                }
            }
            group("Strategy Elements")
            {
                action("Core Values")
                {
                    ApplicationArea = Basic;
                    Image = ValueLedger;
                    RunObject = Page "Strategy Core Value";
                    RunPageLink = "Strategic Plan ID" = field(Code);
                    ToolTip = 'Executes the Core Values action.';
                }
                action("Strategic Theme")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    RunObject = Page "Strategic Theme";
                    RunPageLink = "Strategic Plan ID" = field(Code);
                    ToolTip = 'Executes the Strategic Theme action.';
                }
                action("Strategic Objectives")
                {
                    ApplicationArea = Basic;
                    Image = Route;
                    RunObject = Page "Strategic Objectives";
                    RunPageLink = "Strategic Plan ID" = field(Code);
                    ToolTip = 'Executes the Strategic Objectives action.';
                }
                action(Strategies)
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    RunObject = Page Strategies;
                    RunPageLink = "Strategic Plan ID" = field(Code);
                    ToolTip = 'Executes the Strategies action.';
                }
                action("CSP Planned Years")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Years';
                    Image = Planning;
                    RunObject = Page "CSP Planned Years";
                    RunPageLink = "CSP Code" = field(Code);
                    ToolTip = 'Executes the Planned Years action.';
                }
                action("Print CSP Target vs Actual")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print CSP Target vs Actual Report';
                    Image = Print;
                    ToolTip = 'Executes the Print CSP Target vs Actual Report action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(80012, true, true, Rec)
                    end;
                }
                action("Annual Implementation Plans")
                {
                    ApplicationArea = Basic;
                    Image = CalculatePlan;
                    RunObject = Page "Annual Strategy Workplans";
                    RunPageLink = "Strategy Plan ID" = field(Code);
                    ToolTip = 'Executes the Annual Implementation Plans action.';
                }
            }
            group("Performance Contracts")
            {
                Caption = 'Performance Contracts';
                action("Directorate Per. Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Directorate Per. Contracts action.';
                }
                action("Department Per. Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Department Per. Contracts action.';
                }
                action("Individual Per. Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Individual Per. Contracts action.';
                }
                action("Print Strategic Plan")
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    ToolTip = 'Executes the Print Strategic Plan action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(80001, true, true, Rec)
                    end;
                }
            }
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
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
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = Approval;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        /*//if //ApprovalsMgmt.CheckStrategicPlanApprovalPossible(Rec) THEN
                          //ApprovalsMgmt.IsReceiptApprovalsWorkflowEnabled(Rec);*/
                        Rec.TestField("Reasons for Reopening");
                        Rec."Approval Status" := Rec."approval status"::Open;
                        Rec.Modify;

                        Message('Document Re-Opened Successfully  ');

                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Core Values_Promoted"; "Core Values")
                {
                }
                actionref("Annual Implementation Plans_Promoted"; "Annual Implementation Plans")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("CSP Planned Years_Promoted"; "CSP Planned Years")
                {
                }
                actionref("Strategic Theme_Promoted"; "Strategic Theme")
                {
                }
                actionref("Strategic Objectives_Promoted"; "Strategic Objectives")
                {
                }
                actionref(Strategies_Promoted; Strategies)
                {
                }
            }
            group(Category_Category5)
            {
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
            group(Category_Category6)
            {
                actionref("Print CSP Target vs Actual_Promoted"; "Print CSP Target vs Actual")
                {
                }
                actionref("Print Strategic Plan_Promoted"; "Print Strategic Plan")
                {
                }
            }
            group(Category_Category9)
            {
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
        }
    }

    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

