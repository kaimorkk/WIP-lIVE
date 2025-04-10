

page 69319 "Trainers Involved"
{
    PageType = ListPart;
    SourceTable = "Trainers Involved";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID No./Paasport No.';
                }
                field("Trainer Full Name"; Rec."Trainer Full Name")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

