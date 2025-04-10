Page 52194027 "Appraisal Formats Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Appraisal Formats1";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(AppraisalCode;"Appraisal Code")
                {
                    ApplicationArea = Basic;
                }
                field(LineNo;"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalHeadingType;"Appraisal Heading Type")
                {
                    ApplicationArea = Basic;
                }
                field(StrategicPerspective;"Strategic Perspective")
                {
                    ApplicationArea = Basic;
                }
                field(Value;Value)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Sequence;Sequence)
                {
                    ApplicationArea = Basic;
                }
                field(EntryBy;"Entry By")
                {
                    ApplicationArea = Basic;
                }
                field(AfterEntryOfPrevGroup;"After Entry Of Prev. Group")
                {
                    ApplicationArea = Basic;
                }
                field(AllowPreviousGroupsRights;"Allow Previous Groups Rights")
                {
                    ApplicationArea = Basic;
                }
                field(InPut;"In Put")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalHeader;"Appraisal Header")
                {
                    ApplicationArea = Basic;
                }
                field(Bold;Bold)
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

