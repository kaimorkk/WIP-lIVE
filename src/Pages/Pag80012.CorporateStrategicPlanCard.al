

page 80012 "Corporate Strategic Plan Card"
{
    PageType = Card;
    SourceTable = "Corporate Strategic Plans";
    Caption = 'STAJ Card';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Theme"; Rec."Primary Theme")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Theme field.';
                    Visible = false;
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                    Visible = false;
                }
                field("Duration (Years)"; Rec."Duration (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration (Years) field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
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
                    ToolTip = 'Specifies the value of the Implementation Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }

            group("Vision & Mission")
            {
                Visible = false;
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vision Statement field.';
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mission Statement field.';
                }
            }
            group(Activities)
            {
            }
            // part("Corporate Strategic Principles"; "Corporate Strategic Principles")
            // {
            //     SubPageLink = Code = field(Code);
            // }
            part(Control14; "Strategic Initiatives")
            {
                Visible = false;
                Caption = 'Strategic Activities';
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
                    Caption = 'Outcomes';
                    Image = Planning;
                    RunObject = Page "Strategic Theme";
                    RunPageLink = "Strategic Plan ID" = field(Code);
                    ToolTip = 'Executes the Outcomes action.';
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
                // action("Perspective")
                // {
                //     ApplicationArea = Basic;
                //     Image = Planning;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     RunObject = Page "HR Appraisal Perspectives";
                //     RunPageLink = "Strategy Plan ID" = field(Code);
                //     ToolTip = 'Executes the Perspective action.';
                // }
                action("CSP Planned Years")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Years';
                    Image = Planning;
                    RunObject = Page "CSP Planned Years";
                    RunPageLink = "CSP Code" = field(Code);
                    ToolTip = 'Executes the Planned Years action.';
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
            }
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
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
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        CustomApprovalsCodeunit: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        if CustomApprovalsCodeunit.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovalsCodeunit.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        CustomApprovalsCodeunit: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        if CustomApprovalsCodeunit.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovalsCodeunit.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
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
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Core Values_Promoted"; "Core Values")
                {
                }
                actionref("Annual Implementation Plans_Promoted"; "Annual Implementation Plans")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Setup', Comment = 'Generated from the PromotedActionCategories property index 3.';

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
                Caption = 'Attachment', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Print', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref("Print Strategic Plan_Promoted"; "Print Strategic Plan")
                {
                }
                actionref("Print CSP Target vs Actual_Promoted"; "Print CSP Target vs Actual")
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Category7', Comment = 'Generated from the PromotedActionCategories property index 6.';
            }
            group(Category_Category8)
            {
                Caption = 'Category8', Comment = 'Generated from the PromotedActionCategories property index 7.';
            }
            group(Category_Category9)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 8.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
        }
    }

    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

