Page 52193841 "Mails Send List"
{
    ApplicationArea = Basic;
    CardPageID = "Mails send";
    Editable = false;
    PageType = List;
    SourceTable = "Mails send1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("code";code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Datereceived;"Date received")
                {
                    ApplicationArea = Basic;
                }
                field(Time;Time)
                {
                    ApplicationArea = Basic;
                }
                field(SenderCode;"Addressee code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sender Code';
                }
                field(SenderName;"Addressee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sender Name';
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(AvailableinRegistry;"Available in Registry?")
                {
                    ApplicationArea = Basic;
                }
                field(CategoryName;"Category Name")
                {
                    ApplicationArea = Basic;
                }
                field(Courierdescription;"Courier description")
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

