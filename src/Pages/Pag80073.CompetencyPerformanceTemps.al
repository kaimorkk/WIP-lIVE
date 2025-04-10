

page 80073 "Competency Performance Temps"
{
    CardPageID = "Competency Performance Temp";
    Editable = false;
    PageType = List;
    SourceTable = "Competency Per Template";
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
                field("Competency Proficiency Scale"; Rec."Competency Proficiency Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Proficiency Scale field.';
                }
                field("Competency Scoring Model"; Rec."Competency Scoring Model")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Scoring Model field.';
                }
                field("General Instructions"; Rec."General Instructions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Instructions field.';
                }
                field("Global?"; Rec."Global?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global? field.';
                }
                field("Primary Responsibility Center"; Rec."Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Responsibility Center field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Total Assigned Weight %"; Rec."Total Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Assigned Weight % field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

