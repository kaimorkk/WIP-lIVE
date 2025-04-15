namespace ALProjectLIWPA.ALProjectLIWPA;


page 50060 "Staff Claim Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Visible = false;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vote Item';
                    //Editable = true;
                    Editable = false;
                }

                field("Payee Bank Code"; Rec."Payee Bank Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;


                }
                field("Payee Bank Account No."; Rec."Payee Bank Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Payee Bank Acc Name"; Rec."Payee Bank Acc Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Staff Claim";
                }

                field(rbankName; Rec.rbankName)
                {
                    Caption = 'Validated Bank Name';
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

        }
    }
}

#pragma implicitwith restore

