

page 80063 "Perfomance Rating Scale"
{
    PageType = Card;
    SourceTable = "Perfomance Rating Scale";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Scale Type"; Rec."Scale Type")
                {
                    ApplicationArea = Basic;
                }
                field("Max Excellent Raw Score"; Rec."Max Excellent Raw Score")
                {
                    ApplicationArea = Basic;
                }
                field("Least Poor Raw Score"; Rec."Least Poor Raw Score")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control12; "Perfomance Scale Line")
            {
                SubPageLink = "Performance Scale ID" = field(Code),
                              "Scale Type" = field("Scale Type");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

