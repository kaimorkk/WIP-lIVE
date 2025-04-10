page 75362 "Functional Disposal plans"
{
    CardPageID = "Functional Disposal Plan";
    PageType = List;
    SourceTable = "Annual Disposal plan Header";
    SourceTableView = where("Disposal Catetory" = const("Functional Disposal"),
                            "Document Status" = const(Draft));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = All;
                }
                field("Date Created"; "Date Created")
                {
                    ApplicationArea = All;
                }
                field("Time Created"; "Time Created")
                {
                    ApplicationArea = All;
                }
                field("Department Filter"; "Department Filter")
                {
                    ApplicationArea = All;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = All;
                }
            }
        }

    }

    actions
    {
    }
}

