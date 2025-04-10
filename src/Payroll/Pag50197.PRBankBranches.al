page 52193583 "PR Bank Branches"
{
    PageType = List;
    SourceTable = "PR Bank Branches";
    DataCaptionFields = "Branch Code", "Branch Name", "Bank Name";
    Caption = 'Bank Branches';


    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field(BankCode; "Bank Code")
                {
                    ApplicationArea = All;
                }
                field(BranchCode; "Branch Code")
                {
                    ApplicationArea = All;
                }
                field(BranchName; "Branch Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

