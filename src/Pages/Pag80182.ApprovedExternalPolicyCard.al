

page 80182 "Approved External Policy Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = Policy;
    SourceTableView = where(Type = const(External),
                            "Approval Status" = const(Released));

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
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Name field.';
                }
                field(Summary; Rec.Summary)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Summary field.';
                }
                field("Applies-To"; Rec."Applies-To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-To field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsible Person"; Rec."Responsible Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Person field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Date Approved"; Rec."Date Approved")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Approved field.';
                }
                field("Current Version No"; Rec."Current Version No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Version No field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
            }
            part(Control15; "Policy Objectives")
            {
                SubPageLink = "Policy ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
        area(creation)
        {
            group(Entities)
            {
                Caption = 'Entities';
                action("Policy Stakeholder")
                {
                    ApplicationArea = Basic;
                    Image = Salutation;
                    RunObject = Page "Policy Stakeholder";
                    RunPageLink = "Policy ID" = field(Code);
                    ToolTip = 'Executes the Policy Stakeholder action.';
                }
                action("Policy Statement Area")
                {
                    ApplicationArea = Basic;
                    Image = FileContract;
                    RunObject = Page "Policy Statement Area";
                    RunPageLink = "Policy ID" = field(Code);
                    ToolTip = 'Executes the Policy Statement Area action.';
                }
                action("Policy Information Sources")
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    RunObject = Page "Policy Information Sources";
                    RunPageLink = "Policy ID" = field(Code);
                    ToolTip = 'Executes the Policy Information Sources action.';
                }
                action("Policy Version")
                {
                    ApplicationArea = Basic;
                    Image = FiledOverview;
                    RunObject = Page "Policy Version";
                    RunPageLink = "Policy Id" = field(Code);
                    ToolTip = 'Executes the Policy Version action.';
                }
                action("Policy Committee Member")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    RunObject = Page "Policy Committee Member";
                    RunPageLink = "Policy ID" = field(upperlimit(Code));
                    ToolTip = 'Executes the Policy Committee Member action.';
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approval;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    begin
                        // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        PolicyVersion.Init;
                        PolicyVersion."Policy Id" := Rec.Code;
                        PolicyVersion."Version Id" := '1';
                        PolicyVersion.Description := '';
                        PolicyVersion."Revision Date" := Today;
                        PolicyVersion.Insert;

                        Rec."Approval Status" := Rec."approval status"::Released;
                        Rec.Modify;

                        Message('Document has been approved Automatically');
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                        Rec.Modify;
                        Message('Document has been Re-Opened')
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                actionref("Policy Information Sources_Promoted"; "Policy Information Sources")
                {
                }
                actionref("Policy Committee Member_Promoted"; "Policy Committee Member")
                {
                }
                actionref("Policy Stakeholder_Promoted"; "Policy Stakeholder")
                {
                }
                actionref("Policy Statement Area_Promoted"; "Policy Statement Area")
                {
                }
                actionref("Policy Version_Promoted"; "Policy Version")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::External;
    end;

    trigger OnOpenPage()
    begin
        Rec.Type := Rec.Type::External;
    end;

    var
        PolicyVersion: Record "Policy Version";
}

#pragma implicitwith restore

