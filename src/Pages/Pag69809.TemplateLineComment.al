

page 69809 "Template Line Comment"
{
    PageType = ListPart;
    SourceTable = "Screening Templae Line Comment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Additional Comments"; Rec."Additional Comments")
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

