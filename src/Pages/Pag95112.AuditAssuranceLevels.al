

page 95112 "Audit Assurance Levels"
{
    CardPageID = "Audit Asssurance Level";
    PageType = List;
    SourceTable = "Audit Assurance Level";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. Of Findings"; Rec."No. Of Findings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Findings field.';
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

