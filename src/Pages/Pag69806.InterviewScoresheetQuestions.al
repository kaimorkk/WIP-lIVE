

page 69806 "Interview Scoresheet Questions"
{
    PageType = ListPart;
    SourceTable = "Hr Screening Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Category"; Rec."Question Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Category field.';
                }
                field("Interview Area"; Rec."Interview Area")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interview Area field.';
                }
                field("Question Id"; Rec."Question Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Id field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field("Minimum Points Accepted"; Rec."Minimum Points Accepted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Points Accepted field.';
                }
                field("Maximum Points Accepted"; Rec."Maximum Points Accepted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Points Accepted field.';
                }
                field("Default Rating Scale"; Rec."Default Rating Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Rating Scale field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Guide)
            {
                action("Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = AddWatch;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Template Score Guide";
                    RunPageLink = "Template Type" = field("Template Type"),
                                  "Template ID" = field("Template ID"),
                                  "Question Category" = field("Question Category"),
                                  "Question ID" = field("Question Id");
                    ToolTip = 'Executes the Score Guide action.';
                }
                action("Comments/Instructions")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Template Line Comment";
                    RunPageLink = "Question ID" = field("Question Id"),
                                  "Template Type" = field("Template Type"),
                                  "Template ID" = field("Template ID"),
                                  "Question Category" = field("Question Category");
                    ToolTip = 'Executes the Comments/Instructions action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

