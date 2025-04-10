

page 50512 "Service Item Cards"
{
    PageType = Card;
    SourceTable = "Service Items";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Service Code"; Rec."Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Service Name"; Rec."Service Name")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Capex; Rec.Capex)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

