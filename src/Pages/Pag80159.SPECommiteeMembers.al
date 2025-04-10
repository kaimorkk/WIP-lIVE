

page 80159 "SPE Commitee Members"
{
    PageType = ListPart;
    SourceTable = "SPM Commitee Members";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Chair; Rec.Chair)
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

