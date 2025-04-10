query 50008 "G/L Budget Entries_Custom"
{
    QueryType = Normal;
    OrderBy = ascending(G_L_Account_No_);
    elements
    {
        dataitem(G_L_Budget_Entry; "G/L Budget Entry")
        {

            column(Budget_Name; "Budget Name")
            {
            }
            column(GlobalDimension1; "Global Dimension 1 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }

            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
            }
            column(Shortcut_Dimension_4_Code; "Shortcut Dimension 4 Code")
            {
            }
            column(Shortcut_Dimension_5_Code; "Shortcut Dimension 5 Code")
            {
            }
            column(Shortcut_Dimension_6_Code; "Shortcut Dimension 6 Code")
            {
            }
            column(G_L_Account_No_; "G/L Account No.")
            {
            }
            column(Amount; Amount)
            {
                Method = Sum;
            }
            filter(Date; Date)
            {
            }
            filter(Entry_Type; "Entry Type")
            {
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}