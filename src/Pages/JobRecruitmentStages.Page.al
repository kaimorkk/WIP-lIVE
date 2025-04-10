Page 52193862 "Job Recruitment Stages"
{
    PageType = Card;
    SourceTable = "Job Recruitment stages1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(RecruitmentStage;"Recruitment Stage")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
            group(StageCreteria)
            {
                Caption = 'Stage Creteria';
                action(RecruitmentStageCreteria)
                {
                    ApplicationArea = Basic;
                    Caption = 'Recruitment Stage Creteria';
                    // RunObject = Page "PR Subform";
                    // RunPageLink = "Document Type"=field("Recruitment Stage"),
                    //               "Buy-from Vendor No."=field("Job ID");
                }
            }
        }
    }
}

