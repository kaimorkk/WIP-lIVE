

page 80172 "Policy Information Sources"
{
    PageType = List;
    SourceTable = "Policy Information Sources";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("URL Link"; Rec."URL Link")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = URL;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

