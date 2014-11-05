# has-many-through-polymorphic

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/kyletolle/has-many-through-polymorphic/tree/master)

## My Problem

I want to use a polymorphic realtionship to model an assocation, in this
instance between a `Log` and its `Locations`, which are of type `Country`, or
`CustomLocation`, but there's a catch. The business logic for 'Country' is
different than the other.

In this case, I want to only create an association for existing Countries.
When I use the `has_many ..., through: ..., source: ..., :source_type: ...`
association, Rails' nested attributes allows people to create new countries,
if they don't already exist. This is not something I want, since we have a
static, master list of the countries in the world we reference.

I do want to allow users to create CustomLocations though, since that's the
intent. They're user-specific locations that we didn't account for. So the
standard assocation and nested attributes behavior work well here.

How do I reconcile these differences? How do I take advantage of Rails'
built-in behavior for assocations and nested attributes on this polymorphic
assocation?

## My Solution

My solution is to modify CustomLocations through the `has_many ..., through:
..., source: ..., :source_type: ...` association, and then to modify Countries
through the `LogLocations` join table/model.

See the [demo](https://has-many-through-polymorphic.herokuapp.com/) for how
this works in actuality, and then look at the source for how I did it.

## Ruby Version

2.1.3

## Rails Version

4.1.7

