

page 80353 "BR Response Section"
{
    PageType = ListPart;
    SourceTable = "BR Response Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Survey Response ID"; Rec."Survey Response ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Response ID field.';
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Section Completion Instruction"; Rec."Section Completion Instruction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Completion Instruction field.';
                }
                field("No. of Questions"; Rec."No. of Questions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Questions field.';
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Weight % field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("BR Response Question")
            {
                ApplicationArea = Basic;
                Image = Questionaire;
                RunObject = Page "BR Response Question";
                RunPageLink = "Survey Response ID" = field("Survey Response ID"),
                              "Section Code" = field("Section Code");
                ToolTip = 'Executes the BR Response Question action.';
            }
        }
    }
}

#pragma implicitwith restore

