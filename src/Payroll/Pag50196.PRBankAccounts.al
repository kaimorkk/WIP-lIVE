page 52193582 "PR Bank Accounts"
{
    PageType = List;
    SourceTable = "PR Bank Accounts";
    DataCaptionFields = "Bank Code", "Bank Name";
    Caption = 'Bank List';

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {

                field(BankCode; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(BankName; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(BankType; Rec."Bank Type")
                {
                    ApplicationArea = Basic;
                }
                field(ByPassValidation; Rec.ByPassValidation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ValidateBank field.', Comment = '%';
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Branches)
            {
                ApplicationArea = Basic;
                Image = BankAccount;
                RunObject = Page "PR Bank Branches";
                RunPageLink = "Bank Code" = field("Bank Code");
            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Branches_Promoted; Branches)
                {
                }
            }
        }
    }
}

