Page 52194372 "Probation Appraisal Criteria"
{
    PageType = ListPart;
    SourceTable = "Probation Appraisal Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(LowerLimit;"Lower Limit")
                {
                    ApplicationArea = Basic;
                }
                field(UpperLimit;"Upper Limit")
                {
                    ApplicationArea = Basic;
                }
                field(ScoreCategoryAppraiser;"Score Category(Appraiser)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

