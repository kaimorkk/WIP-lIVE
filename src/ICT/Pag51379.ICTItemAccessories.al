

page 51379 "ICT Item/Accessories"
{
    PageType = List;
    SourceTable = "ICT Equipment";
    SourceTableView = where(Category = filter("Item/Accessory"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Academic ICT Type"; Rec."Academic ICT Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Academic ICT Type field.';
                }
                field("Academic Type Name"; Rec."Academic Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Academic Type Name field.';
                }
                field(Number; Rec.Number)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Category := Rec.Category::"Item/Accessory";
    end;
}

#pragma implicitwith restore

