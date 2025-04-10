Page 52194109 "Appraisal Types"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Appraisal Types1";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(MaxWeighting;"Max. Weighting")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumJobGroup;"Minimum Job Group")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumJobGroup;"Maximum Job Group")
                {
                    ApplicationArea = Basic;
                }
                field(MaxScore;"Max. Score")
                {
                    ApplicationArea = Basic;
                }
                field(UseTemplate;"Use Template")
                {
                    ApplicationArea = Basic;
                }
                field(TemplateLink;"Template Link")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Appraisal)
            {
                Caption = 'Appraisal';
                action(AppraisalFormat)
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisal Format';
                    RunObject = Page "Appraisal Formats";
                    RunPageLink = "Appraisal Code"=field(Code);
                }
            }
        }
    }
}

