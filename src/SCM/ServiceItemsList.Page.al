

page 96009 "Service Items List"
{
    Caption = 'Service Items List';
    Editable = false;
    PageType = List;
    SourceTable = "Service Items";

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field(Capex; Rec.Capex)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000008; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000009; Links)
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

