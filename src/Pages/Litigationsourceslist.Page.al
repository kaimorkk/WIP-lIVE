Page 52193794 "Litigation sources list"
{
    CardPageID = "Litigation Case Sources";
    Editable = false;
    PageType = List;
    SourceTable = "Litigation Case Sources1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LitigationSourcecode;"Litigation Source code")
                {
                    ApplicationArea = Basic;
                }
                field(LitigationSourceDescription;"Litigation Source Description")
                {
                    ApplicationArea = Basic;
                }
                field(HomePage;"Home Page")
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

