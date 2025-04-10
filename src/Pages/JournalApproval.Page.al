Page 52193489 "Journal Approval"
{
    ApplicationArea = Basic;
    CardPageID = "Journal Approval Card";
    Editable = false;
    PageType = List;
    SourceTable = "Journal Approval Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(JournalBatchName; "Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field(JournalTemplateName; "Journal Template Name")
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

