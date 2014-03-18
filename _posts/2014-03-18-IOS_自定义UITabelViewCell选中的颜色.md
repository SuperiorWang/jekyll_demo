###UITableViewCell的选中时的颜色及tableViewCell的selecte与deselecte
1.系统默认的颜色设置 

	//无色  
	cell.selectionStyle = UITableViewCellSelectionStyleNone;  
  
	//蓝色  
	cell.selectionStyle = UITableViewCellSelectionStyleBlue;  
  
	//灰色  
	cell.selectionStyle = UITableViewCellSelectionStyleGray;
2.自定义颜色和背景设置

 改变UITableViewCell选中时背景色	
 UIColor *color = [[UIColoralloc]initWithRed:0.0green:0.0blue:0.0alpha:1];//通过RGB来定义自己的颜色
 
 	cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];  
	cell.selectedBackgroundView.backgroundColor = [UIColor xxxxxx];  
3.自定义UITableViewCell选中时背景	

	cell.selectedBackgroundView = [[[UIImageView alloc] initWithImage:[UIImage 
										imageNamed:@"cellart.png"]] autorelease];   
	还有字体颜色   
	cell.textLabel.highlightedTextColor = [UIColor xxxcolor];  
	[cell.textLabel setTextColor:c
4.设置tableViewCell间的分割线的颜色

	[theTableView setSeparatorColor:[UIColor xxxx ]];
5.pop返回table时，cell自动取消选中状态	
	
首先我有一个UITableViewController，其中每个UITableViewCell点击后都会push另一个ViewController，每次点击Cell的时候，Cell都会被选中，当从push的ViewController返回的时候选中的Cell便会自动取消选中。后来由于某些原因我把这个UITableViewController改成了UIViewController，之后就产生了一个问题：每次返回到TableView的时候，之前选中的Cell不能自动取消选中，经过查找得知：

UITableViewController有一个clearsSelectionOnViewWillAppear的property，

而当把UITableViewController修改成UIViewController后，这个属性自然就不存在了，因此我们必须手动添加取消选中的功能，方法很简单，在viewWillAppear方法中加入：

	[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] 
	animated:YES];
6.点击后，过段时间cell自动取消选中

	 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath 
	 *)indexPath{
         …………
    	//消除cell选择痕迹
    	[self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
	}
	- (void)deselect
	{
    	[self.tableview deselectRowAtIndexPath:[self.tableview indexPathForSelectedRow] 
    	animated:YES];
	}	