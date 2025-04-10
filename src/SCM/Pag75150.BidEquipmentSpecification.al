

page 75150 "Bid Equipment Specification"
{
    PageType = List;
    SourceTable = "Bid Equipment Specification";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment Type Code"; Rec."Equipment Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Type Code field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ownership Type field.';
                }
                field("Equipment Serial"; Rec."Equipment Serial")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Serial/Registration No. field.';
                }
                field("Equipment Usability Code"; Rec."Equipment Usability Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Usability Code field.';
                }
                field("Equipment Condition Code"; Rec."Equipment Condition Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Condition Code field.';
                }
                field("Qty of Equipment"; Rec."Qty of Equipment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qty of Equipment field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

