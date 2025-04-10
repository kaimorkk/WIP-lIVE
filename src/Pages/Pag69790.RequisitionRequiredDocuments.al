

page 69790 "Requisition Required Documents"
{
    PageType = ListPart;
    SourceTable = "Recruitment Req Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("HR Document Type"; Rec."HR Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
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

