# Lab 4: Referential Integrity Write-up

During Part 4 of the practical, I encountered **Error 1451**, which occurred when I tried to delete the department named 'Library and Information Science'. MySQL refused to delete the department because a student record was still linked to it through a foreign key relationship. This is known as referential integrity, which ensures that related records are not accidentally deleted or left without a valid reference.

To fix the error, I first reassigned the student ('Transfer Student') to the Software Engineering department by updating the student's `dept_id`. After that, I successfully deleted the 'Library and Information Science' department because no student was linked to it anymore.

Another possible solution would have been to delete the dependent student record first before deleting the department. However, reassigning the student was the better option because it preserved the student record instead of losing it.