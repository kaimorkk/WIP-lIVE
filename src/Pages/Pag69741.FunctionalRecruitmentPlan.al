

page 69741 "Functional Recruitment Plan"
{
    PageType = Card;
    SourceTable = "Recruitment Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field("Annual Recruitment Plan No."; Rec."Annual Recruitment Plan No.")
                {
                    ApplicationArea = Basic;
                    Visible = Editable;
                    ToolTip = 'Specifies the value of the Annual Recruitment Plan No. field.';
                }
                field("Staff Establishement"; Rec."Staff Establishement")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Establishement field.';
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
                field("Approved Staff Establishment"; Rec."Approved Staff Establishment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Staff Establishment field.';
                }
                field("Functional Planned Hires"; Rec."Functional Planned Hires")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functional Planned Hires field.';
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                }

                // field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                // }

                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division Code';
                    ToolTip = 'Specifies the value of the Division Code field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created BY"; Rec."Created BY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created BY field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control26; "Functional Planning Line")
            {
                SubPageLink = "Recruitment Plan ID" = field("Document No."), "Duty Station ID" = field("Duty Station ID"), "Recruitment Plan Type" = field("Recruitment Plan Type");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            // part("Attached Documents"; "Document Attachments")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     SubPageLink = "Table ID" = const(69613),
            //                   "No." = field("Document No.");
            // }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69612, true, false, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';
                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";

                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin

                    VarVariant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);

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
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;

                trigger OnAction()
                var
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin

                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            separator(Action12)
            {
            }
            action("Post To Annual Plan")
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Post To Annual Plan action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Recruitment.PostFuncPlanToAnnual(Rec);
                    Message('Posted Successfully');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Post To Annual Plan_Promoted"; "Post To Annual Plan")
                {
                }
            }
            group(Category_Category9)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Recruitment Plan Type" := Rec."recruitment plan type"::"Functional Plan";
        Rec."Document Date" := Today;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            Visible := false;
            Editable := true;
        end
    end;

    var
        Recruitment: Codeunit Recruitment;
        Visible: Boolean;
        Editable: Boolean;
}

#pragma implicitwith restore

