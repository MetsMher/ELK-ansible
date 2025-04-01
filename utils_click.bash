#! /usr/local/python/3.12.1/bin/python3

import click

@click.group() # 1
def cli(): # 2
    pass

@click.group(help='Ship related commands') # 3
def ships():
    pass

cli.add_command(ships) # 4 

@ships.command(help='Sail a ship') # 5
def sail():
    ship_name = "Your ship"
    print(f"{ship_name} is settings sail")

@ships.command(help='List all of the ships')
def list_ships():
    ships = ['John B', 'Yankee Clipper', 'Pequod']
    print(f"Ships: {','.join(ships)}")

@cli.command(help='Talk to a sailor') # 6
@click.option('--greeting', default='Ahoy there', help='Greeting for sailor')
@click.argument('name')
def sailors(greeting, name):
    message = f'{greeting} {name}'
    print(message)
if __name__ == '__main__':
 cli() # 7