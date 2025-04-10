page 75427 "Disposal Committee Member"
{
    PageType = ListPart;
    SourceTable = "IFS Tender Committee Member";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MemberNo; "Member No.")
                {
                    ApplicationArea = Basic;
                }
                field(MemberName; "Member Name")
                {
                    ApplicationArea = Basic;
                }
                field(Role; Role)
                {
                    ApplicationArea = Basic;
                }
                field(MemberEmail; "Member Email")
                {
                    ApplicationArea = Basic;
                }
                // field(TelephoneNo;"Telephone No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Designation;Designation)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(IDPassportNo;"ID/Passport No")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(TaxRegistrationPINNo;"Tax Registration (PIN) No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(StaffNo;"Staff  No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Destination;Destination)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(NoofDays;"No. of Days")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(TotalAmount;"Total Amount")
                // {
                //     ApplicationArea = Basic;
                // }
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
                    RunObject = Page "Previous Appointments line";
                    RunPageLink = "Member No." = field("Member No.");

                    trigger OnAction()
                    var
                        CommitteMember: Record "IFS Tender Committee Member";
                        CommitteMembers: Page "Previous Appointments line";
                    begin
                        TestField("Member No.");

                        CommitteMember.FilterGroup(2);
                        CommitteMember.SetRange("Member No.", "Member No.");
                        CommitteMember.SetFilter("Document No.", '%1<>', "Document No.");
                        CommitteMember.FilterGroup(0);
                        CommitteMembers.SetTableview(CommitteMember);
                        CommitteMembers.Editable := false;
                        CommitteMembers.Run;
                    end;
                }
            }
        }
    }
}

