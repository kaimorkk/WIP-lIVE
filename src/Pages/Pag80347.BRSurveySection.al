

page 80347 "BR Survey Section"
{
    PageType = ListPart;
    SourceTable = "BR Survey Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
            action("BR Survey Question")
            {
                ApplicationArea = Basic;
                Image = Questionaire;
                RunObject = Page "BR Survey Questions";
                RunPageLink = "Survey ID" = field("Survey ID"),
                              "Section Code" = field("Section Code");
                ToolTip = 'Executes the BR Survey Question action.';
            }
        }
    }
}

#pragma implicitwith restore

