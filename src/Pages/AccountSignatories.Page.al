Page 52193554 "Account Signatories"
{
    PageType = Card;
    SourceTable = "Account Signatories";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                field(Names;Names)
                {
                    ApplicationArea = Basic;
                }
                field(IDNo;"ID No.")
                {
                    ApplicationArea = Basic;
                }
                field(StaffPayrollNo;"Telephone No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff/Payroll No';
                }
                field(DateOfBirth;"Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Control1102760009;Signatory)
                {
                    ApplicationArea = Basic;
                }
                field(MustSign;"Must Sign")
                {
                    ApplicationArea = Basic;
                }
                field(SuspensionDate;"Suspension Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonsforSuspension;"Reasons for Suspension")
                {
                    ApplicationArea = Basic;
                }
                field(MustbePresent;"Must be Present")
                {
                    ApplicationArea = Basic;
                }
                field(ExpiryDate;"Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field(Suspended;Suspended)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Signatory)
            {
                Caption = 'Signatory';
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Account Signatory Card";
                    RunPageLink = "Account No"=field("Account No"),
                                  Names=field(Names);
                }
            }
        }
    }
}

