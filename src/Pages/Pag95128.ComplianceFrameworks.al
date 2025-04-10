

page 95128 "Compliance Frameworks"
{
    CardPageID = "Compliance Framework";
    PageType = List;
    SourceTable = "Compliance Framework";
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
                field("Framework Category"; Rec."Framework Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Framework Category field.';
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By field.';
                }
                field(Website; Rec.Website)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Website field.';
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

