Page 52194371 "Probation Appraisal Criteria S"
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
                field(ScoreCategorySelf;"Score Category(Self)")
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

