

page 95340 "Audit Committee Member"
{
    PageType = ListPart;
    SourceTable = "Audit Committee Member";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Type field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field("Staff  No."; Rec."Staff  No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff  No. field.';
                }
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Member No. field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("ID/Passport No"; Rec."ID/Passport No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID/Passport No field.';
                }
                field("Tax Registration (PIN) No."; Rec."Tax Registration (PIN) No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Tax Registration (PIN) No. field.';
                }
                field("Member Email"; Rec."Member Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Email field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Days field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Active?"; Rec."Active?")
                {
                    ApplicationArea = Basic;
                    Caption = 'Active?';
                    ToolTip = 'Specifies the value of the Active? field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Previous Appointments")
                {
                    ApplicationArea = Basic;
                    // RunObject = Page "Previous Appointments line";
                    // RunPageLink = "Member No." = field("Member No.");
                    ToolTip = 'Executes the Previous Appointments action.';
                    // trigger OnAction()
                    // var
                    //     CommitteMember: Record "IFS Tender Committee Member";
                    //     CommitteMembers: Page "Previous Appointments line";
                    // begin
                    //     Rec.TestField("Member No.");

                    //     CommitteMember.FilterGroup(2);
                    //     CommitteMember.SetRange("Member No.", Rec."Member No.");
                    //     CommitteMember.SetFilter("Document No.", '%1<>', Rec."Document No.");
                    //     CommitteMember.FilterGroup(0);
                    //     CommitteMembers.SetTableview(CommitteMember);
                    //     CommitteMembers.Editable := false;
                    //     CommitteMembers.Run;
                    // end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec."Committee Type" := 'AUDIT & RISK';
    end;

    var
        Employee: Record Employee;
}

#pragma implicitwith restore

