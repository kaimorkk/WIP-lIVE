

page 95120 "Audit Opinion Types"
{
    CardPageID = "Audit Opinion Type";
    PageType = List;
    SourceTable = "Audit Opinion Type";
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
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. of Draft Audit Reports"; Rec."No. of Draft Audit Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Draft Audit Reports field.';
                }
                field("No. of Final Audit Reports"; Rec."No. of Final Audit Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Final Audit Reports field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

